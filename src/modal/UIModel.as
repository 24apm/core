package modal
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Elastic;
	
	import config.AssetTranslationTable;
	import config.GameSetting;
	import config.UILoaderConfig;
	
	import style.Style;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import flashx.textLayout.debug.assert;
	
	import style.RectangleStyle;
	
	import util.DrawShape;

	public class UIModel extends UIElement
	{
		private var _size:Rectangle;
		private var _closeBtn:UILoader;
		private var _tile:UILoader;
		private var _grayScreen:UIElement;
		protected var _content:UIElement;
		
		public function UIModel(size:Rectangle)
		{
			super();
			_size = size;
		}
		public override function get width():Number
		{
			return _size.width;
		}
		public override function get height():Number
		{
			return _size.height;
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			
			_grayScreen = new UIElement();
			DrawShape.drawRect(_grayScreen.graphics, new Rectangle(0,0, GameSetting.STAGE_WIDTH, GameSetting.STAGE_HEIGHT), new RectangleStyle(0, 0.7));
			addChild(_grayScreen);
			
			_tile = new UILoader(AssetTranslationTable.TILE_BROWN_GRAIN);
			_tile.addEventListener(Event.COMPLETE, onTileLoaded);
			addChild(_tile);
			
			_content = new UIElement();
			addChild(_content);
			_content.x = (GameSetting.STAGE_WIDTH - _size.width) * 0.5;
			_content.y = (GameSetting.STAGE_HEIGHT - _size.height) * 0.5;
			_content.filters = [Style.dropShadow];
			
			_closeBtn = new UILoader(AssetTranslationTable.CLOSE_BUTTON, new UILoaderConfig(UILoaderConfig.CENTER));
			addChild(_closeBtn);
			_closeBtn.x = _content.x+ _size.width;
			_closeBtn.y = _content.y;
			_closeBtn.addEventListener(MouseEvent.ROLL_OUT, rOut);
			_closeBtn.addEventListener(MouseEvent.CLICK, onClick);
			_closeBtn.addEventListener(MouseEvent.ROLL_OVER, rOver);
			
		
			

		}
		private function rOut(e:MouseEvent):void
		{
			TweenLite.to(_closeBtn, 1, {scaleX:1, scaleY:1, ease:Elastic.easeOut});
		}
		private function onTileLoaded(e:Event):void
		{
			_tile.removeEventListener(Event.COMPLETE, onTileLoaded);
			removeChild(_tile);
			
			var bitMapData:BitmapData = new BitmapData(64,64, false);
			bitMapData.draw(_tile);
			DrawShape.drawBitmapRoundRect(_content.graphics, _size, new RectangleStyle(0,1,25,25, bitMapData));
		}
		private function onClick(e:MouseEvent):void
		{
			this.destruct();
		}
		private function rOver(e:MouseEvent):void
		{
			TweenLite.to(_closeBtn, 1, {scaleX:1.2, scaleY:1.2, ease:Elastic.easeOut});
		}
		public override function destruct():void
		{
			if(_closeBtn)
			{
				_closeBtn.removeEventListener(MouseEvent.ROLL_OUT, rOut);
				_closeBtn.removeEventListener(MouseEvent.CLICK, onClick);
				_closeBtn.removeEventListener(MouseEvent.ROLL_OVER, rOver);
				
				_closeBtn.destruct();
				_closeBtn = null;
			}
			if(_content)
			{
				_content.destruct();
				_content = null;
			}
			
			this.graphics.clear();
			
			super.destruct();
		}
	}
}