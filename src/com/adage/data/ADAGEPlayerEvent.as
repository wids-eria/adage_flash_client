package com.adage.data {
	/**
	 * ...
	 * @author Devon Klompmaker
	 */
	public class ADAGEPlayerEvent extends ADAGEEventData 
	{
		public var positional_context : ADAGEPositionalContext = new ADAGEPositionalContext();
		
		public function ADAGEPlayerEvent(positionalContext : ADAGEPositionalContext) : void
		{
			this.positional_context = positionalContext;
		}
	}

}