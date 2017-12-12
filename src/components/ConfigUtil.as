package com.larrainvial.gpatrimonial.orders.components
{
	import flash.globalization.NumberFormatter;

	public class ConfigUtil
	{
		public static function CDATA(nm:String, info:String):XML
		{
			return <{nm}>{new XML("<![CDATA[" + info + "]]>")}</{nm}>;
		}
		
		public static function fnDateCL(date:String):String{
			var arrDate:Array = date.split('-');
			arrDate = arrDate.reverse();
			date = arrDate.join('/');
			return date;
		}
		
		public static function fnDateDB(date:String):String{
			var arrDate:Array = date.split('/');
			arrDate = arrDate.reverse();
			date = arrDate.join('-');
			return date;
		}
		
		public static function sinFormato(numero : String) : Number
		{
			var resultado : Number;
			
			
			resultado = Number('1.000');
			/*numero = '7.000.00';
			resultado = Number(numero);
			numero = '7000.000';
			resultado = Number(numero);
			numero = '700.000';
			resultado = Number(numero);
			numero = '7.000,000';
			resultado = Number(numero);
			numero = '700,000';*/
			resultado = Number(numero);
			if(isNaN(resultado)){
				var str:String = String(numero.split('.').join(''));	
				str = String(str.split(',').join('.'));
				resultado =  Number(str);	
			}
			
			return resultado;
		}	
		public static function conFormato(numero : String, prec:int = 2) : String
		{
			var resultado : String;
			var nf3:NumberFormatter = new NumberFormatter("FR-fr");
			
			nf3.decimalSeparator = ',';
			nf3.groupingSeparator = '.';
			nf3.fractionalDigits = prec;
			resultado = nf3.formatNumber(Number(numero));
			
			
			return resultado;
		}	
	}
}