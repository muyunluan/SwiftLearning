//: Playground - noun: a place where people can play

import Cocoa

//A protocol is a list of methods that specify a “contract” or “interface”.
protocol Speaker {
    func Speak()
}

//Any class that conforms to this protocol must implement this method.
class Vicki: Speaker {
    func Speak() {
        print("Hello, I am Vicki!")
    }
}

class Ray: Speaker {
    func Speak() {
        print("Hello, I am Ray!")
    }
}

class Animal {
    
}

class Dog : Animal, Speaker {
    func Speak() {
        print("Woof!")
    }
}