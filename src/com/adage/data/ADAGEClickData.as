package com.adage.data {
	import com.adage.core.ADAGEDataObject;
	/**
	 * ...
	 * @author 
	 */
	public class ADAGEClickData extends ADAGEDataObject
	{
		public var screen_x : String;
		public var screen_y : String;
		
		public function ADAGEClickData(x : Number, y : Number) : void
		{
			this.screen_x = x.toString();
			this.screen_y = y.toString();
		}
		
	}

}