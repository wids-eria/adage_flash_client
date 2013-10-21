
package com.adage.utilities {
	
import adobe.utils.CustomActions;
import com.adage.core.ADAGEDataObject;
import com.adage.core.ADAGEUploadWrapper;
import flash.errors.IOError;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.net.*;

	/**
	 * ...
	 * @author Devon Klompmaker
	 */
	public class ADAGERequest {
		
		public static function GET(url:String, onComplete:Function) : void
		{
			var request : URLRequest = new URLRequest(url);
			request.method = URLRequestMethod.GET;
			
			var loader : URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function (e:HTTPStatusEvent) : void {
				trace(e);
			});
			loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent) : void {
				trace(e);
			});
			loader.load(request);
		}
		
		public static function LoginPlayerWithCredentials(url : String, clientID : String, clientSecret : String, email : String, password: String, onComplete : Function) : void
		{
			try
			{
				var params : URLVariables = new URLVariables();
				params.client_id = clientID;
				params.client_secret = clientSecret;
				params.email = email;
				params.password = password;
				params.grant_type = "password";
				
				var request : URLRequest = new URLRequest(url);
				request.method = URLRequestMethod.GET;
				request.data = params;
				
				var loader : URLLoader = new URLLoader();
				loader.dataFormat = URLLoaderDataFormat.TEXT;
				
				loader.addEventListener(Event.COMPLETE, function(e : Event) :void {
					var data : Object = JSON.parse(e.target.data);
					if (data != null) {
						var token : String = data["access_token"];
						onComplete(token);
					}
				});
				
				loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function (e:HTTPStatusEvent) : void {
					trace(e);
				});
				
				loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent) : void {
					trace(e);
				});
				
				loader.load(request);
			}
			catch (error : Error)
			{
				trace(error);
			}

		}
		
		public static function UploadDataObject(url : String, data : Array, token : String, onComplete : Function) : void
		{
			try
			{
				var wrapper : ADAGEUploadWrapper = new ADAGEUploadWrapper(token, data);
				var request : URLRequest = new URLRequest(url);
				request.method = URLRequestMethod.POST;
				request.contentType = "application/jsonrequest";
				request.data = JSON.stringify(wrapper);
				
				trace(request.data);
				
				var loader : URLLoader = new URLLoader();
				loader.dataFormat = URLLoaderDataFormat.TEXT;
				
				loader.addEventListener(Event.COMPLETE, onComplete);
				
				loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, function (e:HTTPStatusEvent) : void {
					trace(e);
				});
				
				loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent) : void {
					trace(e);
				});
				
				loader.load(request);
			}
			catch (exception : Error)
			{
				trace(exception);
			}
		}
		
	}

}