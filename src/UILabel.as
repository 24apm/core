package
{
	import flash.events.Event;
	import flash.text.TextField;

	public class UILabel extends UIElement
	{
		private var _textField:TextField;
		private var _text:String;
		public function UILabel(text:String)
		{
			super();
			_text = text;
		}
		public function set text(text:String):void
		{
			_textField.text = text;	
		}
		public function get text():String
		{
			return _textField.text;
		}
		protected override function init(e:Event=null):void
		{
			super.init(e);
			_textField = new TextField();
			addChild(_textField);
			
			_textField.text = _text;
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