import Foundation
import XCTest

// MARK: - Should not be modified

/*
 Test cases, should not be modified
 */

enum DictionaryOperation {
    case remove(String), update(String, Int), add(String, Int)
}

protocol SwiftFundamentals1Protocol {
    func generateUniqueEvenIntArray(size: Int) -> [Int]
    func filterEvenNumbers(array: [Int]) -> [Int]
    func longNumberText(number: Int) -> String
    func reverse(array: [Int]) -> [Int]
    func insert(array: [Int], value: Int, position: Int) -> [Int]
    func isNumberEven(number: Int, callback: (Bool) -> Void)
    func fillSentence(sentence: inout String, words: [String])
    func getUniqueElements(array: [Int]) -> [Int]
    func commonElements(set1: Set<Int>, set2: Set<Int>) -> Set<Int>
    func subtract(original: Set<Int>, diff: Set<Int>) -> Set<Int>
    func applyDictionaryOperations(_ operations: [DictionaryOperation]) -> Dictionary<String, Int>
    func getValuesIfContains(from dictionary: Dictionary<String, Int>, with keys: Set<String>) -> Dictionary<String, Int>
    func updatePersonName(person: inout Person, name: String) -> Person
    func updateTrainName(train: inout Train, name: String) -> Train
    func createCat(with color: String) -> Cat
    func createCircle(with radius: Int, color: String) -> Circle
    func getCenter(of rect: Rect) -> Point
    func filterShapes(items: [Any]) -> [Shape]
    func setCounter(counter: inout BigCounter, value: Int)
    func move(circle: inout MovingCircle, by: Point)
    func killObject(liveObject: inout LiveObject?)
    func getCircleAreas(shapes: [Shape]) -> Dictionary<String, [Double]>
}

class SwiftFundamentalsTest1: XCTestCase {
    
    var instance: SwiftFundamentals1Protocol!
    
    override func setUp() {
        super.setUp()
        
        self.instance = SwiftFundamentals1()
    }
    
    func testUniqueEvenIntArray() {
        let size = 100
        let array = self.instance.generateUniqueEvenIntArray(size: size)
        
        XCTAssertEqual(array.count, size, "Array size should be equal \(size)")
        
        let allEven = array.allSatisfy { value in
            value % 2 == 0
        }
        
        XCTAssertTrue(allEven, "All numbers should be even")
        
        let allUnique = Set(array).count == array.count
        
        XCTAssertTrue(allUnique, "All numbers should be unique")
    }
    
    func testFilterEvenNumbers() {
        let array = [
            901,722,917,804,117,610,170,734,543,370,11,221,32,794,832,635,315,230,957,559,706,904,31,94,919,20,117,937,136,593,263,195,387,41,765,291,967,533,582,391,920,36,676,959,569,436,319,184,826,799,590,239,530,802,639,884,38,314,552,743,748,7,384,612,189,789,975,763,644,144,344,800,366,687,569,604,354,393,73,649,620,879,534,306,573,718,74,50,920,262,561,677,905,387,300,728,455,768,571,172,382]
        let filteredArray = self.instance.filterEvenNumbers(array: array)
        
        let expectedFilteredArray = [
            722,804,610,170,734,370,32,794,832,230,706,904,94,20,136,582,920,36,676,436,184,826,590,530,802,884,38,314,552,748,384,612,644,144,344,800,366,604,354,620,534,306,718,74,50,920,262,300,728,768,172,382,
        ]
        
        XCTAssertEqual(filteredArray, expectedFilteredArray, "The array should return only even numbers")
    }
    
