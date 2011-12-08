package
{
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
		public function UILoader(url:String)
		{
			super();
			_url = url;
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
		private function finishAni(e:Event):void
		{
			removeEventListener(Event.COMPLETE, finishAni);
			destruct();
		}
		protected function loadedHandler(e:Event  = null):void
		{
			// override
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadedHandler);
			
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
	}
}