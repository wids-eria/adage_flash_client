package {
	import com.adage.ADAGE;
	import com.adage.core.ADAGEGameInfo;
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
			var adage : ADAGE = new ADAGE();
			var game : ADAGEGameInfo = new ADAGEGameInfo();
			game.name = "Citizen Science";
			game.version = "1";
			
			adage.LoginPlayerWithCredentials("ztest", "zisnogood", function() : void {
				adage.UploadDataObject(game, function() : void {
					
				});
			});
			
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