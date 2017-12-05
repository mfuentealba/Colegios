package listeners
{
	
	
	
	import events.TipoDocumentoEvent;
	
	import flash.events.Event;
	import flash.net.Responder;
	
	import modelo.ModelApp;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import services.ServiceRO;
	
	
	
	public class TipoDocumentoListener //implements IBaseListener
	{
		private static var evento:TipoDocumentoEvent;		
		private static var modelApp:ModelApp = ModelApp.getInstance();
		
		
		
		public static function exec(_evento:Event):void{
			var rmtObjTipoDocumento:RemoteObject = ServiceRO.fnRmtObjTipoDocumento();
			rmtObjTipoDocumento.addEventListener(ResultEvent.RESULT, result);
			evento = TipoDocumentoEvent(_evento);
			switch(evento.type){
				case TipoDocumentoEvent.LISTAR:
					rmtObjTipoDocumento.getAllTipoDocumento();
					
					break;
				
				
			}
		}
		
		public static function result(data:ResultEvent):void
		{
			switch(data.token.message['operation']){
				case TipoDocumentoEvent.LISTAR:
					modelApp.arrTipoDocumento = new ArrayCollection(data.result as Array);
					//var obj:Object = data.result;
					modelApp.arrTipoDocumento.source.forEach(fnDict);
					break;
				
			}
			//delete this;
		}
		
		private static function fnDict(item:*, index:int, arr:Array):void{
			modelApp.objTipoDocumento[item.codigo + ''] = item;
		}
		
		public static function fault(info:Object):void
		{
		}
	}
}
