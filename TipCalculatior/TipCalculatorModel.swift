//
//  TipCalculatorModel.swift
//  TipCalculatior
//
//  Created by Fei Deng on 1/11/16.
//  Copyright © 2016 Ayla Networks. All rights reserved.
//

import Foundation

class TipCalculatorModel {

    var total: Double
    var taxPct: Double
    //computed property
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }

    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }

    func returnPossibleTips() -> [Int: Double] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]

        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)

            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total: Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = tipAmt + total
        return (tipAmt, finalTotal)
    }
    
    func returnPossibleTipsTwo() -> [Int: (tipAmt: Double, total: Double)] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: (tipAmt: Double, total: Double)]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
    

}