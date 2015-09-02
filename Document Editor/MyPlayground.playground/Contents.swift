//: Playground - noun: a place where people can play

import UIKit

let email = "asdasd@gmail.com"
let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
let predicate = NSPredicate(format: "SELF MATCHES %@", regex)

predicate.evaluateWithObject(email)