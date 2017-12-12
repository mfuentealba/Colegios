package com.larrainvial.gpatrimonial.orders.components
{
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.collections.ArrayCollection;
	import mx.core.mx_internal;
	
	import spark.events.IndexChangeEvent;
	import spark.flextras.autoCompleteComboBox.AutoCompleteComboBoxLite;
	
	
	use namespace mx_internal;
	
	public class AutoCompleteTomador extends AutoCompleteComboBoxLite
	{
		public function AutoCompleteTomador()
		{
			super();
		}
		
		override protected function keyDownHandler(event:KeyboardEvent):void
		{
			//super.keyDownHandler(event);
			
			if ((event.keyCode == Keyboard.ENTER || event.keyCode == Keyboard.TAB) && !isDropDownOpen) 
			{
				// commit the current text
				//var index:int = this.dataProvider.getItemIndex(this.dataGroup.dataProvider.getItemAt(0));
				if(this.dataProvider.length > 0){
					var ev:IndexChangeEvent = new IndexChangeEvent(IndexChangeEvent.CHANGE, false, false, this.selectedIndex, this.selectedIndex < 0 ? 0 : this.selectedIndex);
					this.selectedIndex = this.selectedIndex < 0 ? 0 : this.selectedIndex;	
					this.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE, false, false, -1, 0));
					
				}
				
				//this.selectedItem = this.dataGroup.dataProvider.getItemAt(0) ? this.dataGroup.dataProvider.getItemAt(0) : null; 
				//this.dispatchEvent(new IndexChangeEvent(IndexChangeEvent.CHANGE, false, false, -1, index));
			}
			else if (event.keyCode == Keyboard.ESCAPE)
			{
				// Restore the previous selectedItem
				if (textInput)
				{
					if (selectedItem != null)
						textInput.text = itemToLabel(selectedItem);
					else
						textInput.text = "";
				}
				super.mx_internal::changeHighlightedSelection(selectedIndex);
			}
		}
		
		override protected function setTypeAheadText(value:String):void
		{
			// TODO Auto Generated method stub
			trace('VALOR: ' + value);
			if(value == ''){
				value = '';
			}
			
			super.setTypeAheadText(this.textInput.text);
		}
		
		override protected function onChange(event:IndexChangeEvent):void
		{
			// TODO Auto Generated method stub
			//this.setTypeAheadText('');
			if(event.newIndex == -1){
				this.setTypeAheadText('');
			}
		}
		
		override public function set selectedItem(value:*):void
		{
			// TODO Auto Generated method stub
			super.selectedItem = value;
			if(!value){
				this.setTypeAheadText('');
			}
		}
		
		
		override public function set selectedIndices(value:Vector.<int>):void
		{
			// TODO Auto Generated method stub
			super.selectedIndices = value;
		}
		
		
		
		override protected function focusOutHandler(event:FocusEvent):void
		{
			// TODO Auto Generated method stub
			if(!this.selectedItem){
				this.textInput.text = '';
				this.setTypeAheadText('');
				//if(this.dataProvider){
					ArrayCollection(this.dataProvider).refresh();	
					super.focusOutHandler(event);
				//}
				
			}
			
		}
		
		
		
		
		
		
		
	}
}