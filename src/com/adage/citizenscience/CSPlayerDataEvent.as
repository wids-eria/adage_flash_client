package com.adage.citizenscience {
	import com.adage.data.ADAGEEventData;
	import com.adage.data.ADAGEPositionalContext;
	
	/**
	 * ...
	 * @author Devon Klompmaker
	 */
	public class CSPlayerDataEvent extends ADAGEEventData 
	{
		public var positional_context : ADAGEPositionalContext;
		
		public function CSPlayerDataEvent(posContext : ADAGEPositionalContext) : void
		{
			this.positional_context = posContext;
		}
	}

}