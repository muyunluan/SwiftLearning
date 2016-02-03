//: Playground - noun: a place where people can play

import UIKit
//1
class TipCalculator {
    //2
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    //3
    init(total: Double, taxPct: Double) {
        self.total = total;
        self.taxPct = taxPct;
        subtotal = total / (taxPct + 1)
    }
    
    //4: To declare a method, you use the func keyword. You then list the parameters (you must be explicit with the types), add the -> symbol, and finally list the return type.
    func calcTipWithPct(tipPct: Double) ->Double {
        return subtotal * tipPct
    }
    
    //5: when you call a method on an instance of a class, the first parameter does not need to be named (but the rest do)
    func printPossibleTips() {
        print("15%: \(calcTipWithPct(0.15))")
        print("18%: \(calcTipWithPct(0.18))")
        print("20%: \(calcTipWithPct(0.20))")
    }
    
}


let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.printPossibleTips()
