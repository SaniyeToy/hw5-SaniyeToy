import UIKit

var greeting = "Hello, playground"
var someVar: Bool
var someCharacter: Character = "C"

var me = "Semih"
var myFriend = "Gulce"
var paragragraph = """
asdfadfad
asxdfadasfd
adsdasda
"""

var welcomeText = "Hosgeldiniz \(me) ve \(myFriend)"

var response = (404, false)

//Array
var myArray = [1, 2, 3, 4, 5]
var myArray2: [Int] = []
var myArray3 = Array(repeating: 12, count: 3)
let myImmutableArray = myArray + myArray3
myArray.append(6)
myArray[0]
var myArray4 = [1, 1, 3, 2, 1]
//Dictionary
var myDictionary: [String: Int] = ["Semih": 123456,
                                   "Mahmut": 23456,
                                   "Ece": 35354]
myDictionary["Ulas"] = 3453453
myDictionary
var myNestedDictionary: [String: [String: Int]] = [:]
myNestedDictionary["Semih"] = ["Ev" : 12]


//Set
var mySet: Set = [1, 2, 1, 1]
var phoneBookLetters: Set = ["S"]
phoneBookLetters.insert("M")
phoneBookLetters.insert("S")


//If statement
//
//let contition = true
//
//if contition {
//    // if contition == true
//} else {
//    // if contition == false
//}
//

//Ternary Operator
var a = 0
let condition = true
a = condition ? 12 : -12



////While
//
//while contition {
//    // Do something
//    if 0 == 0 {
//        break
//    }
//}
//
//repeat {
//    //Do it before
//} while contition

//For

for i in 0...5 {
    print(i)
}

let names = ["Ahmet", "Mehmet", "Mustafa", "Ayse"]

//for name i in 0..<names.count {
//    print(names[i])
//}

for name in names {
    if name == "Mehmet" {
        continue
    }
    print(name)
}

for name in names where name == "Mehmet" {
    print(name)
}


let surnames = ["Korkmaz", "Yeter", "Saglam"]

for (indice, surname) in surnames.enumerated() {
    print(surname)
    print(indice)
    if surname == "Saglam" {
        print("i found")
    }
}

//switch myDouble {
//case 0:
//    //Do something
//    fallthrough
//case 1, 2:
//    //Do something
//case 2..<50:
//    //Do something
//default:
//    //Do something
//}
//

//let myTuple = (1,2)
//
//switch myTuple {
//case 1,2:
//case (_, 2):
//case (1, _):
//
//}


//Functions

func methodName() {
    //Do something
}

func printName(name: String) { // printName(name: "SEMIH")
    //Do something
    print(name)
}

func log(_ name: String) { // log("SEMIH")
    //Do something
    print(name)
}

func log(name: String, surname: String) { // printName(name: "SEMIH", surname: "UNLU")
    //Do something
    print(name)
}

@discardableResult
func characterCountOf(_ str: String) -> Int { //characterCountOf("Selma")
    return str.count
}

let count = characterCountOf("Selam")



func makeHello() -> String {
    return "Hello"
}

func sayHello(name: String, helloString: String) { //sayHello(name: "SEMIH", helloString: makeHello())
    print( name + helloString )
}
//
//f(X)
//
//f(g(x)) = fog(x)

func speakLikeSakipSabanci(name: String) {

    var greetingWord: String

    func makeGreetingWord() -> String {
        //Do Something
        return "Calismaak"
    }

    greetingWord = makeGreetingWord()

    for i in 0...3 {
        print("\(greetingWord) ")
    }
}

func calculateCount(name testString: String) { //calculateCount(name: "sdfasxdads")
    print(name.count)
}

func calculatePosition(with frame: CGRect) { //calculatePosition(with: MyFrame)

}



var balance = 100
func pay(amount: Double, balance: inout Double) {
    //pay(amount: 45, balance: balanceWithAddress) //with inout
    //pay(amount: 100, balance: balanceWithValue) //without inout

}

func printAndLog(int: Int) {
//    print(int)
//    log(int)
}

func printAndLog(string: String) {
//    print(int)
  //
}

func printAndLog(double: Double) {
//    print(int)
  //
}


//Enum
enum MyEnumType {
    case myCase1
    case myCase2
}

var myEnum: MyEnumType = .myCase1

switch myEnum {
case .myCase1:
    //Do something
    break
case .myCase2:
    //Do something
    break
}

var intPresentationType: Int = 0 //0 = fullScreen, 1 = overcurrentContext, 2 = modal, 3 = bottomSheet

switch intPresentationType {
case 0: //fullScreen
    break
case 1: //over..
    break
case 2: // modal
    break
default:
    break
}

