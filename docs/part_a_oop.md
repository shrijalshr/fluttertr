# Part A — Object-Oriented Programming (OOP) in Dart
> **Target Audience:** Complete beginners with zero programming experience.

Welcome to your study guide for Dart OOP! This document will explain the core concepts of Object-Oriented Programming with clean code examples and easy-to-understand real-world analogies.

---

## 01. What is OOP?

**Object-Oriented Programming (OOP)** is a programming style that organizes code around real-world "things" called **objects**, rather than just listing functions and variables in a giant pool.

### The Blueprint vs. The House
Think of OOP using this simple analogy:

| Concept | Real-World Analogy | In Code |
| :--- | :--- | :--- |
| **Class** | **The Blueprint** (Drawing of a house: color, size, room count) | A blueprint defining variables (properties) and methods (actions). |
| **Object** | **The Actual House** (Built from the blueprint: painted blue, has 3 rooms) | A concrete instance built in memory from a Class. |

```
    [ Blueprint (Class) ]  ───(Builds)───►  [ Actual House (Object) ]
    - color: "empty"                        - color: "Green"
    - rooms: 0                              - rooms: 4
    - openDoor()                            - openDoor() works!
```

> [!TIP]
> **Key Analogy:** A class is like a **cookie cutter**. Objects are the **cookies**. You only need to create the cutter once; from there, you can bake infinite cookies, and each can have its own colored frosting!

---

## 02. Classes & Objects

In Dart, we define a class using the `class` keyword. We define **Instance Variables** (properties) and **Methods** (functions inside a class) inside it.

```dart
// Define the blueprint
class Dog {
  // Properties (Instance Variables)
  String name = 'Unknown';
  String breed = 'Unknown';

  // Action (Method)
  void bark() {
    print('$name says: Woof! 🐾');
  }
}

void main() {
  // Create object 1 (instance)
  Dog dog1 = Dog();
  dog1.name = 'Bruno';
  dog1.breed = 'Labrador';
  dog1.bark(); // Bruno says: Woof! 🐾

  // Create object 2 (instance)
  Dog dog2 = Dog();
  dog2.name = 'Max';
  dog2.breed = 'Poodle';
  dog2.bark(); // Max says: Woof! 🐾
}
```

---

## 03. Constructors

Setting variables one-by-one is tedious and leads to errors. A **Constructor** is a special method that runs automatically the exact moment an object is created. It helps us initialize our variables immediately.

### A. Default Constructor vs. Shorthand Constructor

In old programming languages, we had to type out the parameters twice. Dart provides a beautiful **shorthand** that does all the work for you.

```dart
// ❌ Old way (Boilerplate)
class Dog {
  String name;
  Dog(String name) {
    this.name = name; // repeats "name" many times
  }
}

// ✅ Dart Shorthand (Super Clean!)
class Dog {
  String name;
  String breed;

  // The shorthand constructor assigns parameter inputs automatically!
  Dog(this.name, this.breed);

  void bark() => print('$name says: Woof!');
}
```

### B. Named Constructors

Sometimes, we want to build objects from different sources (e.g. from an API response, which usually comes as a Map of Key-Value pairs). We use **Named Constructors** for this!

```dart
class Dog {
  String name;
  String breed;

  Dog(this.name, this.breed);

  // Named constructor: creates a Dog from a Map
  Dog.fromMap(Map<String, String> data)
      : name = data['name'] ?? 'Unknown',
        breed = data['breed'] ?? 'Unknown';
}

void main() {
  final apiData = {'name': 'Bella', 'breed': 'Husky'};
  
  // Create a dog using our named constructor
  final dog = Dog.fromMap(apiData);
  print(dog.name); // Bella
}
```

---

## 04. Encapsulation & Private Variables

In OOP, **Encapsulation** means hiding internal details of an object and exposing only what is safe. This prevents external code from accidentally corrupting an object's data.

### Hiding with `_` (Underscore)
In Dart, prefixing a variable or method name with an underscore `_` makes it **private** to its library (file).

> [!NOTE]
> **ATM Analogy:** Think of a bank account's balance. You can't just reach inside the ATM and change the dollar digits. You must use the safe screen options (methods like `deposit()` and `withdraw()`).

```dart
class BankAccount {
  String owner;
  double _balance; // Private! Cannot be accessed directly from another file.

  BankAccount(this.owner, this._balance);

  // Expose the balance safely using a read-only Getter
  double get balance => _balance;

  // Method to deposit money safely
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited \$$amount. Current balance: \$$_balance');
    }
  }

  // Method to withdraw money safely
  void withdraw(double amount) {
    if (amount > _balance) {
      print('❌ Insufficient funds!');
    } else {
      _balance -= amount;
      print('✅ Withdrew \$$amount. Current balance: \$$_balance');
    }
  }
}
```

---

## 05. Inheritance

**Inheritance** allows a child class to inherit all the properties and methods from a parent class, avoiding duplicate code.

### Keywords to Learn:
- **`extends`**: Tells Dart that a class is a child of a parent.
- **`super`**: Calls the constructor or method of the parent class.
- **`@override`**: Tells Dart we are replacing the parent's default behavior with a new custom child behavior.

```dart
// 1. Parent Class
class Animal {
  String name;
  Animal(this.name);

  void eat() => print('$name is eating. 😋');
  void speak() => print('$name makes a sound.');
}

// 2. Child Class inheriting from Animal
class Cat extends Animal {
  String color;

  // Constructor: takes name, color. Passes name up to the parent constructor (super)
  Cat(String name, this.color) : super(name);

  // Overrides the parent's speak() method
  @override
  void speak() {
    print('$name says: Meow! 🐱');
  }

  // Cat's unique method
  void purr() => print('$name is purring... 😸');
}
```

### Visualizing Inheritance:
```
           [ Animal ]
           - name
           - eat()
           - speak()
               ▲
               │ (Inherits/extends)
           [ Cat ]
           - color (new!)
           - purr() (new!)
           - speak() (overridden to say Meow!)
```

---

*Keep this guide open as you work through the coding exercises in `course/01-oop-basics`!*
