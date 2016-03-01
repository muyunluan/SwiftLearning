//: Playground - noun: a place where people can play

import Cocoa
import Foundation

//If you want to have a protocol with optional methods, you must prefix the protocol with the @objc tag
@objc protocol Speaker {
    func Speak()
    optional func TellJoke()
}

//Now that you marked the protocol with @objc, you must annotate all the methods that implement that protocol with @objc as well to satisfy the compiler.

class Vicki: Speaker {
    @objc func Speak() {
        print("Hello, I am Vicki!")
    }
    @objc func TellJoke() {
        print("Q: What did Sushi A say to Sushi B?")
    }
}

class Ray: Speaker {
    @objc func Speak() {
        print("Yo, I am Ray!")
    }
    @objc func TellJoke() {
        print("Q: Whats the object-oriented way to become wealthy?")
    }
    func WriteTutorial() {
        print("I'm on it!")
    }
}

class Animal {
    
}

class Dog : Animal, Speaker {
    @objc func Speak() {
        print("Woof!")
    }
}

//Using Protocol
var speaker: Speaker
speaker = Ray()
speaker.Speak()
(speaker as! Ray).WriteTutorial()
speaker = Vicki()
speaker.Speak()

//Remember that TellJoke is an optional method, so before you call it you should check if it exists.
//If you put a ? mark after the method name, it will check if it exists before calling it. If it does not exist, it will behave as if you’ve called a method that returns nil.
speaker.TellJoke?()
speaker = Dog()
speaker.TellJoke?()


//A delegate is simply a variable that conforms to a protocol, which a class typically uses to notify of events or perform various sub-tasks.

//To do this, first create a protocol with the events you want to notify
protocol DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker)
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b:Speaker)
}

//Then create a class that conforms to this protocol 
class LoggingDateSimulator:DateSimulatorDelegate {
    func dateSimulatorDidStart(sim:DateSimulator, a:Speaker, b:Speaker) {
        print("Date started!")
    }
    func dateSimulatorDidEnd(sim:DateSimulator, a: Speaker, b: Speaker)  {
        print("Date ended!")
    }
}

class DateSimulator {
    let a:Speaker
    let b:Speaker
    
    var delegate:DateSimulatorDelegate?
    
    init(a:Speaker, b:Speaker) {
        self.a = a
        self.b = b
    }
    
    func simulate() {
        delegate?.dateSimulatorDidStart(self, a:a, b: b)
        print("Off to dinner...")
        a.Speak()
        b.Speak()
        print("Walking back home...")
        a.TellJoke?()
        b.TellJoke?()
        delegate?.dateSimulatorDidEnd(self, a:a, b:b)
    }
}

let sim = DateSimulator(a: Vicki(), b: Ray())
sim.delegate = LoggingDateSimulator()
sim.simulate()

