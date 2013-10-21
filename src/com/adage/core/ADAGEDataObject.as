package com.adage.core {
	import com.adage.ADAGE;
	/**
	 * ...
	 * @author Devon Klompmaker
	 */
	public class ADAGEDataObject 
	{
		public var gameName : String;
		public var gameVersion : String;
		public var ADAVersion : String = ADAGE.VERSION;
		public var session_token : String;
		public var timestamp : String;
		public var key : String;
		public var flashKey : String;
	}

}