package events
{
	import flash.events.Event;
	
	public class BaseEvent extends Event
	{
		public var clase:String;
		public var callback:Function;
		
		public function BaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}