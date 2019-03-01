package listeners
{
	
	
	
	import controlador.Controller;
	
	import events.MovimientoEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import modelo.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	import vo.MovimientoSaldoVO;
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
					rmtObjMovimiento.getAllMovimiento(evento.filtros.periodo);
					
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
				case MovimientoEvent.PERIODO_ANTERIOR:
					rmtObjMovimiento.getCierrePeriodo(evento.filtros.fecha);
					
					break;
				case MovimientoEvent.MOVIMIENTOS_ASOCIADOS:
					rmtObjMovimiento.fnMovimientosAsociados(evento.filtros.tipo);
					
					break;
				case MovimientoEvent.MOVIMIENTOS_DEPENDIENTES:
					rmtObjMovimiento.fnMovimientosDependientes(evento.filtros.id);
					
					break;
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case MovimientoEvent.LISTAR:
					modelApp.arrMovimiento = new ArrayCollection(data.result as Array);
					modelApp.saldoCajaAcum = modelApp.saldoCaja;
					modelApp.deudaAcum = modelApp.deuda;
					modelApp.resultadoAcum = modelApp.resultado;
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
				case MovimientoEvent.PERIODO_ANTERIOR:
					if(data.result && data.result.id == 0){
						evento.callback.call(null, evento.filtros.fecha, data.result);
					} else {
						modelApp.periodo = data.result as MovimientoSaldoVO;
						modelApp.saldoCaja = data.result.saldo_caja;
						modelApp.deuda = data.result.deuda_acumulada;
						modelApp.resultado = data.result.resultado;
						var ev:MovimientoEvent = new MovimientoEvent(MovimientoEvent.LISTAR, null, null, {periodo: evento.filtros.periodo});
						Controller.getInstance().dispatchEvent(ev);
					}
					break;
				case MovimientoEvent.MOVIMIENTOS_ASOCIADOS:
					if(data.result != null){
						var arr:ArrayCollection = new ArrayCollection(data.result as Array);// as ArrayCollection;
						evento.callback.call(null, arr);
					} else {
						Alert.show("No se han encontrado movimiento", 'Info');
					}
					break;
				case MovimientoEvent.MOVIMIENTOS_DEPENDIENTES:
					if(data.result != null){
						arr = new ArrayCollection(data.result as Array);// as ArrayCollection;
						evento.callback.call(null, arr);
					} else {
						Alert.show("No se han encontrado movimiento", 'Info');
					}
					break;
			}
			//delete this;
		}
		
		private static function fnDict(item:MovimientoVO, index:int, arr:Array):void{
			modelApp.objMovimiento[item.id + ''] = item;
			switch(item.tipo_movimiento){
				case '2':
					modelApp.saldoCajaAcum += item.monto;
					modelApp.resultadoAcum += item.monto;
					break;
				case '3':
					modelApp.resultadoAcum -= item.monto;
					modelApp.deudaAcum += item.monto;
					break;
				case '4':
					modelApp.saldoCajaAcum -= item.monto;
					modelApp.deudaAcum -= item.monto;
					break;
			}
			item.saldoCaja = modelApp.saldoCajaAcum;
			item.resultado = modelApp.resultadoAcum;
			item.deudaAcum = modelApp.deudaAcum;
		}
		
		private static function fnDictFormaPago(item:*, index:int, arr:Array):void{
			modelApp.objFormaPago[item.id + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}