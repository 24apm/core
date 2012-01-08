package request
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class HTTPLite extends EventDispatcher
	{
		public static const HTTP_EVENT:String = "HTTP_EVENT";
		private var _view:String;
		
		
		public function HTTPLite(view:String)
		{
			_view = view;
		}
		protected function send(variables:URLVariables):void
		{
			var path:String = AppVars.serverUrl + "php/requestHandler.php?requestType=" + _view;
			trace("send: " + path);
			var httprequest:URLRequest = new URLRequest (path);
			httprequest.method = URLRequestMethod.POST;
			httprequest.data = variables;
			
			var loader:URLLoader = new URLLoader (httprequest);
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.load(httprequest);
		}
		protected function onIOError(e:Event):void
		{
			trace("HTTPLite IOError: " );
			
		}
		protected function onComplete (event:Event):void{
			//override
			dispatchEvent(new Event(HTTPLite.HTTP_EVENT));
		}  
	}
}