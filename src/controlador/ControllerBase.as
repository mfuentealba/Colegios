package controlador
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import listeners.IBaseListener;
	
	import mx.core.ClassFactory;
	
	public class ControllerBase extends EventDispatcher
	{
		
		private var objAsoc:Object = {};
		public function ControllerBase(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
		
		public function addEventListenerNew(type:String, listener:Class):void
		{
			// TODO Auto Generated method stub
			objAsoc[type] = listener;
			//super.addEventListener(type, listener.exec);
		}
		
		override public function dispatchEvent(evento:Event):Boolean
		{
			// TODO Auto Generated method stub
			/*var gen:ClassFactory = new ClassFactory();
			gen.generator = objAsoc[evento.type];
			var listener:IBaseListener = gen.newInstance();*/
			try{
				addEventListener(evento.type, objAsoc[evento.type].exec);
				var res:Boolean = super.dispatchEvent(evento);
				evento = null;
				return res;	
			} catch(e:*){
				super.dispatchEvent(evento);
			}
			return false;
		}
		
		
		
	}
}