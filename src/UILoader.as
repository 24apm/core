package
{
	import config.UILoaderConfig;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;

	public class UILoader extends UIElement
	{
		private var _url:String;
		protected var _loader:Loader;
		protected var _config:UILoaderConfig;
		
		public function UILoader(url:String, config:UILoaderConfig = null)
		{
			super();
			
			_url = url;
			if(_url == null)
				_url = "";
			
			if(config == null)
				_config = UILoaderConfig.dummy();
			else
				_config = config;
		}
		public function get loader():Loader
		{
			return _loader;
		}
		protected override function init(e:Event = null):void
		{
			super.init();
			_loader = new Loader();
			
			var urlRequest:URLRequest = new URLRequest(_url);
			var loaderContext:LoaderContext = new LoaderContext();
			_loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_loader.load(urlRequest, loaderContext);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadedHandler);
			
			addChild(_loader);
		}
		private function ioErrorHandler(e:IOError):void
		{
			trace("ioErrorHandler: " + e);
		}

		protected function loadedHandler(e:Event  = null):void
		{
			// override
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadedHandler);
			if(_config.orientation == UILoaderConfig.CENTER)
				center();
			dispatchEvent(new Event(Event.COMPLETE));
		}
		public override function destruct():void
		{
			if(_loader != null)
			{	_loader.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadedHandler);
				
				removeChild(_loader);
				_loader = null;
			}
		
			super.destruct();
		}
		private function center():void
		{
			_loader.x -= (this._loader.contentLoaderInfo.width * 0.5);
			_loader.y -= (this._loader.contentLoaderInfo.height * 0.5);
		}
	}
}