    func testLongNumberText() {
        let number = 530
        let text = self.instance.longNumberText(number: number)
        let expectedValue = "0123456789101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899100101102103104105106107108109110111112113114115116117118119120121122123124125126127128129130131132133134135136137138139140141142143144145146147148149150151152153154155156157158159160161162163164165166167168169170171172173174175176177178179180181182183184185186187188189190191192193194195196197198199200201202203204205206207208209210211212213214215216217218219220221222223224225226227228229230231232233234235236237238239240241242243244245246247248249250251252253254255256257258259260261262263264265266267268269270271272273274275276277278279280281282283284285286287288289290291292293294295296297298299300301302303304305306307308309310311312313314315316317318319320321322323324325326327328329330331332333334335336337338339340341342343344345346347348349350351352353354355356357358359360361362363364365366367368369370371372373374375376377378379380381382383384385386387388389390391392393394395396397398399400401402403404405406407408409410411412413414415416417418419420421422423424425426427428429430431432433434435436437438439440441442443444445446447448449450451452453454455456457458459460461462463464465466467468469470471472473474475476477478479480481482483484485486487488489490491492493494495496497498499500501502503504505506507508509510511512513514515516517518519520521522523524525526527528529530"
        
        XCTAssertEqual(text, expectedValue, "Number sequence should be appended into a string")
    }
    
    func testReverse() {
        let array = [901,722,917,804,117,610,170,734,543,370,11,221,32,794,832,635,315,230,957,559,706,904,31,94,919,20,117]
        let reversedArray = self.instance.reverse(array: array)
        let expectedValue = [901, 722, 917, 804, 117, 610, 170, 734, 543, 370, 11, 221, 32, 794, 832, 635, 315, 230, 957, 559, 706, 904, 31, 94, 919, 20, 117]
        
        XCTAssertEqual(reversedArray, expectedValue, "Array should be reversed")
    }
    
    func testInsertArray() {
        let array = [901,722,917,804,117]
        let value = 10
        let position = 2
        let insertedArray = self.instance.insert(array: array, value: value, position: position)
        let expectedValue = [901, 722, 10, 917, 804, 117]
        
        XCTAssertEqual(insertedArray, expectedValue, "Value should be inserted in a correct position")
    }
    
    func testCallbackFunction() {
        let numbers = [23, 44, 63, 62, 1, 29, 50]
        var isEvenResult = [Bool]()
        let expectedValue = [false, true, false, true, false, false, true]
        
        numbers.map { number in
            self.instance.isNumberEven(number: number) { isEven in
                isEvenResult.append(isEven)
            }
        }
        
        XCTAssertEqual(isEvenResult, expectedValue, "Callback method should be called correctly")
    }
    
    func testFillSentence() {
        var notCompleteSentence = "Apple caused a {word} panic among marketers in {word} 2021 by effectively making this tracking impossible in the default Mail app on iPhone, {word}, and Mac. I, personally, switched to {word} as soon as the feature was announced. You might feel the same way, but {word} feel as though they've lost a useful tool."
        let words = ["small", "September", "iPad", "Apple Mail", "marketers"]
        let expectedValue = "Apple caused a small panic among marketers in September 2021 by effectively making this tracking impossible in the default Mail app on iPhone, iPad, and Mac. I, personally, switched to Apple Mail as soon as the feature was announced. You might feel the same way, but marketers feel as though they've lost a useful tool."
        
        self.instance.fillSentence(sentence: &notCompleteSentence, words: words)
        
        XCTAssertEqual(notCompleteSentence, expectedValue, "Sentence should be filled correctly")
    }
    
    func testGetUniqueElements() {
        let arr: [Int] = [1, 12, 14, 16, 1, 20, 12, 14]
        let expectedValue = [1, 12, 14, 16, 20]
        
        let result = self.instance.getUniqueElements(array: arr)
        
        XCTAssertEqual(result, expectedValue, "Array should contain only unique values")
    }
    
    func testCommonElements() {
        let set1: Set = [4, 2, 8, 0, 9, 3, 5]
        let set2: Set = [1, 4, 9, 3, 7]
        let expectedValue: Set = [9, 3]
        
        let result = self.instance.commonElements(set1: set1, set2: set2)
        
        XCTAssertEqual(result, expectedValue, "Set should contain only common elements")
    }
    
    func testSubtract() {
        let set: Set = [4, 2, 8, 0, 9, 3, 5]
        let diff: Set = [1, 4, 9, 3, 7]
        let expectedValue: Set = [4, 2, 8, 0, 5]
        
        let result = self.instance.subtract(original: set, diff: diff)
        
        XCTAssertEqual(result, expectedValue, "Set should contain only different values of `diff` set")
    }
    
