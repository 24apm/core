package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class UIElement extends Sprite
	{
		public function UIElement()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		protected function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// override to do stuff here
		}
		public function destruct():void
		{
			if(parent.contains(this))
			{
				parent.removeChild(this);
			}
			// override to destroy stuff here
		}
	}
}