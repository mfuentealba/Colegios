package com.larrainvial.gpatrimonial.orders.components
{
import com.larrainvial.gpatrimonial.orders.vo.SymVO;
import com.larrainvial.gpatrimonial.orders.vo.SymVO;
import flash.utils.Dictionary;
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;

public dynamic class LVTradeDictionary extends Dictionary
    {
        /*** Builder Class ******/
        public function LVTradeDictionary()
        {
            super();
        }

        /*** Generate Id Dictionary ******/
        public function generateIdDictionary(sym:SymVO):String
        {
            return  sym.Symbol.toUpperCase() + "||" + sym.Market.toUpperCase();
        }

        /*** Generate Name Display Id Dictionary ******/
        public function generateNameDisplayIdDictionary(sym:SymVO):String
        {
            return  sym.Symbol.toUpperCase() + " [" + sym.Market.toUpperCase() + "]"
        }

        /*** Dictionary ID Return ******/
        private function getIdDictionary(sym:SymVO):String
        {
            return this.generateIdDictionary(sym)
        }

        /*** Delete ID Dictionary ***/
        public function deleteIdDictionary(sym:SymVO):void
        {
            delete this[getIdDictionary(sym)];
        }

        /*** Dictionary Index Returns For SymVo ******/
        public function getIndexSymbol(sym:SymVO):int
        {
             return this[this.generateIdDictionary(sym)].Position
        }

      /*** Generates a new Dictionary value ******/
        public function generateNewSymbolValue(arrParam:ArrayCollection,objSymbol:SymVO):void
        {
            this[this.generateIdDictionary(objSymbol)] = {"Position":(arrParam.source.push(objSymbol) - 1)};
        }

        /*** Is a new ID Dictionary ******/
        public function isNewIdDictionary (sym:SymVO):Boolean
        {
            return this[this.getIdDictionary(sym)] == null ? true:false;
        }

        /*** Charge Data in Dictionary ArrayCollection ******/
        public function chargeDataMKDTArr (sym:SymVO,arrParam:ArrayCollection,constTypeCharge:String):void
        {
              arrParam.source[this.getIndexSymbol(sym)][constTypeCharge] = sym[constTypeCharge];
              arrParam.refresh();
        }

        /*** Charge Data in Dictionary ArrayCollection ******/
        public function chargeDataMKDTIncArr(sym:SymVO,actualSym:SymVO,arrParam:ArrayCollection,constTypeCharge:String):void
        {
                if(this.generateIdDictionary(actualSym) == this.generateIdDictionary(sym))
                {
                    arrParam[0][constTypeCharge] = sym[constTypeCharge];
                    arrParam.refresh();
                }
        }

        /*** Mark Symbol Problem in Array ******/
        public function removeDataMKDTArr(sym:SymVO,arrParam:ArrayCollection):void
        {
            var x:int =this.getIndexSymbol(sym)
            this.symbolMarketDataProblem(arrParam.source[x]);
            arrParam.refresh();
        }


        private function symbolMarketDataProblem (sym:SymVO):void
        {
            if(sym != null)
                sym.bSymbolOk = false;
        }
    }
}
