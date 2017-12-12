package com.larrainvial.gpatrimonial.orders.components
{
	import com.larrainvial.gpatrimonial.orders.model.ModelLocator;
	import com.larrainvial.gpatrimonial.orders.vo.ClientAccountVo;
	import com.larrainvial.gpatrimonial.orders.vo.ExecRptVo;
	import com.larrainvial.gpatrimonial.orders.vo.OrderVo;
	
	import flash.display.Graphics;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import flashx.textLayout.formats.TextDecoration;
	
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.controls.DataGrid;
	import mx.controls.Label;
	import mx.controls.LinkButton;
	import mx.utils.StringUtil;
	
	public class RenderLinkButtonClientView extends LinkButton
	{		
		private const VERDE:uint = 0x04B404;				
		private const ROJO:uint = 0xFF0000;
		private const NARANJO:uint = 0xf9ba0f;
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void       
		{             
			super.updateDisplayList(unscaledWidth, unscaledHeight);            
			var g:Graphics = graphics;             
			g.clear();      
			
			var grid1:AdvancedDataGrid = AdvancedDataGrid(this.owner);  
			if(data.ESTADO_CLI == "V"){
				g.beginFill(VERDE,0.2);
			}
				
			else if(data.ESTADO_CLI == "N"){
				g.beginFill(NARANJO,0.2);
			}
				
			else {
				g.beginFill(ROJO,0.2);
			}
				
			
			g.drawRect(0, 0, unscaledWidth, unscaledHeight); 
			g.endFill();
			
		}

		override public function set data(value:Object):void        
		{    
			if(value){
				super.data = value;
				super.label = value.ESTADO_CLI;
				super.enabled = value.ESTADO_CLI=="B"?true:false;	
			}
			
		}		

		public function RenderLinkButtonClientView() 
		{
			super();
			this.addEventListener(MouseEvent.CLICK, onCLick)
		}
		
		private function onCLick(evt:MouseEvent):void
		{
			navigateToURL(new URLRequest(ModelLocator.xmlExternalLinks.(@id=='DesbloqueoClientes').@url + '?rut=' + StringUtil.trim(data.RUT_CLI)), '_blank')
		}

	}
}