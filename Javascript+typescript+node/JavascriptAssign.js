
// JavaScript Exercises
// 1. Variables and Data Types
// Q1: Declare a variable name and assign your name to it. Print it to the console.
var name = "Swaroop";
console.log(name);

// Q2: Create a variable age with a number and a isStudent boolean variable. Log them to the console.
var age = 22;
var isStudent = true;
console.log(age, isStudent);

// Q3: Convert a string "123" to a number and check its type.
var string = "123";
var number = parseInt(string);
console.log(typeof number);

// 2. Operators and Conditionals
// Q4: Write a program that checks if a given number is even or odd.
var number = 5;
if(number%2==0){
    console.log("Even");
}else{
    console.log("Odd");
}
// Q5: Create a program that takes two numbers and prints the larger one.
var num1 = 5;
var num2 = 7;

if (num1 === num2) {
    console.log("Both Numbers Are Same");
} else if (num1 > num2) {
    console.log(num1);
} else {
    console.log(num2);
}

// Q6: Write a program that checks if a number is positive, negative, or zero.
var num3 = 2;
var num2 = 7;
if(num3>0){
	console.log("Positive");
	}
	if(num3<0){
	console.log("Negitive");
	}else{
	console.log("Number Is Zero");
}


// 3. Loops
// Q7: Print numbers from 1 to 10 using a for loop.
for(var i=1;i<=10; i++){
	console.log(i)
}


// Q8: Print all even numbers between 1 and 20 using a while loop.
while(i<=20){
	if(i%2==0){
	console.log(i);
	}
	i++;
}



// Q9: Use a do-while loop to prompt the user until they enter a number greater than 10.
let num;

do {
    //num = prompt("Enter a number:");
    num = Number(num); 
} while (num <= 10);
console.log(`You entered a number greater than 10: ${num}`);

// 4. Functions
// Q10: Write a function add(a, b) that returns the sum of two numbers.
function add(a,b){
	return a+b;
}
console.log(add(2,3));

// Q11: Write a function factorial(n) that returns the factorial of n.
function factorial(n){
	if(n==0){
		return 1;
	}
	return n*factorial(n-1);
}
console.log(factorial(5));

// Q12: Create a function isPrime(n) that returns true if n is prime, else false.
function isPrime(n){
	if(n<=1){
		return false;
	}
	for(var i=2;i<=Math.sqrt(n);i++){
		if(n%i==0){
			return false;
		}
	}
	return true;
}
console.log(isPrime(7));


// 5. Arrays and Objects

// Q13: Create an array of five fruits and print each one using a loop.
var fruits = ["Apple","Banana","Orange","Grapes","Mango"];
for(var i=0;i<fruits.length;i++){
	console.log(fruits[i]);
}

// Q14: Write a function to find the largest number in an array.
function largestNumber(arr){
	var max = arr[0];
	for(var i=1;i<arr.length;i++){
		if(arr[i]>max){
			max = arr[i];
		}
	}
	return max;
}

// Q15: Create an object person with properties name, age, and city. Print each property.
var obj = {
	name:"Swaroop",
	age:22,
	city:"Pune"
}

// Advanced JavaScript Exercises
// 1. Higher-Order Functions and Callbacks
// Q16: Write a function that takes an array and a callback function, then applies the callback to each element.
function applyCallback(arr, callback){
	for(var i=0;i<arr.length;i++){
		callback(arr[i]);
	}
}

// Q17: Use .map() to create a new array that contains the square of each number in [2, 4, 6, 8].

var arr = [2,4,6,8];
var newArr = arr.map(function(num){
	return num*num;
});


// Q18: Use .filter() to return only numbers greater than 10 from [5, 12, 8, 130, 44].

var arr = [5,12,8,130,44];
var newArr = arr.filter(function(num){
	return num>10;
});

// 2. Asynchronous JavaScript
// Q19: Write a function that returns a promise which resolves after 2 seconds.
var promise = new Promise(function(resolve, reject){
	setTimeout(function(){
		resolve();
	},2000);
});


// Q20: Fetch data from https://jsonplaceholder.typicode.com/posts using fetch() and async/await.
var fetchData = async function(){
	var response = await fetch("https://jsonplaceholder.typicode.com/posts");
	var data = await response.json();
	console.log(data);
}

fetchData();


// 3. ES6+ Features

// Q21: Use the spread operator to merge two arrays [1, 2, 3] and [4, 5, 6].
var arr1 = [1,2,3];
var arr2 = [4,5,6];
var mergedArr = [...arr1, ...arr2];
var mergedArr = arr1.concat(arr2);

// Q22: Write a function that uses destructuring to extract properties from an object.
function printDetails(obj){
	var {name, age} = obj;
	console.log(name, age);
}


// Q23: Use template literals to print "Hello, my name is [name] and I am [age] years old."
var name = "Swaroop";
var age = 22;
console.log(`Hello, my name is ${name} and I am ${age} years old.`);

// 4. Closures and Scope
// Q24: Write a function that returns another function that increments a counter.
function counter(){
	var count = 0;
	return function(){
		count++;
		return count;
	}
}
console.log(counter()());

// Q25: Demonstrate block scope using let and const.
function blockScope(){
	let x = 10;
	if(true){
		const x = 20;
		console.log(x);
	}
	console.log(x);
}

// 5. Prototypes and Classes
// Q26: Create a constructor function Car with properties make and year.
function Car(make, year){
	this.make = make;
	this.year = year;
}
console.log(new Car("Toyota", 2020));

// Q27: Convert the above Car function into a class and add a method getAge().
class Car1{
	constructor(make, year){
		this.make = make;
		this.year = year;
	}
	getAge(){
		return new Date().getFullYear() - this.year;
	}
}
console.log(new Car1("Toyota", 2020).getAge());
// Q28: Create a subclass ElectricCar that extends Car and adds a property batteryLife.
class ElectricCar extends Car{
	constructor(make, year, batteryLife){
		super(make, year);
		this.batteryLife = batteryLife;
	}
}
