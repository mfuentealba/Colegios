package com.larrainvial.gpatrimonial.orders.components
{
	import com.larrainvial.gpatrimonial.orders.vo.ClientAccountVo;
	import com.larrainvial.gpatrimonial.orders.vo.ExecRptVo;
	import com.larrainvial.gpatrimonial.orders.vo.OrderVo;
	
	import flash.display.Graphics;
	
	import mx.controls.AdvancedDataGrid;
	import mx.controls.DataGrid;
	import mx.controls.Label;
	
	public class RenderClientWarning extends Label
	{		
		private const AMARILLO:uint = 0xD7DF01;				
		private const ROJO:uint = 0xFF0000;
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void       
		{      
			/*height = 35;
			horizontalCenter = 0;
			verticalCenter = 0;*/
			if(data){
				super.updateDisplayList(unscaledWidth, unscaledHeight);            
				var g:Graphics = graphics;             
				g.clear();      
				
				var grid1:AdvancedDataGrid = AdvancedDataGrid(this.owner);  
				if(ConfigUtil.sinFormato(ClientAccountVo(data).SALDO_DISP) < 0)
					g.beginFill(AMARILLO,0.2);
				
				
				g.drawRect(0, 0, unscaledWidth, unscaledHeight); 
				g.endFill();	
			}
			
			
		}
	}
}