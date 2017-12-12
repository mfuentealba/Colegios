package com.larrainvial.gpatrimonial.orders.components
{
	import mx.formatters.NumberFormatter;
	
	public class NumberDeformatterLV extends NumberFormatter
	{
		public function NumberDeformatterLV(precision:Number)
		{
			super();
			this.precision = precision;
			this.decimalSeparatorFrom = ",";
			this.decimalSeparatorTo = ".";
			this.thousandsSeparatorFrom = ".";
			this.thousandsSeparatorTo = "";
			this.useThousandsSeparator = false;			
		}
	}
}