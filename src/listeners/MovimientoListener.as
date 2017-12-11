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
	
	import vo.MovimientoVO;
	
	
	
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
				case MovimientoEvent.CREAR_SALDO:
					rmtObjMovimiento.crearMovimientoSaldo(evento.movVO);
					
					break;
				
				case MovimientoEvent.ELIMINAR:
					rmtObjMovimiento.deleteMovimiento(evento.movVO);
					
					break;
				
				case MovimientoEvent.LISTAR_FORMA_PAGO:
					rmtObjMovimiento.fnFormaPago();
					
					break;
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case MovimientoEvent.LISTAR:
					modelApp.arrMovimiento = new ArrayCollection(data.result as Array);
					modelApp.saldoCaja = 0;
					//var obj:Object = data.result;
					modelApp.arrMovimiento.source.forEach(fnDict);
					break;
				case MovimientoEvent.CREAR:
					evento.callback.call(null, data.result);
					break;
				case MovimientoEvent.ELIMINAR:
					evento.callback.call(null, data.result);
					break;
				case MovimientoEvent.CREAR_SALDO:
					evento.callback.call(null, data.result);
					break;
				case MovimientoEvent.LISTAR_FORMA_PAGO:
					modelApp.arrFormaPago = new ArrayCollection(data.result as Array);
					modelApp.arrMovimiento.source.forEach(fnDictFormaPago);
					break;
			}
			//delete this;
		}
		
		private static function fnDict(item:MovimientoVO, index:int, arr:Array):void{
			modelApp.objMovimiento[item.id + ''] = item;
			if(item.tipo_movimiento == '2'){
				modelApp.saldoCaja += item.monto;
				item.saldoCaja = modelApp.saldoCaja;
			}
			
		}
		
		private static function fnDictFormaPago(item:*, index:int, arr:Array):void{
			modelApp.objFormaPago[item.id + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}