/// ─── Topic 05: Inheritance ─────────────────────────────────────────────
///
/// Inheritance lets a class copy properties and methods from a parent class.
/// This prevents duplicate code and models real-world heirarchies.
///
/// In this script, we'll see:
/// 1. The parent class (`Animal`) defining common fields and methods.
/// 2. Sub-classes (`Cat` and `Dog`) using the `extends` keyword.
/// 3. The `super` constructor to pass fields up to the parent.
/// 4. `@override` to customize parent behavior in the child.

// 1. Parent Class (Base class)
class Animal {
  String name;

  Animal(this.name);

  void eat() {
    print('😋 $name is eating delicious food.');
  }

  void speak() {
    print('🔊 $name makes a generic animal sound.');
  }
}

// 2. Child Class (Subclass) inheriting from Animal
class Cat extends Animal {
  // A unique field belonging only to Cats
  String furColor;

  // The super(name) constructor passes the name variable up to the Animal class.
  Cat(String name, this.furColor) : super(name);

  // Overriding a parent method: We replace the generic speak() with a cat-specific sound!
  @override
  void speak() {
    print('🐱 $name the $furColor cat says: Meow! Meow! 🐾');
  }

  // A unique action only cats can do
  void purr() {
    print('😸 $name is purring softly... purr... purr...');
  }
}

// 3. Another Child Class
class Dog extends Animal {
  Dog(String name) : super(name);

  // Overrides the speak() method to bark!
  @override
  void speak() {
    print('🐶 $name the dog says: Woof! Woof! 🐾');
  }
}

void main() {
  print('====================================================');
  print('🎓 LESSON 05: INHERITANCE IN DART');
  print('====================================================\n');

  print('👉 Step 1: Creating a Cat object (orange tabby)...');
  Cat myCat = Cat('Kitty', 'orange');
  
  // Kitty inherits the eat() method from Animal! We didn't have to define it inside Cat.
  myCat.eat();   // Inherited
  myCat.speak(); // Overridden (custom cat speech)
  myCat.purr();  // Cat's unique method
  print('----------------------------------------------------');

  print('👉 Step 2: Creating a Dog object...');
  Dog myDog = Dog('Bruno');

  myDog.eat();   // Inherited
  myDog.speak(); // Overridden (custom dog speech)
  print('----------------------------------------------------');

  print('👉 Step 3: Understanding Polymorphism & Inheritance Hierarchy...');
  print('Hierarchy Diagram:');
  print('       Animal [name, eat(), speak()]');
  print('         ├── Cat [furColor, purr(), speak() overridden]');
  print('         └── Dog [speak() overridden]\n');

  print('💡 Takeaway: Inheritance helps reuse code and organize structure.');
  print('In Flutter, almost every page you write will inherit from "StatelessWidget" or "StatefulWidget" using the "extends" keyword!');
  print('====================================================');
}
