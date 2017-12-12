package com.larrainvial.gpatrimonial.orders.components
{
	import com.larrainvial.gpatrimonial.orders.vo.ClientAccountVo;
	import com.larrainvial.gpatrimonial.orders.vo.ExecRptVo;
	import com.larrainvial.gpatrimonial.orders.vo.OrderVo;
	
	import flash.display.Graphics;
	
	import mx.controls.AdvancedDataGrid;
	import mx.controls.DataGrid;
	import mx.controls.Label;
	
	public class RenderClientView extends Label
	{		
		private const VERDE:uint = 0x04B404;				
		private const ROJO:uint = 0xFF0000;
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void       
		{             
			super.updateDisplayList(unscaledWidth, unscaledHeight);            
			var g:Graphics = graphics;             
			g.clear();      
			
			var grid1:AdvancedDataGrid = AdvancedDataGrid(this.owner);  
			if(data.ESTADO_CLI == "V")
				g.beginFill(VERDE,0.2);
			else
				g.beginFill(ROJO,0.2);
			
			g.drawRect(0, 0, unscaledWidth, unscaledHeight); 
			g.endFill();
			
		}
	}
}