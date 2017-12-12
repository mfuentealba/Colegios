package com.larrainvial.gpatrimonial.orders.components {
	import flash.display.Graphics;
	
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Label;
	
	public class RenderBidPositions extends Label {
		private const VERDE:uint = 0x006600;
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			setStyle('color', 0x333333);
			//setStyle('color', 0x666666);
			var g:Graphics = graphics;
			g.clear();
			
			var grid1:AdvancedDataGrid = AdvancedDataGrid(this.owner);
			
			g.beginFill(VERDE, 0.5);
			
			g.drawRect(0, 0, unscaledWidth, unscaledHeight);
			g.endFill();
		}
		
		public function RenderBidPositions() {
			super();
		}
	}
}