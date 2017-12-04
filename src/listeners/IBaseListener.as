package listeners
{
	import flash.events.Event;
	
	import mx.rpc.events.ResultEvent;
	
	public interface IBaseListener
	{
		function exec(event:Event):void;
		function result(event:ResultEvent):void;
	}
}