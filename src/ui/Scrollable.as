package ui
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Elastic;
	
	import event.ItemEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import flashx.textLayout.formats.TextAlign;
	
	import modal.ModalManager;
	
	import style.RectangleStyle;
	import style.Style;
	
	import util.DrawShape;

	public class Scrollable extends UIElement
	{
		
		public var id:uint;
		private var _width:Number;
		private var _height:Number;
		private var _element:UIElement;
		protected var _label:UILabel;
		private var _labelStr:String;
		
		private var _content:UIElement;
		
		private var _size:Point = new Point(110,150);
		private var _scale:Number = 1.1;
		private var _scaleOffsetX:Number;
		private var _scaleOffsetY:Number;
		
		public override function get width():Number
		{
			return _width;
		}
		public override function get height():Number
		{
			return _height;
		}
		public function Scrollable(element:UIElement, scrollableSize:Point, labelStr:String = null)
		{
			super();
			_element = element;
			_labelStr = labelStr;
			_size = scrollableSize;

		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			DrawShape.drawRoundRect(this.graphics, new Rectangle(0,0, _size.x, _size.y), new RectangleStyle(0xFFFFFF,1.0, 25, 25));

			
			addChild(_element);
			_element.x = _element.y = 10;
			if(_labelStr)
			{
				_label = new UILabel(_labelStr,  Style.labelStyleBasic);
				addChild(_label);
				_label.y = 120;
				_label.width = _size.x;
			}
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.ROLL_OUT, rOut);
			addEventListener(MouseEvent.ROLL_OVER, rOver);
		}
		private function onClick(e:MouseEvent):void
		{
			ModalManager.showModal();
			dispatchEvent(new ItemEvent(ItemEvent.ITEM_CLICKED, this, true)); 
		}
		private function rOut(e:MouseEvent):void
		{
			TweenLite.to(_element, 1, {x:10, y:10 ,scaleX:1, scaleY:1, ease:Elastic.easeOut});
			
		}
		private function rOver(e:MouseEvent):void
		{
			var xOffset:Number = -_element.width*(_scale - 1)*0.5 + 10;
			var yOffset:Number =  -_element.height*(_scale - 1)*0.5 + 10;
			
			TweenLite.to(_element, 1, {x:xOffset, y:yOffset, scaleX:_scale, scaleY:_scale, ease:Elastic.easeOut});
		}		
	}
}