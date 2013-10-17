package com.adage.core {
	/**
	 * ...
	 * @author 
	 */
	public class ADAGEUploadWrapper 
	{
		public var authentication_token : String;
		public var data : Array;
		
		public function ADAGEUploadWrapper(token:String, data:Array) : void
		{
			this.authentication_token = token;
			this.data = data;
		}
	}

}