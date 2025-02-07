// Typescript problems
var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __esDecorate = (this && this.__esDecorate) || function (ctor, descriptorIn, decorators, contextIn, initializers, extraInitializers) {
    function accept(f) { if (f !== void 0 && typeof f !== "function") throw new TypeError("Function expected"); return f; }
    var kind = contextIn.kind, key = kind === "getter" ? "get" : kind === "setter" ? "set" : "value";
    var target = !descriptorIn && ctor ? contextIn["static"] ? ctor : ctor.prototype : null;
    var descriptor = descriptorIn || (target ? Object.getOwnPropertyDescriptor(target, contextIn.name) : {});
    var _, done = false;
    for (var i = decorators.length - 1; i >= 0; i--) {
        var context = {};
        for (var p in contextIn) context[p] = p === "access" ? {} : contextIn[p];
        for (var p in contextIn.access) context.access[p] = contextIn.access[p];
        context.addInitializer = function (f) { if (done) throw new TypeError("Cannot add initializers after decoration has completed"); extraInitializers.push(accept(f || null)); };
        var result = (0, decorators[i])(kind === "accessor" ? { get: descriptor.get, set: descriptor.set } : descriptor[key], context);
        if (kind === "accessor") {
            if (result === void 0) continue;
            if (result === null || typeof result !== "object") throw new TypeError("Object expected");
            if (_ = accept(result.get)) descriptor.get = _;
            if (_ = accept(result.set)) descriptor.set = _;
            if (_ = accept(result.init)) initializers.unshift(_);
        }
        else if (_ = accept(result)) {
            if (kind === "field") initializers.unshift(_);
            else descriptor[key] = _;
        }
    }
    if (target) Object.defineProperty(target, contextIn.name, descriptor);
    done = true;
};
var __runInitializers = (this && this.__runInitializers) || function (thisArg, initializers, value) {
    var useValue = arguments.length > 2;
    for (var i = 0; i < initializers.length; i++) {
        value = useValue ? initializers[i].call(thisArg, value) : initializers[i].call(thisArg);
    }
    return useValue ? value : void 0;
};
var __setFunctionName = (this && this.__setFunctionName) || function (f, name, prefix) {
    if (typeof name === "symbol") name = name.description ? "[".concat(name.description, "]") : "";
    return Object.defineProperty(f, "name", { configurable: true, value: prefix ? "".concat(prefix, " ", name) : name });
};
// Beginner TypeScript Exercises
// 1. Type Annotations
// Q1: Declare a variable userName of type string and assign it a value.
var userN1 = "Swaroop";
// Q2: Create a variable age of type number and a variable isStudent of type boolean.
var ageper = 25;
var isStudents = true;
// Q3: Write a function add(a: number, b: number): number that returns the sum of two numbers.
function add1(a, b) {
    return a + b;
}
// 2. Arrays and Tuples
// Q4: Create an array numbers that can only contain numbers and add three values.
var numbers1 = [1, 2, 3];
// Q5: Define a tuple [string, number] representing a person's name and age.
var person1 = ["John", 30];
// Q6: Write a function that takes a tuple [string, number] and logs a message like: "John is 30 years old."
function printPersonInfo(person) {
    var name = person[0], age = person[1];
    console.log("".concat(name, " is ").concat(age, " years old."));
}
var person2 = ["John", 30];
printPersonInfo(person2);
// 3. Enums and Interfaces
// Q7: Define an enum called Role with values "Admin", "User", and "Guest".
var Role;
(function (Role) {
    Role["Admin"] = "Admin";
    Role["User"] = "User";
    Role["Guest"] = "Guest";
})(Role || (Role = {}));
// Q9: Implement a function printPerson(person: Person) that logs the person's details.
function printPerson(person) {
    console.log("Name: ".concat(person.name, ", Age: ").concat(person.age, ", City: ").concat(person.city ? person.city : 'Not provided'));
}
// Example usage
var person3 = { name: "John", age: 30 };
printPerson(person3); // Output: Name: John, Age: 30, City: Not provided
// 4. Functions and Generics
// Q10: Write a generic function reverseArray<T>(arr: T[]): T[] that returns the reversed array.
function reverseArray(arr) {
    return arr.reverse();
}
var reversedNumbers = reverseArray([1, 2, 3]);
console.log(reversedNumbers);
// Q11: Create a function getFirstElement<T>(arr: T[]): T that returns the first element of an array.
function getFirstElement(arr) {
    return arr[0];
}
var firstElement = getFirstElement([10, 20, 30]);
console.log(firstElement); // 10
// Q12: Write an arrow function that takes a string and returns its length.
var getLength = function (str) { return str.length; };
console.log(getLength("Hello"));
// 5. Classes and Object-Oriented Programming
// Q13: Create a class Car with properties brand and year. Add a method getCarInfo().
var Car1 = /** @class */ (function () {
    function Car1(brand, year) {
        this.brand = brand;
        this.year = year;
    }
    Car1.prototype.getCarInfo = function () {
        return "This car is a ".concat(this.year, " ").concat(this.brand, ".");
    };
    return Car1;
}());
var myCar1 = new Car1("Toyota", 2020);
console.log(myCar1.getCarInfo());
// Q14: Extend Car with a class ElectricCar that has an extra property batteryLife.
var ElectricCar = /** @class */ (function (_super) {
    __extends(ElectricCar, _super);
    function ElectricCar(brand, year, batteryLife) {
        var _this = _super.call(this, brand, year) || this;
        _this.batteryLife = batteryLife;
        return _this;
    }
    ElectricCar.prototype.getElectricCarInfo = function () {
        return "".concat(this.getCarInfo(), " It has a battery life of ").concat(this.batteryLife, " hours.");
    };
    return ElectricCar;
}(Car1));
var myElectricCar = new ElectricCar("Tesla", 2021, 24);
console.log(myElectricCar.getElectricCarInfo());
// Q15: Create a private property engineNumber inside Car and add a method to retrieve it.
var Car2 = /** @class */ (function () {
    function Car2(brand, year, engineNumber) {
        this.brand = brand;
        this.year = year;
        this.engineNumber = engineNumber;
    }
    Car2.prototype.getEngineNumber = function () {
        return this.engineNumber;
    };
    return Car2;
}());
var myCar2 = new Car2("Toyota", 2020, "12345XYZ");
console.log(myCar2.getEngineNumber());
var id1 = 123;
var id2 = "user_123";
var employee = {
    name: "John",
    age: 30,
    salary: 50000,
};
function printShapeMessage(shape) {
    if (shape === "Circle") {
        console.log("This is a Circle.");
    }
    else if (shape === "Rectangle") {
        console.log("This is a Rectangle.");
    }
}
printShapeMessage("Circle");
printShapeMessage("Rectangle");
// 2. Type Guards and Narrowing
// Q19: Write a function that checks if a given value is a string or number and logs different messages.
function checkType(value) {
    if (typeof value === "string") {
        console.log("The value is a string.");
    }
    else if (typeof value === "number") {
        console.log("The value is a number.");
    }
}
checkType("Hi");
checkType(19);
function isDog(animal) {
    return animal.type === "Dog";
}
function describeAnimal(animal) {
    if (isDog(animal)) {
        console.log("This is a dog of breed ".concat(animal.breed, "."));
    }
    else {
        console.log("This is a cat of color ".concat(animal.color, "."));
    }
}
var myDog = { type: "Dog", breed: "Labrador" };
var myCat = { type: "Cat", color: "Black" };
describeAnimal(myDog);
describeAnimal(myCat);
function updatePersonInfo(person) {
    console.log(person);
}
updatePersonInfo({ name: "John" });
var personInfo = {
    name: "Swar",
    age: 22,
};
var response = {
    data: { name: "Swar" },
    success: true,
};
// 4. Advanced Class Features
// Q24: Create a class BankAccount with private balance and methods deposit(amount) and withdraw(amount).
var BankAccount = /** @class */ (function () {
    function BankAccount() {
        this.balance = 0;
    }
    BankAccount.prototype.deposit = function (amount) {
        this.balance += amount;
    };
    BankAccount.prototype.withdraw = function (amount) {
        if (this.balance >= amount) {
            this.balance -= amount;
        }
        else {
            console.log("Insufficient balance.");
        }
    };
    BankAccount.prototype.getBalance = function () {
        return this.balance;
    };
    return BankAccount;
}());
var account = new BankAccount();
account.deposit(100);
account.withdraw(50);
console.log(account.getBalance());
// Q25: Implement a singleton class Logger that ensures only one instance can be created.
var Logger = /** @class */ (function () {
    function Logger() {
    }
    Logger.getInstance = function () {
        if (!Logger.instance) {
            Logger.instance = new Logger();
        }
        return Logger.instance;
    };
    Logger.prototype.log = function (message) {
        console.log(message);
    };
    return Logger;
}());
var logger1 = Logger.getInstance();
var logger2 = Logger.getInstance();
console.log(logger1 === logger2);
logger1.log("This is a log message.");
// Q26: Use an abstract class Animal with a method makeSound(), and implement it in Dog and Cat classes.
var Animal = /** @class */ (function () {
    function Animal() {
    }
    return Animal;
}());
var Dog = /** @class */ (function (_super) {
    __extends(Dog, _super);
    function Dog() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Dog.prototype.makeSound = function () {
        console.log("Woof!");
    };
    return Dog;
}(Animal));
var Cat = /** @class */ (function (_super) {
    __extends(Cat, _super);
    function Cat() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Cat.prototype.makeSound = function () {
        console.log("Meow!");
    };
    return Cat;
}(Animal));
var dog = new Dog();
var cat = new Cat();
dog.makeSound();
cat.makeSound();
// 5. Decorators and Metadata
// Q27: Create a class decorator that logs the creation of a class instance.
function addToStr(target) {
    target.prototype.toString = function () {
        return JSON.stringify(this);
    };
}
var Prsn = function () {
    var _classDecorators = [addToStr];
    var _classDescriptor;
    var _classExtraInitializers = [];
    var _classThis;
    var Prsn = _classThis = /** @class */ (function () {
        function Prsn_1(name, age) {
            this.name = name;
            this.age = age;
        }
        return Prsn_1;
    }());
    __setFunctionName(_classThis, "Prsn");
    (function () {
        var _metadata = typeof Symbol === "function" && Symbol.metadata ? Object.create(null) : void 0;
        __esDecorate(null, _classDescriptor = { value: _classThis }, _classDecorators, { kind: "class", name: _classThis.name, metadata: _metadata }, null, _classExtraInitializers);
        Prsn = _classThis = _classDescriptor.value;
        if (_metadata) Object.defineProperty(_classThis, Symbol.metadata, { enumerable: true, configurable: true, writable: true, value: _metadata });
        __runInitializers(_classThis, _classExtraInitializers);
    })();
    return Prsn = _classThis;
}();
var p = new Prsn("Geek", 30);
console.log(p.toString());
// Q28: Implement a method decorator that logs the execution time of a function.
function measureTime() {
    return function (target, propertyKey, descriptor) {
        var original = descriptor.value;
        var timeLabel = "".concat(target.constructor.name, ".").concat(propertyKey);
        descriptor.value = function () {
            var args = [];
            for (var _i = 0; _i < arguments.length; _i++) {
                args[_i] = arguments[_i];
            }
            console.time(timeLabel);
            var value = original.apply(this, args);
            console.timeEnd(timeLabel);
            return value;
        };
    };
}
// Q29: Create a property decorator that validates if a string property is non-empty.
function nonEmpty(target, propertyKey) {
    var value;
    var getter = function () { return value; };
    var setter = function (newVal) {
        if (newVal.trim() === "") {
            throw new Error("".concat(propertyKey, " cannot be empty"));
        }
        value = newVal;
    };
    Object.defineProperty(target, propertyKey, {
        get: getter,
        set: setter,
        enumerable: true,
        configurable: true,
    });
}
var User = /** @class */ (function () {
    function User(name) {
        this.name = name;
    }
    return User;
}());
var user = new User("Swar");
try {
    user.name = " "; // This will throw an error
}
catch (error) {
    console.error(error.message);
}
// 6. Modules and Namespaces
// Q30: Split TypeScript code into two modules where one exports an interface and another imports and uses it.
// app.ts
var UserModule;
(function (UserModule) {
    UserModule.getUserInfo = function (user) {
        return "User Info: ID = ".concat(user.id, ", Name = ").concat(user.name, ", Email = ").concat(user.email);
    };
})(UserModule || (UserModule = {}));
// Example usage
var user1 = {
    id: 1,
    name: ' Doe',
    email: 'jane.doe@example.com',
};
console.log(UserModule.getUserInfo(user1));
// Q31: Create a namespace Utils with a function capitalize(text: string): string.
// utils.ts
var Utils;
(function (Utils) {
    Utils.capitalize = function (text) {
        if (!text)
            return text;
        return text.charAt(0).toUpperCase() + text.slice(1);
    };
})(Utils || (Utils = {}));
var sampleText = 'hello world';
console.log(Utils.capitalize(sampleText));