    func testDictionaryOperations() {
        let operations: [DictionaryOperation] = [
            .remove("test"),
            .update("het", 1),
            .add("hat", 12),
            .add("cat", 5),
            .add("pearl", 89),
            .update("hat", 1),
            .remove("pearl"),
            .add("apple", 24),
            .remove("pearl"),
            .update("hat", 3)
        ]
        let expectedValue: Dictionary<String, Int> = [
            "hat": 3,
            "cat": 5,
            "apple": 24
        ]
        
        let result = self.instance.applyDictionaryOperations(operations)
        
        XCTAssertEqual(result, expectedValue, "Dictionary should contain final values after operations")
    }
    
    func testGetValuesIfContains() {
        let dictionarySet: Dictionary<String, Int> = [
            "apple": 1,
            "pear": 3,
            "grapes": 8,
            "coconut": 10,
            "watermelon": 9
        ]
        let keys: Set<String> = ["grapes", "coconut"]
        
        let expectedValue: Dictionary<String, Int> = [
            "grapes": 8,
            "coconut": 10
        ]
        
        let result = self.instance.getValuesIfContains(from: dictionarySet, with: keys)
        
        XCTAssertEqual(result, expectedValue, "Dictionary should contain selected keys")
    }
    
    func updatePersonName(person: inout Person, name: String) -> Person {
        return person
    }
    
    func updateTrainName(train: inout Train, name: String) -> Train {
        return train
    }
    
    func createCat(with color: String) -> Cat {
        return Cat(color: color)
    }
    
    func createCircle(with radius: Int, color: String) -> Circle {
        return Circle(radius: radius, color: color)
    }
    
    func getCenter(of rect: Rect) -> Point {
        return rect.center
    }
    
    func filterShapes(items: [Any]) -> [Shape] {
        return []
    }
    
    func setCounter(counter: inout BigCounter, value: Int) {
        counter.value = value
    }
    
    func move(circle: inout MovingCircle, by: Point) {
        circle.move(by: by)
    }
    
    func killObject(liveObject: inout LiveObject?) {
        liveObject = nil
    }
    
    func getCircleAreas(shapes: [Shape]) -> Dictionary<String, [Double]> {
        let result = Dictionary<String, [Double]>()
        
        return result
    }
    
    func testUpdatePersonName() {
        var person = Person(name: "Name")
        let newName = "New Name"
        self.instance.updatePersonName(person: &person, name: newName)
        
        XCTAssertEqual(person.name, newName, "Name is not updated")
    }
    
    func testUpdateTrainName() {
        var train = Train(name: "Name")
        let newName = "New train Name"
        self.instance.updateTrainName(train: &train, name: newName)
        
        XCTAssertEqual(train.name, newName, "Name is not updated")
    }
    
    func testCreateCat() {
        let colorName = "red"
        let cat = self.instance.createCat(with: colorName)
        
        XCTAssertEqual(cat.legCount, 4, "Cat should have 4 legs")
        XCTAssertEqual(cat.color, colorName, "Cat should have color: \(colorName)")
    }
    
    func testCreateCircle() {
        let colorName = "yellow"
        let radius = 5
        
        let circle = self.instance.createCircle(with: radius, color: colorName)
        
        XCTAssertEqual(circle.radius, radius, "Circle should have radius: \(radius)")
        XCTAssertEqual(circle.color, colorName, "Circle should have color: \(colorName)")
    }
    
    func testCenterOfRect() {
        let width = Int.random(in: 1...10)
        let height = Int.random(in: 1...10)
        let size = Size(width: width, height: height)
        let origin = Point(x: 0, y: 0)
        let colorName = "blue"
        let rect = Rect(origin: origin, size: size, color: colorName)
        
        let rectCenter = self.instance.getCenter(of: rect)
        
        let expectedValue = Point(x: (origin.x + width) / 2, y: (origin.y + height) / 2)
        
        XCTAssertEqual(rectCenter, expectedValue, "Center of rect should be equal: \(expectedValue)")
    }
    
