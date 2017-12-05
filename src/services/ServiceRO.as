package services
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	

	public class ServiceRO
	{
		public static function fnRmtObjTipoMovimiento():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("GenericDestination");
			rmtObj.source = 'Weborb.ContaColegio.TipoMovimientoService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjMovimiento():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("GenericDestination");
			rmtObj.source = 'Weborb.ContaColegio.MovimientoService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		
		public static function fnRmtObjProveedor():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("GenericDestination");
			rmtObj.source = 'Weborb.ContaColegio.ProveedorService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		
		public static function fnRmtObjTipoDocumento():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("GenericDestination");
			rmtObj.source = 'Weborb.ContaColegio.TipoDocumentoService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnRmtObjFinanciamiento():CustomRemoteObject{
			var rmtObj:CustomRemoteObject = new CustomRemoteObject("GenericDestination");
			rmtObj.source = 'Weborb.ContaColegio.FinanciamientoService';
			rmtObj.showBusyCursor = true;
			return rmtObj;
		}
		
		public static function fnFault(ev:FaultEvent):void{
			Alert.show("Error en servicio de datos", 'ERROR');
		}
		
	}
}