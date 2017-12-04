package listeners
{
	
	
	import events.TipoMovimientoEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import modelo.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	
	
	public class TipoMovimientoListener //implements IBaseListener
	{
		private static var evento:TipoMovimientoEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			var rmtObjTipoMovimiento:RemoteObject = ServiceRO.fnRmtObjTipoMovimiento();
			rmtObjTipoMovimiento.addEventListener(ResultEvent.RESULT, result);
			evento = TipoMovimientoEvent(_evento);
			switch(evento.type){
				case TipoMovimientoEvent.LISTAR:
					rmtObjTipoMovimiento.getAllTipoMovimiento();
					
					break;
				
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case TipoMovimientoEvent.LISTAR:
					modelApp.arrTipoMovimiento = new ArrayCollection(data.result as Array);
					//var obj:Object = data.result;
					modelApp.arrTipoMovimiento.source.forEach(fnDict);
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