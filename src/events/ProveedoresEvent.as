package events
{
	import vo.ProveedorVO;

	public class ProveedoresEvent extends BaseEvent
	{
		public static const LISTAR_PROVEEDORES:String = 'getAllProveedores';
		public static const CREAR_PROVEEDORES:String = 'createProveedor';
		public static const ACTUALIZAR_PROVEEDORES:String = 'updateProveedor';
		public static const ELIMINAR_PROVEEDORES:String = 'getAllProveedor';
		
		public var prov:ProveedorVO;
		public var sw:Boolean;
		
		
		public function ProveedoresEvent(type:String, _prov:ProveedorVO = null, _callback:Function = null)
		{
			super(type);
			this.prov = _prov;
			this.callback = _callback;
		}
	}
}