// Typescript problems

// Beginner TypeScript Exercises
// 1. Type Annotations
// Q1: Declare a variable userName of type string and assign it a value.
var userN1:string = "Swaroop";

// Q2: Create a variable age of type number and a variable isStudent of type boolean.
let ageper: number = 25;
let isStudents: boolean = true;

// Q3: Write a function add(a: number, b: number): number that returns the sum of two numbers.
function add1(a: number, b: number): number {
    return a + b;
}

// 2. Arrays and Tuples
// Q4: Create an array numbers that can only contain numbers and add three values.
let numbers1: number[] = [1, 2, 3];

// Q5: Define a tuple [string, number] representing a person's name and age.
let person1: [string, number] = ["John", 30];

// Q6: Write a function that takes a tuple [string, number] and logs a message like: "John is 30 years old."
function printPersonInfo(person: [string, number]): void {
    const [name, age] = person;
    console.log(`${name} is ${age} years old.`);
}

let person2: [string, number] = ["John", 30];
printPersonInfo(person2);

// 3. Enums and Interfaces
// Q7: Define an enum called Role with values "Admin", "User", and "Guest".
enum Role {
    Admin = "Admin",
    User = "User",
    Guest = "Guest"
}

// Q8: Create an interface Person with properties name: string, age: number, and city?: string.
interface Person {
    name: string;
    age: number;
    city?: string; // 
}

// Q9: Implement a function printPerson(person: Person) that logs the person's details.
function printPerson(person: Person): void {
    console.log(`Name: ${person.name}, Age: ${person.age}, City: ${person.city ? person.city : 'Not provided'}`);
}

// Example usage
const person3: Person = { name: "John", age: 30 };
printPerson(person3); // Output: Name: John, Age: 30, City: Not provided


// 4. Functions and Generics
// Q10: Write a generic function reverseArray<T>(arr: T[]): T[] that returns the reversed array.
function reverseArray<T>(arr: T[]): T[] {
    return arr.reverse();
}

let reversedNumbers = reverseArray([1, 2, 3]);
console.log(reversedNumbers);

// Q11: Create a function getFirstElement<T>(arr: T[]): T that returns the first element of an array.
function getFirstElement<T>(arr: T[]): T {
    return arr[0];
}

let firstElement = getFirstElement([10, 20, 30]);
console.log(firstElement); // 10


// Q12: Write an arrow function that takes a string and returns its length.
const getLength = (str: string): number => str.length;

console.log(getLength("Hello")); 


// 5. Classes and Object-Oriented Programming
// Q13: Create a class Car with properties brand and year. Add a method getCarInfo().
class Car1 {
    brand: string;
    year: number;

    constructor(brand: string, year: number) {
        this.brand = brand;
        this.year = year;
    }

    getCarInfo(): string {
        return `This car is a ${this.year} ${this.brand}.`;
    }
}
let myCar1 = new Car1("Toyota", 2020);
console.log(myCar1.getCarInfo());

// Q14: Extend Car with a class ElectricCar that has an extra property batteryLife.
class ElectricCar extends Car1 {
    batteryLife: number;

    constructor(brand: string, year: number, batteryLife: number) {
        super(brand, year);
        this.batteryLife = batteryLife;
    }

    getElectricCarInfo(): string {
        return `${this.getCarInfo()} It has a battery life of ${this.batteryLife} hours.`;
    }
}

let myElectricCar = new ElectricCar("Tesla", 2021, 24);
console.log(myElectricCar.getElectricCarInfo()); 


// Q15: Create a private property engineNumber inside Car and add a method to retrieve it.
class Car2 {
    brand: string;
    year: number;
    private engineNumber: string;

    constructor(brand: string, year: number, engineNumber: string) {
        this.brand = brand;
        this.year = year;
        this.engineNumber = engineNumber;
    }

    getEngineNumber(): string {
        return this.engineNumber;
    }
}

let myCar2 = new Car2("Toyota", 2020, "12345XYZ");
console.log(myCar2.getEngineNumber());

// Advanced TypeScript Exercises
// 1. Advanced Types (Union, Intersection, Type Aliases)
// Q16: Create a union type ID that can be either string or number.
type ID = string | number;

let id1: ID = 123;
let id2: ID = "user_123";


// Q17: Write an intersection type Employee that combines Person and {salary: number}.
interface Person {
    name: string;
    age: number;
}

type Employee = Person & { salary: number };

const employee: Employee = {
    name: "John",
    age: 30,
    salary: 50000,
};

// Q18: Create a type alias Shape that can be "Circle" or "Rectangle", and write a function that prints different messages based on the shape type.
type Shape = "Circle" | "Rectangle";

function printShapeMessage(shape: Shape): void {
    if (shape === "Circle") {
        console.log("This is a Circle.");
    } else if (shape === "Rectangle") {
        console.log("This is a Rectangle.");
    }
}

printShapeMessage("Circle"); 
printShapeMessage("Rectangle"); 

// 2. Type Guards and Narrowing
// Q19: Write a function that checks if a given value is a string or number and logs different messages.
function checkType(value: string | number): void {
    if (typeof value === "string") {
        console.log("The value is a string.");
    } else if (typeof value === "number") {
        console.log("The value is a number.");
    }
}

checkType("Hi"); 
checkType(19);

// Q20: Implement a type guard for an Animal type that checks if it is a Dog or a Cat.
interface Dog1 {
    type: "Dog";
    breed: string;
}

