package com.adage.citizenscience {
	import com.adage.data.ADAGEEventData;
	import fl.transitions.easing.Strong;
	/**
	 * ...
	 * @author Devon Klompmaker
	 */
	public class CSEvent extends ADAGEEventData
	{
		public var event : String;
		public var value : String;
		
		public function CSEvent(Key : String, Value : String = null) : void
		{
			this.event = Key;
			this.value = Value;
		}
		
	}

}