package com.adage {
	import com.adage.core.ADAGEDataObject;
	import com.adage.core.ADAGEGameInfo;
	import com.adage.core.ADAGEUser;
	import com.adage.utilities.ADAGERequest;
	import flash.display.Stage;
	import flash.events.SecurityErrorEvent;
	import flash.net.*;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.HTTPStatusEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Devon Klompmaker
	 */
	public class ADAGE {
		public static var VERSION : String = "drunken_dolphin";

		public static var productionURL : String = "https://adage.gameslearningsociety.org/";
		public static var developmentURL : String = "http://ada.dev.eriainteractive.com/";
		public static var stagingURL : String = "https://adage.gameslearningsociety.org/";
		
		public var staging : Boolean = false;
		public var production : Boolean = false;
		public var gameInfo : ADAGEGameInfo;
		public var pushRate : int = 5;
		public var online : Boolean = false;
		
		private var currentSession : String;
		private var user : ADAGEUser;
		private var lastPush : int = 0;
		private var clientID : String = "foo";
		private var clientSecret : String = "bar";
		public var auth_token : String;
		
		/**
		 * Returns the url of which to push data to. 
		 * Automatically assigns the staging, development, or production state.
		 */
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
		 * Authorizes a USER with ADAGE and should (I think) return a token.
		 * @param	email
		 * @param	password
		 */
		public function LoginPlayerWithCredentials(email:String, password:String, onSuccess : Function) : void 
		{
			ADAGERequest.LoginPlayerWithCredentials(this.pushURL + "auth/authorize_unity", this.clientID, this.clientSecret, email, password, function(token : String) : void {
				this.online = true;
				this.auth_token = token;
				
				if(onSuccess != null) {
					onSuccess(token);
				}
			});
		}
		
		/**
		 * Uploads a Data Object to the server.
		 * You must have a valid auth token.
		 * @param	dataObject
		 * @param	onSuccess
		 */
		public function UploadDataObject(dataObject : ADAGEDataObject, onSuccess : Function) : void
		{
			ADAGERequest.UploadDataObject(this.pushURL + "data_collector.json", dataObject, this.auth_token, function(e : Event) : void {
				trace(e.target.data);
				
				if (onSuccess != null) {
					onSuccess();
				}
			});
		}

	}

}