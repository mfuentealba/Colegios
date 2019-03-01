package listeners
{
	
	
	import controlador.Controller;
	
	import events.GenerarPlanillasEvent;
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
	
	
	
	public class GenerarPlanillasListener //implements IBaseListener
	{
		private static var evento:GenerarPlanillasEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			//var rmtObjUser:RemoteObject = ServiceRO.fnRmtObjMovimiento();
			var rmtObjUser:RemoteObject = ServiceRO.fnRmtObjMovimiento();
			rmtObjUser.addEventListener(ResultEvent.RESULT, result);
			evento = GenerarPlanillasEvent(_evento);
			switch(evento.type){
				case GenerarPlanillasEvent.GENERAR_PLANILLAS:
					rmtObjUser.fnPlanillas(evento.year);
					
					break;
				
				
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case GenerarPlanillasEvent.GENERAR_PLANILLAS:
					
					break;
			}
			
		}
		
		
		
		public static function fault(info:Object):void
		{
		}
	}
}