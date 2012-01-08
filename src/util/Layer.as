package util
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Layer extends UIElement
	{
		public static var gameLayer:Sprite;
		public static var uiLayer:Sprite;
		public static var charLayer:Sprite;
		public function Layer()
		{
			super();
		}
		protected override function init(e:Event = null):void
		{
			super.init();
			gameLayer = new Sprite();
			addChild(gameLayer);
			
			uiLayer = new Sprite();
			addChild(uiLayer);
			
			charLayer = new Sprite();
			addChild(charLayer);
		}
	}
}