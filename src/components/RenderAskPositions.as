package com.larrainvial.gpatrimonial.orders.components {
	import flash.display.Graphics;
	
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Label;
	
	public class RenderAskPositions extends Label {
		private const ROJO:uint = 0x660000;
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			setStyle('color', 0x333333);
			var g:Graphics = graphics;
			g.clear();
			
			var grid1:AdvancedDataGrid = AdvancedDataGrid(this.owner);
			g.beginFill(ROJO, 0.4);
			g.drawRect(0, 0, unscaledWidth, unscaledHeight);
			g.endFill();
		}
		
		public function RenderAskPositions() {
			super();
		}
	}
}