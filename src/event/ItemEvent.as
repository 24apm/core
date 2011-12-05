package event
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ItemEvent extends Event
	{
		public static var ITEM_CLICKED:String = "ITEM_CLICKED";
		private var _element:UIElement;
		
		public function ItemEvent(type:String, element:UIElement, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_element = element;
			super(type, bubbles, cancelable);
		}
		
		public function get item():UIElement
		{
			return _element;
		}
	}
}