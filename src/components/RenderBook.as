package com.larrainvial.gpatrimonial.orders.components
{
import com.larrainvial.gpatrimonial.orders.vo.BookVO;

import flash.display.Graphics;

import mx.controls.DataGrid;
import mx.controls.Label;

public class RenderBook extends Label
	{		
		private const VERDE:uint = 0x04B404;				
        private const ROJO:uint = 0xFF0000;

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void       
		{             
			super.updateDisplayList(unscaledWidth, unscaledHeight);            
			var g:Graphics = graphics;             
			g.clear();      
			       
			var grid1:DataGrid = DataGrid(this.owner);  
			if(data.idSide == "1")
				g.beginFill(VERDE,0.2);
			else
				g.beginFill(ROJO,0.2);
			                
			g.drawRect(0, 0, unscaledWidth, unscaledHeight); 
			g.endFill();
			         
		}
		 
		override public function set data(value:Object):void        
	  	{             
			super.data = value;
			
			if(data is BookVO)
			{
				this.setStyle("color", "white");
				this.setStyle("fontWeight", "bold");
				/*if(data.idSide == "1")
				{
					this.setStyle("color", "0xFF8000");
					this.setStyle("fontWeight", "bold");
				}
				else {
					this.setStyle("color", "white");
					this.setStyle("fontWeight", "normal");
				}*/
			}
		}
			
		public function RenderBook()
		{			
			super();								 
		}	
	}
}