import UIKit
import Foundation

/*
{ (parametre) -> ReturnType in
    statement
}
*/

/*
numbers.filter { (number) -> Bool in return number > 10 }


f(g(x))

func funcName(parameter: InputType) -> ReturnType {
    //func body
}

func makeHello() -> String { // () -> String
    return "Hello"
}

func sayHello(name: String, helloString: String) { //sayHello(name: "Mustafa", helloString: makeHello())
    print(name + helloString)
}

func sayHello(name: String, helloString: () -> String) {

}

func sum(first: Int, second: Int) -> Int {
    return first + second
}

func multiply(first: Int, second: Int) -> Int {
    return first * second
}

func calculate(first: Int, operand: ((Int, Int) -> Int) , second: Int) -> Int {
    return operand(first, second)
}

//calculate(first: 1, operand: sum, second: 4)
//calculate(first: 1, operand: multiply, second: 4)

MyClass > MySystem > CompletionClosure > MyClass

class MySystem {
    func request(with parameter: Parameter, completion: (Data) -> Void) {
        //doSomething
        completion(mySystem.doSomething(with: parameter))
    }
}

class MyClass {
    var classData: Data?

    func showData() {
        let system = MySystem()

        system.request(with: parameter) { [weak self] data in
            print(data)

            guard let self = self else { return }
            self.classData = data //self <-> data_
            self.classData2 = data //self <-> data
            self.classData3 = data //self <-> data
            self.classData4 = data //self <-> data
            self.classData5 = data //self <-> data

            let a = 123
        }

        func someOtherFunc() {
            print(classData)
        }
    }
}

// escaping = fonksiyonu cagirdiginizda async bir sekilde closure degeri size verecek (escaping)
// non-escaping fonksiyonu cagirdiginizda sync bir sekilde closure degerleri cagiran yapiya donuyorsa (non-escaping)

func download(with url: URL, callback: @escaping (Data) -> Void)

*/

//Higher order functions
/*
// sorted: basit bir kosula gore siralama yapar
var numbers = [34, 2, 11111, 0, 5]
numbers.sorted(by: >)
//numbers.sorted { ($0, $1) in
//    return $0 > ($1 * 3) + 15
//}
numbers.sorted { first, second in
    return first > (second * 3) + 15
}

func compare(first: Int, second: Int) -> Bool {
    return first > second
}

numbers.sorted(by: compare)

// map: aldigi diziyi baska bir diziye donusturur
numbers.map { number in
    return "\(number) siradasiniz"
}

//filter: belli bir kosula gore filtrelenmis bir array olusturur

numbers.filter { number in
    return number > 100
} // numbers = [11111]

numbers.filter { number in
    return //2ye bolunebilmesi
}


//reduce: array elemanlarini birlestirip yeni bir turde obje olusturmaya yariyor

let summary = numbers.reduce(0) { x, y in
    return x + y //
}

var letters = ["S", "E", "M"]

// compactMap: map fonksiyonuyla ayni isleve sahip + nil olan degerleri filtreliyor

// foreach: bildiginiz for dongusu
numbers.forEach { number in
    print(number)
}

//contains: bir arrayde bir eleman varsa true yoksa false donen fonksiyon
numbers.contains(5)

//first last
numbers.first

//removeFirst
numbers.removeFirst()

//removeAll
numbers.removeAll { number in
    return number > 10
}

//split arraylerde calisiyor. arrayleri subarraylere bolmeye yariyor
let sentence = "Merhaba bugun hava cok soguk"
let words = sentence.split(separator: " ")




*/

