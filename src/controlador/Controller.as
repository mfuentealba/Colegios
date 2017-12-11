package controlador
{
	import com.adobe.serialization.json.JSON;
	
	import events.FinanciamientoEvent;
	import events.MovimientoEvent;
	import events.ProveedoresEvent;
	import events.TipoDocumentoEvent;
	import events.TipoMovimientoEvent;
	
	import flash.events.DataEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import listeners.FinanciamientoListener;
	import listeners.MovimientoListener;
	import listeners.ProveedorListener;
	import listeners.TipoDocumentoListener;
	import listeners.TipoMovimientoListener;
	
	import modelo.ModelApp;
	
	import mx.controls.Alert;

	
	public class Controller extends ControllerBase
	{
		public static var controladorGeneral:Controller;
		[Bindable] private var modelApp:ModelApp = ModelApp.getInstance();
		
		/*private var sucursalListener:SucursalListener = new SucursalListener();
		private var clienteListener:ClienteListener = new ClienteListener();
		private var mantenedorListener:MantenedorListener = new MantenedorListener();*/
		
		public static function getInstance():Controller
		{
			if ( controladorGeneral == null ){
				controladorGeneral = new Controller();
				
			}
			
			return controladorGeneral;
		}
		
		public function Controller(target:IEventDispatcher=null)
		{
			if(controladorGeneral){
				throw new Error("Singleton... use getInstance()");
			} 
			controladorGeneral = this;
			inic();			
		}
		
		public function inic():void{
			addEventListenerNew(TipoMovimientoEvent.LISTAR, TipoMovimientoListener);
			addEventListenerNew(ProveedoresEvent.LISTAR_PROVEEDORES, ProveedorListener);
			addEventListenerNew(ProveedoresEvent.CREAR_PROVEEDORES, ProveedorListener);
			addEventListenerNew(TipoDocumentoEvent.LISTAR, TipoDocumentoListener);
			addEventListenerNew(MovimientoEvent.LISTAR, MovimientoListener);
			addEventListenerNew(MovimientoEvent.CREAR, MovimientoListener);
			addEventListenerNew(MovimientoEvent.CREAR_SALDO, MovimientoListener);
			addEventListenerNew(MovimientoEvent.LISTAR_FORMA_PAGO, MovimientoListener);
			addEventListenerNew(MovimientoEvent.ELIMINAR, MovimientoListener);
			addEventListenerNew(FinanciamientoEvent.LISTAR, FinanciamientoListener);
			
		}	
		
		private function despachar(evento:*):void{
			switch(evento.clase){
				case 'UsuarioEvent':
					//var sesionEvent:SesionEvent = event as SesionEvent;
					switch(evento.type){
						
						//DelegadoSQLite.getInstance().fnDelegado(fn del controller que actualiza vista, fn callback del evento para alguna otra actualizacion mas visual)
					}
					break;
				
			}
		}	
		
		
		/***************NODEJS**************************************/
		
		private function callbackRecep(result:DataEvent):void{
			var arrParam:Array = String(result.data).split('|');
			switch(arrParam[1]){			
				
				
			}
		}
		
		
		private function sesionResponse(aEvent : DataEvent):void{
			var arrSesion:Array = String(aEvent.data).split('|');
			/*modelApp.sesion = new SesionVO();
			modelApp.sesion.id = arrSesion[0];
			modelApp.sesion.user = arrSesion[1];*/
			
			
		}
		
	}
}