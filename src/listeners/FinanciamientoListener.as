package listeners
{
	
	
	
	import events.FinanciamientoEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import modelo.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	
	
	public class FinanciamientoListener //implements IBaseListener
	{
		private static var evento:FinanciamientoEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			var rmtObjFinanciamiento:RemoteObject = ServiceRO.fnRmtObjFinanciamiento();
			rmtObjFinanciamiento.addEventListener(ResultEvent.RESULT, result);
			evento = FinanciamientoEvent(_evento);
			switch(evento.type){
				case FinanciamientoEvent.LISTAR:
					rmtObjFinanciamiento.getAllFinanciamiento();
					
					break;
				
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case FinanciamientoEvent.LISTAR:
					modelApp.arrFinanciamiento = new ArrayCollection(data.result as Array);
					//var obj:Object = data.result;
					modelApp.arrFinanciamiento.source.forEach(fnDict);
					break;
				
			}
			//delete this;
		}
		
		private static function fnDict(item:*, index:int, arr:Array):void{
			modelApp.objFinanciamiento[item.id + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}
