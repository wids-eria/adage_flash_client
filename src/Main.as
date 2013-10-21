package {
	import com.adage.ADAGE;
	import com.adage.data.ADAGEPlayerEvent;
	import com.adage.data.ADAGEPositionalContext;
	import flash.display.FrameLabel;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.adage.utilities.*;
	import flash.events.MouseEvent;
	import flash.text.engine.TextBlock;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite {
		
		public function Main():void 
		{
			var adage : ADAGE = new ADAGE("Citizen Science", "1");
			
			adage.LoginPlayerWithCredentials("ztest", "zisnogood", null);
			adage.AddData(new ADAGEPlayerEvent(new ADAGEPositionalContext(1, 1, 1, 1, 1, 1)));
		}
		
	}
	
}