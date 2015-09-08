//: Playground - noun: a place where people can play

import UIKit

let email = "asdasd@gmail.com"
let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

predicate.evaluateWithObject(email)

let text = "fdsfdsfs df   "
let whitespace = NSCharacterSet.whitespaceCharacterSet()
let result = text.stringByTrimmingCharactersInSet(whitespace)

let letters = NSString(string: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
let length = 20
let randomString = NSMutableString(capacity: length)

for index in 0..<length {
    
    randomString.appendFormat("%C", letters.characterAtIndex(Int(arc4random_uniform(UInt32(letters.length)))))
}

String(randomString)

let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyMMddHHmmss"
let order = dateFormatter.stringFromDate(NSDate())
if let number = order.toInt() {
    number
}