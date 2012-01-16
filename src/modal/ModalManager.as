package modal
{
	import config.GameSetting;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	
	import style.RectangleStyle;
	
	import util.DrawShape;

	public class ModalManager extends UIElement
	{
		public static var modalLayer:Sprite = new Sprite;
		
		public function ModalManager()
		{
		}
		public static function showModal():void
		{
			var chickenModal:UIModel = new UIModel(new Rectangle(0,0, 300, 200));
			addModal(chickenModal);
		}
		private static function addModal(aModal:UIModel):void
		{

			modalLayer.addChild(aModal);

		}
	}
}