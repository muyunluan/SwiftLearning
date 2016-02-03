//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello Swift")

let maxNum = 1000
var index = 0

index = 2

var x = 0.0, y = 0.0, z = 0.0

//type safety

var websiteName:String
websiteName = "www.imooc.com"

var red, green, blue : Double

let decimalInt:Int = 17
let binaryInt:Int = 0b10001
let octalInt:Int = 0o21
let hexadecimalInt:Int = 0x11

let float_a = 0.012
let float_b = 1.2e-2

let bignum_a = 1000000
let bignum_b = 1_000_000

let num_a:Float = 1
let num_b:Int = Int(1.2)

let a:Int = 3
let b:Double = 0.1415926
let pi:Double = Double(a) + b

let 姓名 = "艾拉"
"Hello" + 姓名

let trueVar = true
let flaseVar = false

if trueVar {
    print("True")
}
else {
    print("False")
}

var c:Int = 1
if c == 1 {
    print("c == 1")
}

let registrationResult = (true, "艾拉", "女")
let connectionResult = (404, "Not Found")

let (isRegistration, nickName, gender) = registrationResult
isRegistration
nickName
gender

registrationResult.0
registrationResult.1
registrationResult.2

let loginResult:(Bool, String) = (true, "艾拉")
let (isLoginSuccess, _) = loginResult

if isLoginSuccess {
    print("登陆成功")
}


/*String Interpolation*/
var apples = 5
print("Shally has \(apples) apples")




