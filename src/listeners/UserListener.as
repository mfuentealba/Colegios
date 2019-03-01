package listeners
{
	
	
	import controlador.Controller;
	
	import events.MovimientoEvent;
	import events.UserEvent;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.net.Responder;
	
	import modelo.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.managers.PopUpManager;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	import views.IngresoMovimiento;
	
	import vo.MovimientoSaldoVO;
	import vo.UserVO;
	
	
	
	public class UserListener //implements IBaseListener
	{
		private static var evento:UserEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			//var rmtObjUser:RemoteObject = ServiceRO.fnRmtObjMovimiento();
			var rmtObjUser:RemoteObject = ServiceRO.fnRmtObjUser();
			rmtObjUser.addEventListener(ResultEvent.RESULT, result);
			evento = UserEvent(_evento);
			switch(evento.type){
				case UserEvent.LOGIN:
					rmtObjUser.fnLogin(evento.userVO);
					
					break;
				case UserEvent.CAMBIO_PASS:
					rmtObjUser.fnPassUpdate(evento.userVO);
					
					break;
				
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case UserEvent.LOGIN:
					if(data.result is UserVO){
						modelApp.userVO = data.result as UserVO;
						modelApp.indexPantalla = 1;
						
						var evMov:MovimientoEvent = new MovimientoEvent(MovimientoEvent.PERIODO_ANTERIOR, fnSaldoNuevo, null, {fecha: (new Date()).fullYear - 1, periodo: (new Date()).fullYear});
						Controller.getInstance().dispatchEvent(evMov);
					} else {
						Alert.show("Usuario o contraseña incorrectas", 'Error');
					}
					break;
				case UserEvent.CAMBIO_PASS:
					if(data.result is UserVO){
						modelApp.userVO = data.result as UserVO;
						evento.callback.call(null, data.result);
					} else {
						Alert.show("Usuario o contraseña incorrectas", 'Error');
					}
					break;
				
			}
			//delete this;
		}
		
		public static function fnSaldoNuevo(fecha:String, obj:*):void{
			var pop:IngresoMovimiento = new IngresoMovimiento();				
			
			pop.esSaldo = true;
			pop.fecha = fecha;
			PopUpManager.addPopUp(pop, FlexGlobals.topLevelApplication as DisplayObject, true);
			PopUpManager.centerPopUp(pop);
			pop.currentState = 'saldo';
			pop.txtMonto.text = modelApp.nf.formatNumber(obj.saldo_caja) + '';
			pop.txtMonto0.text = modelApp.nf.formatNumber(obj.deuda_acumulada) + '';
			pop.txtMonto1.text = modelApp.nf.formatNumber(obj.resultado) + '';
			pop.fnPost = FlexGlobals.topLevelApplication.viewGeneral.fnBuscar;
			
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}