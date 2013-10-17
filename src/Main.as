package {
	import com.adage.ADAGE;
	import com.adage.data.ADAGEClickData;
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
		
		public static var textField : TextField = new TextField();
		
		public function Main():void 
		{
			var adage : ADAGE = new ADAGE("Citizen Science", "1");
			
			adage.LoginPlayerWithCredentials("ztest", "zisnogood", null);
			adage.AddData(new ADAGEClickData(50, 50));
			
			if (stage)
			{
				textField.text = "Hello World!";
				textField.width = 800;
				textField.height = 600;
				addChild(textField);
			}
		}
		
	}
	
}