// Protocols
//protocol MyProtocol2 {
//
//}
//
//protocol MyProtocol {
//    var someVariable: Int { get }
//    var someVariable2: Int { get set }
//
//    func myFunc()
//}
//
//class MySuperClass { }
//
//class MyClass: MySuperClass, MyProtocol, MyProtocol2 {
//    override init() {
//
//    }
//    var someVariable: Int
//
//    var someVariable2: Int
//
//    func myFunc() {
//
//    }
//
//
//}
//
//struct MyStruct: MyProtocol {
//    var someVariable: Int
//
//    var someVariable2: Int
//
//    func myFunc() {
//
//    }
//
//    var myInt = 0
//
//}
//
//
//protocol Toggleble {
//    mutating func toggle()
//    func printDescription()
//}
//
//enum SwitchEnum: Toggleble {
//    case off, on
//
//    mutating func toggle() {
//        switch self {
//        case .on:
//            self = .off
//        case .off:
//            self = .on
//        }
//    }
//
//    func printDescription() {
//        print(self == .on ? "On" : "Off")
//    }
//
//}
//
//
//protocol ProtocolA {
//    func myFuncA()
//}
//
//protocol ProtocolB: ProtocolA {
//    func myFuncB()
//}
//
//struct NewStruct: ProtocolB {
//    func myFuncB() {
//
//    }
//
//    func myFuncA() {
//
//    }
//}

//Delegate

/*
protocol DownloaderProtocol: NSObject {
    func downloading(progres: Double)
}

//Downloader > delegate > MyViewController > Downloader

class Downloader { //Downloader > VC
    weak var delegate: DownloaderProtocol?
    private var progress: Int = 0

    func start() {
        //control
        self.download()
    }
    func pause() {

    }
    func stop() {

    }

    private func download() {
        //download progress
        //has download started?

        self.delegate?.downloading(progres: progress)
    }
}

class MyViewController: NSObject {
    let downloader = Downloader()

    @IBOutlet weak var progressLabel: UILabel!

    @IBAction func downloadButtonTapped(_ sender: UIButton) {
        downloader.start()
        downloader.delegate = self
    }
}

extension MyViewController: DownloaderProtocol {
    func downloading(progres: Double) {
        progressLabel.text = "%\(progres*100)"
    }
}

*/
//
////Notification:
//
////A -> B
////A post
////B observe
//
//
//let notificationName = Notification.Name(rawValue: "myNotificationName")
//
////A
//NotificationCenter.default.post(name: notificationName, object: nil, userInfo: nil)
//
////B
//NotificationCenter.default.addObserver(self, selector: #selector(myMethod(_:), name: notificationName, object: nil))
//
//
//
////Delegate
//VC - view
//VC - VC
//class - class
//
////Notification
//VC - xClass //kel alaka
//Reachability class > internet geldiginde ve gittiginde haber versin
//
//A->B

// Extension


//
//class Int {
//
//}
//
//extension Int {
//    static var length: Int {
//        // count of step
//    }
//
//    func convertToString() -> String {
//        return String(self)
//    }
//}
//
//class MyClass {
//    func print() {
//        123.convertToSting()
//    }
//}
//
//class MyUIViewController: UIViewController {
//    func someFunc() {
//        myLabel.text = "hello".localize
//    }
//}
//
//extension MyUIViewController: UITableViewDelegate, UITableViewDataSource { // 500
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//}

//extension String {
//    static var localize: String = {
//        return NSLocalizedString(self, comment: "")
//    }
//}

//var myDog: Dog? = Dog(name: "Boncuk")
//var myDog2 = myDog
//myDog = nil
//myDog2 = nil
/*
class Dog {
    let name: String
    weak var owner: Owner?

    init(name: String) {
        self.name = name

        print("\(name) initilazed")
    }

    deinit {
        print("\(name) deinitilazed")
    }
}

class Owner {
    let name: String
    var dog: Dog?

    init(name: String) {
        self.name = name

        print("\(name) initilazed")
    }

    deinit {
        print("\(name) deinitilazed")
    }
}

var dog: Dog? = Dog(name: "Boncuk")
var owner: Owner? = Owner(name: "Ahmet")

dog?.owner = owner
owner?.dog = dog

dog = nil
owner = nil

//weak -> optional hem de zayif bagdir
//unowned -> optional degildir ama zayif bagdir
*/




