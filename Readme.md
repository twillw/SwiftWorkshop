#Swift

Swift is the newest programming language from Apple that they plan to eventually replace Objective-C.
It is a compiled language (not interpreted like Python or Javascript).

Important to point out: `Swift != iOS Programming`

Swift is merely a programming language that Apple has built their own frameworks with that we can use to build iOS, OS X, tvOS, and watchOS apps.


Syntactically it is much more approachable:
**Objective-C:**
```objective-c
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 
[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
```
**Swift:**
```swift
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
print(dateFormatter.stringFromDate(NSDate()))
```

##Swift Basics

####Swift is "strongly typed"
```swift
// type is explicity stated
let myName: String = "Tom"

// type can also be inferred unlike Java or Obj-C
let myName = "Tom"
```

####Declaring variables `let` vs `var`
```swift
let someString = "My String"

var someMutableString = "My mutable string"
someMutableString = "I can change this string"
```
> Rule of thumb: use `let` unless you know you need to mutate the value held by the variable

####Basic types:
```swift
// Numbers
let int: Int = 5
let double: Double = 4.55
let float: Float = 0.5

// Arrays
// array of strings
let arrayOfStrings: [String] = ["one", "two", "three"]

// array containing any type
let arrayOfAnything: [AnyObject] = [1, "two", 3]

// dictionary
let myDictionary: [String: String] = ["key": "value", "myName": "Tom"]
let numberStrings: [Int: String] = [5: "five", 20: "twenty"]
```

####Classes
Swift is an Object-Oriented language making classes are extremely important. 
Basic Swift class implementation:
```swift
class Car {

  // basic property declaration
  // can change the color of a car with new paint
  var color: String
  // can't really change  the number of doors or cylinders
  let doors: Int
  let numberOfCylinders: Int

  // constructor function used to instantiate class
  init(color: String, doors: Int, numberOfCylinders: Int) {
    self.color = color
    self.doors = doors
    self.numberOfCylinders = numberOfCylinders
  }

  // we can add instance methods to a class
  func drive(location: String) {
   // drive car to location
  }
}
```

Now outside of class declaration we can create instances of our car class:

```swift
var coupe = Car(color: "red", doors: 2, numberOfCylinders: 6)

// can now call drive on our car instance
coupe.drive(location: "Pizza Hut")

// can also set the properties on our instance provided they are mutable
print(car.color) // "red"
car.color = "blue"
print(car.color) // "blue"

car.doors = 3 // this will cause an error because doors is a let instance property
```

####Optionals
You'll see in Swift a lot of `?` and `!` 
These indicate an **optional**. Meaning the variable can either hold a value or it can be `nil`

```swift
// this variable is an Optional
var optionalString: String? = "This can be nil"

print(optionalString) // "Optional("This can be nil")"

// exclamation mark force unwraps the optional
print(optionalString!) // "This can be nil"

// force unwrapping can be dangerous
optionalString = nil
print(optionalString!) // THIS WILL CRASH YOUR APP

// two ways to safely unwrap optionals
if let safeString = optionalString {

  // safeString variable now holds safely unwrappingpped optionalString inside of this block
  print(safeString)
}

guard let safeString = optionalString else {
// this block is only executed if optionalString is nil
}
// safeString can be used safely outside of this block
```

####Closures

Closures are used quite heavily in swift similar to callbacks in Javascript.
In swift we cannot pass a function as a parameter, so we use these **closures** or **blocks** to be passed around.

In the example of a jQuery animation
```javascript
$( "#myDiv" ).animate({
  opacity: 0.25
}, 5000, function() {
  // callback to be executed when animation is complete
})
```

In the example of an iOS animation using swift
```swift
UIView.animateWithDuration(0.8, animations: {
    // this is actually a closure that contains the final values to animate to
}, 
completion: { success in
  // this is a closures that is run when the animation is complete. It is passed 1 parameter, whether the animation completed successfully.
})
```

Closures are declared like so: 
```swift
var someClosure: () -> Void = {
  print("HEYY")
}
someClosuremeClosure() // executes block of code in closure

// this closure accepts a parameter and returns a string
var reverseString: (String) -> String
reverseString = {
  textToReverse in

    return String(textToReverseerse.characters.reverse())
}

print(reverseString("hey")) // "yeh"
```
