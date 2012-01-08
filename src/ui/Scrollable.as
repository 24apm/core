package ui
{
	public class Scrollable extends UIElement
	{
		
		
		private var _width:Number;
		private var _height:Number;
		private var _element:UIElement;
		
		public override function get width():Number
		{
			return _width;
		}
		public override function get height():Number
		{
			return _height;
		}
		public function Scrollable(element:UIElement)
		{
			super();
			_element = element;
			addChild(_element);
		}
	}
}