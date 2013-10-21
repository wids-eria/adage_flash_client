package com.adage.data {
	/**
	 * ...
	 * @author Devon Klompmaker
	 * A wrapper class for all things positional!
	 */
	public class ADAGEPositionalContext 
	{
		public var x : String;
		public var y : String;
		public var z : String;
		
		public var rotx : String;
		public var roty : String;
		public var rotz : String;
		
		public function ADAGEPositionalContext(_x:Number = 0, _y:Number = 0, _z:Number = 0, _rotx:Number = 0, _roty:Number = 0, _rotz:Number = 0) : void
		{
			this.x = _x.toString();
			this.y = _y.toString();
			this.z = _z .toString();
			this.rotx = _rotx.toString();
			this.roty = _roty.toString();
			this.rotz = _rotz.toString();
		}
	}

}