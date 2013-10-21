package com.adage {
	import com.adage.core.ADAGEDataObject;
	import com.adage.utilities.ADAGERequest;
	import flash.display.Stage;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.*;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.HTTPStatusEvent;
	import flash.text.TextField;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Devon Klompmaker
	 */
	public class ADAGE {
		public static var VERSION : String = "drunken_dolphin";

		public static var productionURL : String = "https://adage.gameslearningsociety.org/";
		public static var developmentURL : String = "http://ada.dev.eriainteractive.com/";
		public static var stagingURL : String = "https://adage.gameslearningsociety.org/";
		
		public var gameName : String;
		public var gameVersion : String;
		
		public var staging : Boolean = false;
		public var production : Boolean = false;
		public var pushRate : int = 5;
		public var online : Boolean = false;
		
		private var currentSession : String;
		private var lastPush : int = 0;
		private var clientID : String = "foo";
		private var clientSecret : String = "bar";
		private var auth_token : String;
		
		private var pushData : Array = new Array();
		private var pushTimer : Timer = null;
		
		public function ADAGE(gameName : String, gameVersion : String, timerInMilliseconds : Number = 5000) : void
		{
			this.gameName = gameName;
			this.gameVersion = gameVersion;
			this.pushTimer = new Timer(timerInMilliseconds);
			this.pushTimer.addEventListener(TimerEvent.TIMER, this.PushData);
			this.pushTimer.start();
		}
		
		private function PushData(e : TimerEvent) : void
		{
			if (this.online && pushData.length > 0)
			{
				UploadDataObject(pushData, this.auth_token, null);
				
				pushData = new Array();
			}
		}
		
		public function AddData(dataObject:ADAGEDataObject) : void
		{
			var time : Date = new Date();
			var curTime : Number = time.time;
			var className : String = getQualifiedClassName(dataObject);
			var classNames : Array = className.split("::");
			
			dataObject.gameName = gameName;
			dataObject.gameVersion = gameVersion;
			dataObject.timestamp = curTime.toString();
			dataObject.key = classNames[1];
			dataObject.flashKey = className;
			trace(dataObject.key);
			
			pushData.push(dataObject);
		}
		
		public function get pushURL() : String 
		{
			var url : String = ADAGE.developmentURL;
			
			switch(this.staging)
			{
				case true:
						if (this.production)	
						{
							url = ADAGE.productionURL;
						}
						else
						{
							url = ADAGE.stagingURL;
						}
					break;
				case false:
					url = ADAGE.developmentURL;
					break;
			}
			
			return url;
		}
		
		/**
		 * Authorizes a USER with ADAGE
		 * @param	email
		 * @param	password
		 */
		public function LoginPlayerWithCredentials(email:String, password:String, onSuccess : Function) : void 
		{
			var adage : ADAGE = this;
			
			ADAGERequest.LoginPlayerWithCredentials(this.pushURL + "auth/authorize_unity", this.clientID, this.clientSecret, email, password, function(token : String) : void {
				trace("Successfully authenticated with the server: " + token);
				
				adage.online = true;
				adage.auth_token = token;
				
				if(onSuccess != null) {
					onSuccess(token);
				}
			});
		}
		
		/**
		 * Takes an authorization token and immediately fires the onSuccess function.
		 * @param	token
		 * @param	onSuccess
		 */
		public function LoginPlayerWithAuthorizationToken(token:String, onSuccess : Function) : void 
		{
			this.online = true;
			this.auth_token = token;
			
			if(onSuccess != null) {
				onSuccess(token);
			}
		}
		
		/**
		 * Uploads a Data Object to the server.
		 * You must have a valid auth token.
		 * @param	dataObject
		 * @param	onSuccess
		 */
		public function UploadDataObject(data : Array, auth_token : String, onSuccess : Function) : void
		{
			ADAGERequest.UploadDataObject(this.pushURL + "data_collector.json", data, auth_token, function(e : Event) : void {
				trace("Push Complete: " + e.target.data);
				
				if (onSuccess != null) {
					onSuccess();
				}
			});
		}

	}

}