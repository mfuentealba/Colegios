package listeners
{
	
	
	import controlador.Controller;
	
	import events.ProveedoresEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import modelo.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	
	
	public class ProveedorListener //implements IBaseListener
	{
		private static var evento:ProveedoresEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			var rmtObjProveedor:RemoteObject = ServiceRO.fnRmtObjProveedor();
			rmtObjProveedor.addEventListener(ResultEvent.RESULT, result);
			evento = ProveedoresEvent(_evento);
			switch(evento.type){
				case ProveedoresEvent.LISTAR_PROVEEDORES:
					rmtObjProveedor.getAllProveedores();					
					break;
				case ProveedoresEvent.CREAR_PROVEEDORES:
					rmtObjProveedor.createProveedor(evento.prov, evento.sw);					
					break;
				case ProveedoresEvent.ACTUALIZAR_PROVEEDORES:
					/*var o:RemoteObject = ServiceRO.fnRmtObjMovimiento();
					o.updateProveedor();*/
					rmtObjProveedor.updateProveedor(evento.prov);					
					break;
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case ProveedoresEvent.LISTAR_PROVEEDORES:
					modelApp.arrProveedor = new ArrayCollection(data.result as Array);
					//var obj:Object = data.result;
					modelApp.arrProveedor.source.forEach(fnDict);
					break;
				case ProveedoresEvent.CREAR_PROVEEDORES:
					evento.callback.call(null, data.result);
					
					
					break;
				case ProveedoresEvent.ACTUALIZAR_PROVEEDORES:
					evento.callback.call(null, data.result);
					
					
					break;
				
			}
			//delete this;
		}
		
		
		
		private static function fnDict(item:*, index:int, arr:Array):void{
			modelApp.objProveedor[item.id + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}