//Error handling
/*
//syntax error -> runtime error -> logic error
func show(balance: Double) {

} //show(balanace: "Mahmut")

let numbers = [1, 2, 3, 4, 5]
//numbers[7]

var someVar: String!


enum AccountError: Error {
    case insufficientBalance //yetersiz bakiye
}

class Account {
    var balance: Double

    init(balance: Double) {
        self.balance = balance
    }

    func deposit(_ amount: Double) {
        balance += amount
    }

    func withdraw(_ amount: Double) throws {
        if balance > amount {
            balance -= amount
        } else {
            throw AccountError.insufficientBalance
        }

    }
}

class MyAccountInteraction {
    var myAccount = Account(balance: 100)

    func withdraw() {
        do {
            try myAccount.withdraw(2000)
        } catch {
            print(error)
        }
    }
}

var interaction = MyAccountInteraction()
interaction.withdraw()

//guard let decodedData = try? JSONDecoder().decode([MyType.self], from: data) else {
//    //custom error handling
//    return
//}
//
//let decodedData = try! JSONDecoder().decode([MyType.self], from: data)

enum LemonadeMakerError: Error {
    case noWater
    case lemonsAreRotten
}

struct LemonadeMaker {
    func prepare() -> Lemonade? {
        do {
            let water = try prepareWater()
            let lemon = try prepareLemon()

            return Lemonade(water: water, lemon: lemon)
        } catch {
            print(error)
            return nil
        }
    }

    func prepareWater() throws -> String {
        //prepare
        throw LemonadeMakerError.noWater
    }

    func prepareLemon() throws -> String {
        //prepare
        throw LemonadeMakerError.lemonsAreRotten
    }
}

struct Lemonade {
    let water: String
    let lemon: String
}

var lemonade = LemonadeMaker().prepare()
*/





//Generics
/*
let numbers = [1, 34, 2, 3, 4]

//func firstElement(of array: [Int]) -> Int {
//    return array[0]
//}

let names = ["Ahmet", "Mehmet", "Mustafa"]

//func firstElement(of array: [String]) -> String {
//    return array[0]
//}

func firstElement<T>(of array: [T]) -> T {
    return array[0]
}

let doubles = [12.1, 22.9, 99.0]

print(firstElement(of: numbers))

func findIndex<T: Equatable>(from array: [T], valueToFind: T) -> Int? {
    return array.firstIndex { item in
        return item == valueToFind
    }
}

findIndex(from: names, valueToFind: "Mustafa")
*/


protocol Flyable {
    func fly()
}

protocol Runnable {
    func run()
}

protocol Jumpable {
    func jump()
}

typealias Capabilities = Flyable & Runnable & Jumpable

func move<C: Capabilities>(character: C) {

}

//struct SpiderMan: Runnable, Jumpable {
//    func run() {
//    }
//
//    func jump() {
//    }
//}
//
//let spiderman = SpiderMan()
//move(character: spiderman)


enum Response<S: Decodable, F: Error> {
    case success(S)
    case failure(F)
}

struct Person: Decodable {
    var name: String
}

enum PersonError: Error {
    case notFound
}

func findPerson(completion: (Response<Person, PersonError>) -> Void) {
    //make request
    //response basarili ise
    let person = Person(name: "Semih")
    //veya
//    let error = PersonError.notFound
    completion(Response<Person, PersonError>.success(person))
}

findPerson { (result) in
    switch result {
    case .success(let person):
        //do something
        break
    case .failure(let error):
        //do something
        break
    }
}





protocol Parser {
    associatedtype Input
    associatedtype Output

    func parse(input: Input) -> Output
}

class HtmlParser: Parser {
    typealias Input = String

    typealias Output = Int

    func parse(input: String) -> Int {
        return 0
    }

}

class IntParser: Parser {
    typealias Input = Int

    typealias Output = Bool

    func parse(input: Int) -> Bool {
        return true
    }

}
