package listeners
{
	
	
	
	import events.MovimientoEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import modelo.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	
	
	public class MovimientoListener //implements IBaseListener
	{
		private static var evento:MovimientoEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			var rmtObjMovimiento:RemoteObject = ServiceRO.fnRmtObjMovimiento();
			rmtObjMovimiento.addEventListener(ResultEvent.RESULT, result);
			evento = MovimientoEvent(_evento);
			switch(evento.type){
				case MovimientoEvent.LISTAR:
					rmtObjMovimiento.getAllMovimiento();
					
					break;
				case MovimientoEvent.CREAR:
					rmtObjMovimiento.crearMovimiento(evento.movVO);
					
					break;
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case MovimientoEvent.LISTAR:
					modelApp.arrMovimiento = new ArrayCollection(data.result as Array);
					//var obj:Object = data.result;
					modelApp.arrMovimiento.source.forEach(fnDict);
					break;
				case MovimientoEvent.CREAR:
					evento.callback.call(null, data.result);
					break;
				
			}
			//delete this;
		}
		
		private static function fnDict(item:*, index:int, arr:Array):void{
			modelApp.objTipoMovimiento[item.id + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}