enum PresentationType {
    case fullScreen
    case overcurrentContext
    case modal
    case bottomSheet
}

var enumPresentationType: PresentationType

switch enumPresentationType {
case .fullScreen:
    break
case .overcurrentContext:
    break
case .modal:
    break
case .bottomSheet:
    break
}

enum Response {
    case success(Data)
    case error(Error?)
}

var ourResponse: Response

switch ourResponse {
case .success(let data):
    //decode myData
    break
case .error(let error):
//    if error != nil {
//        log(error)
//    }
    break
}

enum Direction: String {
    case vertical
    case horizontal
}

var objectDirection: Direction? = Direction(rawValue: "vertical")

enum Dogs: CaseIterable {
    case terrier
    case retreiver //90

//    var name: String {
//        switch self {
//        case .terrier:
//            return "teriyer"
//        }
//    }()
}

//Dogs.allCases




//Optionals

//enum Optional {
//    case .some(Any)
//    case .none(nil)
//}

// ?

var variableName: String? = "My Variable"
print(variableName) // Optional("My Variable")

var variableNilName: String?
print(variableNilName) // Optional(nil)

var myOtherVariable: String! = "SEM" // = myOtherVariable = "SEM"
//myOtherVariable.count X

struct SomeStruct {
    var property = "some"
}

struct MyStruct {
    var myStructVariable: SomeStruct?
}

var myStruct = MyStruct()
var property = myStruct.myStructVariable?.property ?? "abc"

if let value = myStruct.myStructVariable?.property {
    // if value defined
    var property = value

} else {
    // if value is nil
}

//guard let value = myStruct.myStructVariable?.property else {
//    //log
//    return
//}

var prperty = value

if let value = myStruct.myStructVariable?.property {
    // if value defined
    var property = value
    if let value = myStruct.myStructVariable?.property {
        // if value defined
        var property = value
        if let value = myStruct.myStructVariable?.property {
            // if value defined
            var property = value
            if let value = myStruct.myStructVariable?.property {
                // if value defined
                var property = value
                if let value = myStruct.myStructVariable?.property {
                    // if value defined
                    var property = value

                } else {
                    // if value is nil
                }
            } else {
                // if value is nil
            }
        } else {
            // if value is nil
        }
    } else {
        // if value is nil
    }
} else {
    // if value is nil
}


//Class Struct ortak
/*
1- func, variable, constant, vb..
 2- protocol'e comfirm edebilir
 */

//Struct
/*
1- Value type
2- Inheritance yok
3- Ref. count'u artirmaz
 */
struct MyAwesomeStruct {

}

//Class
/*
1- Reference type
2- Blok icerisinde deinit{} func izlenebilir
3- Inheritance var
4- Kullanilmaya basladiklarinda Ref. countu artirirlar
*/

class SuperClass {
    var myVariable: String = "2"
}

class MyAwesomeClass: SuperClass {
    deinit {
        //It triggers when class deinitted
    }
}

var myAwesomeClassVariable =  MyAwesomeClass()
var myAwesomeClassVariable2 =  MyAwesomeClass()
var mySuperClassVariable: SuperClass = myAwesomeClassVariable as! SuperClass

struct StructShape {
    var name: String!
}

class ClassShape: Equatable {
    var name: String
    var id: Int

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }

    static func == (lhs: ClassShape, rhs: ClassShape) -> Bool {
        return (lhs.id == rhs.id) && (lhs.name == rhs.name)
    }
}

var structShapeVar = StructShape(name: "rect")
var classShapeVar = ClassShape(name: "rect", id: 1)
var classShapeVar2 = ClassShape(name: "rect", id: 2)

var myFirstInt = 1
var mySecondInt = 2

if classShapeVar == classShapeVar2 {

}

if classShapeVar !== classShapeVar2 { //identically equal

}

class Shape {
    var name: String //default access modifier is internal = protected
    var length: Int
    var edge: Int {
        get {
            //get from userDefaults
        }
        set {
            //set to UserDefaults
        }
    }

    init(name: String,
         length: Int,
         edge: Int) {
        self.name = name
        self.length = length
        self.edge = edge
    }

    lazy var shapeArea: Int = {
        return self.length * self.edge
    }()
}

var rectangle = Shape(name: "Rect", length: 10, edge: 4)

print(rectangle.shapeArea)

//private variable'a class disindan erisilemez, subclasstan erisilemez
//internal variable'a class disindan erisilemez, subclasstan erisilebilir
//public variable'a class disindan erisilebilir, subclasstan erisemez
//open variable'a class disindan erisebilebilir, subclasstan erisilebilir + target disindan erisilebilir
