package com.larrainvial.gpatrimonial.orders.components
{
import mx.formatters.NumberFormatter;

public class NumberFormatterLV extends NumberFormatter
	{
		public function NumberFormatterLV(precision:Number)
		{
			super();
		 	this.precision = precision;
		 	this.decimalSeparatorFrom = ",";
		 	this.decimalSeparatorTo = ",";
		 	this.thousandsSeparatorFrom = ".";
		 	this.thousandsSeparatorTo = ".";
		 	this.useThousandsSeparator = true;			
		}
	}
}