interface Cat1 {
    type: "Cat";
    color: string;
}

type AnimalType = Dog1 | Cat1;

function isDog(animal: AnimalType): animal is Dog1 {
    return animal.type === "Dog";
}

function describeAnimal(animal: AnimalType): void {
    if (isDog(animal)) {
        console.log(`This is a dog of breed ${animal.breed}.`);
    } else {
        console.log(`This is a cat of color ${animal.color}.`);
    }
}

const myDog: Dog1 = { type: "Dog", breed: "Labrador" };
const myCat: Cat1 = { type: "Cat", color: "Black" };

describeAnimal(myDog); 
describeAnimal(myCat); 

// 3. Generics and Utility Types
// Q21: Use Partial<T> to create a function that makes all properties of Person optional.
interface Person1 {
    name: string;
    age: number;
    citys: string;
}

function updatePersonInfo(person: Partial<Person>): void {
    console.log(person);
}

updatePersonInfo({ name: "John" }); 
// Q22: Use Pick<T, K> to create a type that only includes the name and age properties of Person.
type PersonInfo = Pick<Person1, "name" | "age">;

const personInfo: PersonInfo = {
    name: "Swar",
    age: 22,
};

// Q23: Write a generic interface ApiResponse<T> that includes data: T and success: boolean.
interface ApiResponse<T> {
    data: T;
    success: boolean;
}

const response: ApiResponse<{ name: string }> = {
    data: { name: "Swar" },
    success: true,
};


// 4. Advanced Class Features
// Q24: Create a class BankAccount with private balance and methods deposit(amount) and withdraw(amount).
class BankAccount {
    private balance: number = 0;

    deposit(amount: number): void {
        this.balance += amount;
    }

    withdraw(amount: number): void {
        if (this.balance >= amount) {
            this.balance -= amount;
        } else {
            console.log("Insufficient balance.");
        }
    }

    getBalance(): number {
        return this.balance;
    }
}

const account = new BankAccount();
account.deposit(100);
account.withdraw(50);
console.log(account.getBalance());


// Q25: Implement a singleton class Logger that ensures only one instance can be created.
class Logger {
    private static instance: Logger;

    private constructor() {}

    static getInstance(): Logger {
        if (!Logger.instance) {
            Logger.instance = new Logger();
        }
        return Logger.instance;
    }

    log(message: string): void {
        console.log(message);
    }
}

const logger1 = Logger.getInstance();
const logger2 = Logger.getInstance();

console.log(logger1 === logger2); 
logger1.log("This is a log message.");

// Q26: Use an abstract class Animal with a method makeSound(), and implement it in Dog and Cat classes.
abstract class Animal {
    abstract makeSound(): void;
}

class Dog extends Animal {
    makeSound(): void {
        console.log("Woof!");
    }
}

class Cat extends Animal {
    makeSound(): void {
        console.log("Meow!");
    }
}

const dog = new Dog();
const cat = new Cat();

dog.makeSound(); 
cat.makeSound(); 

// 5. Decorators and Metadata
// Q27: Create a class decorator that logs the creation of a class instance.
function addToStr(target: Function) {
    target.prototype.toString = function () {
        return JSON.stringify(this);
    };
}

@addToStr
class Prsn {
    constructor(public name: string, public age: number) { }
}

const p = new Prsn("Geek", 30);
console.log(p.toString());

// Q28: Implement a method decorator that logs the execution time of a function.
function measureTime() {
    return (target: any, propertyKey: string, descriptor: PropertyDescriptor) => {
      const original: (...args: Array<unknown>) => unknown = descriptor.value;
  
      const timeLabel: string = `${target.constructor.name}.${propertyKey}`;
      descriptor.value = function (...args: Array<unknown>) {
        console.time(timeLabel);
        const value: unknown = original.apply(this, args);
        console.timeEnd(timeLabel);
  
        return value;
      };
    };
  }


// Q29: Create a property decorator that validates if a string property is non-empty.
function nonEmpty(target: any, propertyKey: string) {
    let value: string;

    const getter = () => value;

    const setter = (newVal: string) => {
        if (newVal.trim() === "") {
            throw new Error(`${propertyKey} cannot be empty`);
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

class User {
    
    name: string;

    constructor(name: string) {
        this.name = name;
    }
}

const user = new User("Swar");

try {
    user.name = " "; // This will throw an error
} catch (error) {
    console.error(error.message);
}

// 6. Modules and Namespaces
// Q30: Split TypeScript code into two modules where one exports an interface and another imports and uses it.

// app.ts

namespace UserModule {
    export interface User {
      id: number;
      name: string;
      email: string;
    }
  
    export const getUserInfo = (user: User): string => {
      return `User Info: ID = ${user.id}, Name = ${user.name}, Email = ${user.email}`;
    };
  }
  
  // Example usage
  const user1: UserModule.User = {
    id: 1,
    name: ' Doe',
    email: 'jane.doe@example.com',
  };
  
  console.log(UserModule.getUserInfo(user1));
  
// Q31: Create a namespace Utils with a function capitalize(text: string): string.

// utils.ts

namespace Utils {
    export const capitalize = (text: string): string => {
      if (!text) return text; 
      return text.charAt(0).toUpperCase() + text.slice(1);
    };
  }
  
  const sampleText = 'hello world';
  console.log(Utils.capitalize(sampleText)); 
  