    func testFilterShapes() {
        let person = Person(name: "John")
        let train = Train(name: "Train")
        let shape = Shape(color: "red")
        let circle = Circle(radius: 5, color: "yellow")
        let rect = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10), color: "blue")
        
        let items: [Any] = [person, train, shape, circle, rect]
        
        let result = self.instance.filterShapes(items: items)
        
        XCTAssert(result.count == 3, "Array should contain only shapes")
    }
    
    func testCounter() {
        var counter = BigCounter()
        
        let randNumbers = [
            1,
            5,
            7,
            0,
            10,
            14,
            Int.random(in: 0...100),
            Int.random(in: 0...100),
            Int.random(in: 0...100)
        ]
        
        randNumbers.forEach { randomNumber in
            self.instance.setCounter(counter: &counter, value: randomNumber)
            
            XCTAssert(counter.value >= 10, "Counter value should be more than 10, but current is \(counter.value)")
        }
    }
    
    func testCircleMove() {
        let randomX = Int.random(in: 2...10)
        let randomY = Int.random(in: 3...20)
        let radius = Int.random(in: 1...10)
        
        let moveBy = Point(x: randomX, y: randomY)
        
        var circle = MovingCircle(radius: radius, color: "blue")
        
        self.instance.move(circle: &circle, by: moveBy)
        
        let expectedCenter = Point(x: randomX + radius, y: randomY + radius)
        
        XCTAssertEqual(circle.center, expectedCenter)
    }
    
    func testKillObject() {
        var lastMessageReceived: Bool = false
        
        var liveObject: LiveObject? = LiveObject { receivedMessage in
            if lastMessageReceived {
                XCTAssertThrowsError("Last message should be called only once")
            } else {
                lastMessageReceived = true
            }
            
        }
        
        self.instance.killObject(liveObject: &liveObject)
        
        XCTAssert(lastMessageReceived, "Live object should send its last message before dying")
    }
    
    func testCircleAreas() {
        let rect1 = Rect(origin: Point(x: 0, y: 0), size: Size(width: 3, height: 4), color: "red")
        let rect2 = Rect(origin: Point(x: 0, y: 2), size: Size(width: 10, height: 4), color: "yellow")
        let rect3 = Rect(origin: Point(x: 2, y: 6), size: Size(width: 10, height: 4), color: "magenta")
        let circle1 = Circle(radius: 8, color: "blue")
        let circle2 = MovingCircle(radius: 5, color: "green")
        let circle3 = Circle(radius: 8, color: "blue")
        let shapes = [
            rect1,
            circle1,
            circle2,
            rect2,
            rect3,
            circle3
        ]
                
        let result = self.instance.getCircleAreas(shapes: shapes)
        
        let expectedValue: Dictionary<String, [Double]> = [
            "blue": [
                circle1.getArea(),
                circle3.getArea()],
            "green": [
                circle2.getArea()
            ]
        ]
        
        XCTAssertEqual(result, expectedValue, "Area of circles are not correct")
    }
}


// MARK: - Can be modified

/*
 Testing classes, should be implemented with correct body
 */

class SwiftFundamentals1: SwiftFundamentals1Protocol {
    func generateUniqueEvenIntArray(size: Int) -> [Int] {
        // return an array of random, unique, even integer numbers with the size of `number`
        return []
    }
    
    func filterEvenNumbers(array: [Int]) -> [Int] {
        // return the filtered version of `array` only contains even numbers
        return []
    }
    
    func longNumberText(number: Int) -> String {
        // return the integer number sequence until `number` with appended into a string
        // example: input `number` = 5, output should be "012345"
        return ""
    }
    
    func reverse(array: [Int]) -> [Int] {
        // return the reversed array of integer array `array`
        return []
    }
    
    func insert(array: [Int], value: Int, position: Int) -> [Int] {
        // insert the `value` into `position` of `array` and return the result array
        return []
    }
    
    func isNumberEven(number: Int, callback: (Bool) -> Void) {
        // compare the `number` is even, then return the result with callback
    }
    
    func fillSentence(sentence: inout String, words: [String]) {
        // replace the occurence of `{word}` substrings in the `sentence` value with `words`
    }
    
    func getUniqueElements(array: [Int]) -> [Int] {
        // return the only unique elements of array
        return []
    }
    
    func commonElements(set1: Set<Int>, set2: Set<Int>) -> Set<Int> {
        // return the set of elements occurs in both of the set
        return Set<Int>()
    }
    
