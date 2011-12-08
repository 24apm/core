package
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class UIGrid extends UIElement
	{
		private var _tileSize:Point;
		private var _item:UIElement;
		public function UIGrid(size:Point)
		{
			super();
			_tileSize = size;
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			drawTile();
			addEventListener(MouseEvent.ROLL_OVER, rOver);
			addEventListener(MouseEvent.ROLL_OUT, rOut);
		}
		public function get size():Point
		{
			return _tileSize;
		}
		public function addItem(item:UIElement):void
		{
			if(_item != null)
			{
				// destroy old item
				_item.destruct();
			}
			if(item != null)
			{
				// assign new item
				_item = item;
				addChild(_item);
				_item.x = (_tileSize.x - _item.width) * 0.5;
				_item.y = (_tileSize.y - _item.height) * 0.5;
			}
		}
		private function rOver(e:MouseEvent):void
		{
			this.alpha = 0.8
		}
		private function rOut(e:MouseEvent):void
		{
			this.alpha = 1;
		}
		private function drawTile():void
		{
			var border:Shape = new Shape();
			border.graphics.lineStyle(2,0x0);
			border.graphics.beginFill(0xaaaaaa);
			border.graphics.drawRect(0,0,_tileSize.x, _tileSize.y);
			border.graphics.endFill();
			addChild(border);
		}
	}
}