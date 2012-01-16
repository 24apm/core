package
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import flashx.textLayout.formats.TextAlign;
	
	import style.UILabelStyle;

	public class UILabel extends UIElement
	{
		private var _textField:TextField;
		private var _text:String;
		private var _style:UILabelStyle;
		
		private var _textFormat:TextFormat;
		
		public function UILabel(text:String, style:UILabelStyle)
		{
			super();
			_text = text;
			_style = style;
		}
		public function set autoSize(autoSize:String):void
		{
			_textField.autoSize = autoSize;
		}
		public function set border(value:Boolean):void
		{
			_textField.border = value;
		}
		public function set text(text:String):void
		{
			_textField.text = text;	
			_textField.setTextFormat(_textFormat);

		}
		public function get text():String
		{
			return _textField.text;
		}
		public override function set width(value:Number):void
		{
			_textField.autoSize = TextAlign.LEFT;
			_textField.width = value;
			_textField.autoSize = "none";
		}
		public override function set height(value:Number):void
		{
			_textField.height = value;
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			_textField = new TextField();
			addChild(_textField);

			
			_textFormat = new TextFormat(_style.font, _style.size, null, _style.bold, null, null, null, null, _style.align, null, null, _style.indent, _style.leading);
			_textField.setTextFormat(_textFormat);
			
			this.text = _text;
		}
		
		public override function destruct():void
		{
			if(_textField)
			{
				removeChild(_textField);
				_textField = null;
			}
			super.destruct();
		}
	}
}