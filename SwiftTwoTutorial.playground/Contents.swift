//: Playground - noun: a place where people can play

import UIKit

//1. variable vs constant
let swiftTeam = 13
let iOSTeam = 54
let otherTeams = 48
var totatlTeam = swiftTeam + iOSTeam + otherTeams

//2. Explicit vs Inferred Typing
let swiftTeam1: Int = 13
//let swiftTeam1 = 13

//3. Basic Types and Control Flow
let priceInferred = 19.99
let priceExplicit: Double = 19.99

let onSaleInferred = true
let onSaleExplicit: Bool = true

let nameInferred = "Hello Swift"
let nameExplicit: String = "Hello Swift"

//If and String interpolation
if onSaleInferred {
    print("\(nameInferred) on sale for \(priceInferred)")
} else {
    print("\(nameInferred) at regular price: \(priceInferred)")
}

//4. Classes and Methods
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
        
//        print("15%: \(calcTipWithPct(0.15))")
//        print("18%: \(calcTipWithPct(0.18))")
//        print("20%: \(calcTipWithPct(0.20))")
        
        //5. Arrays and For Loops
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let _:[Double] = [0.15, 0.18, 0.20]
        
        for possibleTip in possibleTipsInferred {
            print("\(possibleTip * 100)%: \(calcTipWithPct(possibleTip))")
        }
    }
    
    //6. Dictionaries
    func printPossibleTipsTwo() -> [Int: Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        //[Int: Double] is just a shortcut for Dictionary<Int, Double>.
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            retval[intPct] = calcTipWithPct(possibleTip)
        }
        return retval
    }
}


let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.printPossibleTips()
tipCalc.printPossibleTipsTwo()

//Unamed Tuples
let tipAndTotal = (4.00, 25.19)
//let tipAndTotal:(Double, Double) = (4.00, 25.19)

tipAndTotal.0
tipAndTotal.1

let (theTipAmt, theTotal) = tipAndTotal
theTipAmt
theTotal

//Named Tuples
let tipAndTotal2 = (theTipAmt2:4.00, theTotal2:25.19)
tipAndTotal2.theTipAmt2
tipAndTotal2.theTotal2

let tipAndTotalNamed:(tipAmt:Double, theTotal:Double) = (4.00, 25.19)

//Retruning Tuples
let total = 21.19
let taxPct = 0.06
let subtotal = total / (1 + taxPct)
func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total: Double) {
    let tipAmt = subtotal * tipPct
    let finalTotal = tipAmt + total
    return (tipAmt, finalTotal)
}

calcTipWithTipPct(0.20)

//Protocol
protocol Speaker {
    func Speaker()
}

class Vicky : Speaker {
    func Speaker() {
        print("Hello, I'm Vicky")
    }
}

class Ray: Speaker {
    func Speaker() {
        print("Hello, I'm Ray")
    }
}

class Animal {
    
}
class Dog : Animal, Speaker {
    func Speaker() {
        print("Woof!")
    }
}

//Optional Protocol
@objc protocol Speaker1 {
    func Speaker1()
    optional func Test()
}
class Vicky1 : Speaker1 {
    @objc func Speaker1() {
        print("Hello, ...")
    }
    
    @objc func Test() {
        print("Test")
    }
    
    func Test1() {
        print("Test1")
    }
}

class Ray1: Speaker1 {
    @objc func Speaker1() {
        print("Yo, I am Ray!")
    }
    @objc func Test() {
        print("Q: Whats the object-oriented way to become wealthy?")
    }
    func WriteTutorial() {
        print("I'm on it!")
    }
}

//Using Protocol
var speaker : Speaker1
speaker = Vicky1()
speaker.Speaker1()

(speaker as! Vicky1).Test1()
speaker = Ray1()
speaker.Speaker1()

speaker.Test?()


//Delegate

protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker1, b: Speaker1)
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker1, b: Speaker1)
}

class LoggingDateSimulator: DateSimulatorDelegate {
    func dateSimulatorDidStart(sim: DateSimulator, a: Speaker1, b: Speaker1) {
        print("Date started!")
    }
    
    func dateSimulatorDidEnd(sim: DateSimulator, a: Speaker1, b: Speaker1) {
        print("Date ended!")
    }
}

class DateSimulator {
    let a : Speaker1
    let b : Speaker1
    
    var delegate:DateSimulatorDelegate?
    
    init(a : Speaker1, b : Speaker1) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
        delegate?.dateSimulatorDidStart(self, a: a, b: b)
        print("Off to dinner...")
        a.Speaker1()
        b.Speaker1()
        print("Walking back home...")
        a.Test?()
        b.Test?()
        delegate?.dateSimulatorDidEnd(self, a: a, b: b)
    }
}

let sim = DateSimulator(a: Vicky1(), b: Ray1());
sim.delegate = LoggingDateSimulator()
sim.simulate()