    func subtract(original: Set<Int>, diff: Set<Int>) -> Set<Int> {
        // return the set of elements of `original` which are not present in `diff` set
        return Set<Int>()
    }
    
    func applyDictionaryOperations(_ operations: [DictionaryOperation]) -> Dictionary<String, Int> {
        // create an empty dictionary, and apply `operations` by order
        return Dictionary<String, Int>()
    }
    
    func getValuesIfContains(from dictionary: Dictionary<String, Int>, with keys: Set<String>) -> Dictionary<String, Int> {
        // return the dictionary with key and value pairs if key occurs in `keys` set
        return Dictionary<String, Int>()
    }
    
    func updatePersonName(person: inout Person, name: String) -> Person {
        return person
    }
    
    func updateTrainName(train: inout Train, name: String) -> Train {
        return train
    }
    
    func createCat(with color: String) -> Cat {
        return Cat(color: color)
    }
    
    func createCircle(with radius: Int, color: String) -> Circle {
        return Circle(radius: radius, color: color)
    }
    
    func getCenter(of rect: Rect) -> Point {
        return rect.center
    }
    
    func filterShapes(items: [Any]) -> [Shape] {
        return []
    }
    
    func setCounter(counter: inout BigCounter, value: Int) {
        counter.value = value
    }
    
    func move(circle: inout MovingCircle, by: Point) {
        circle.move(by: by)
    }
    
    func killObject(liveObject: inout LiveObject?) {
        liveObject = nil
    }
    
    func getCircleAreas(shapes: [Shape]) -> Dictionary<String, [Double]> {
        let result = Dictionary<String, [Double]>()
        
        return result
    }
}

struct Person {
    private var _name: String
    
    var name: String {
        get {
           return _name
        }
    }
    
    init(name: String) {
        self._name = name
    }
    
    func update(newName: String) {
        
    }
}

class Train {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func update(newName: String) {
    }
}

class Animal {
    let legCount: Int
    
    init(legCount: Int) {
        self.legCount = legCount
    }
}

class Cat: Animal {
    let color: String
    
    init(color: String) {
        self.color = ""
        super.init(legCount: 0)
    }
}

class Shape {
    let color: String
    
    required init(color: String) {
        self.color = color
    }
}

class Circle: Shape {
    let radius: Int = 0
    
    init(radius: Int, color: String) {
        super.init(color: "")
    }
    
    required init(color: String) {
        fatalError("init(color:) has not been implemented")
    }
    
    func getArea() -> Double {
        return Double.pi * Double(radius) * Double(radius)
    }
}

struct Point: Equatable {
    let x: Int
    let y: Int
}

struct Size {
    let width: Int
    let height: Int
}

class Rect: Shape {
    let origin: Point
    let size: Size
    var center: Point {
        get {
            return Point(x: 0, y: 0)
        }
    }
    
    init(origin: Point,
         size: Size,
         color: String) {
        self.origin = origin
        self.size = size
        super.init(color: color)
    }
    
    required init(color: String) {
        fatalError("init(color:) has not been implemented")
    }
}

@propertyWrapper
struct TenOrMore {
    private var number = 8
    var wrappedValue: Int {
        get { return number }
        set { number = max(newValue, 8) }
    }
}

struct BigCounter {
    @TenOrMore var value: Int
    
    init() {
        self.value = 8
    }
}

class MovingCircle: Circle {
    var origin: Point
    var center: Point {
        get {
            return Point(x: origin.x + radius, y: origin.y + radius)
        }
        set {
            self.origin = Point(x: 0, y: 0)
        }
    }
    
    override init(
        radius: Int,
        color: String
    ) {
        self.origin = Point(x: 0, y: 0)
        super.init(radius: radius, color: color)
    }
    
    required init(color: String) {
        fatalError("init(color:) has not been implemented")
    }
    
    func move(by: Point) {
        // update only center
    }
}

class LiveObject {
    let onDeinit: (String) -> Void
    
    init(onDeinit: @escaping (String) -> Void) {
        self.onDeinit = onDeinit
    }
}


SwiftFundamentalsTest1.defaultTestSuite.run()
