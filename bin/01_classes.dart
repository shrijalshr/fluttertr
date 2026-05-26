/// ─── Topic 02: Classes & Objects ───────────────────────────────────────
///
/// ANALOGY: A class is a cookie cutter (the blueprint).
///          An object is the cookie (the actual thing built from it).
///
/// In this script, we'll see:
/// 1. How to define a class with properties (instance variables) and methods.
/// 2. How to create multiple separate objects (instances) from one class.
/// 3. How to modify properties and invoke methods using dot notation `.`.

// 1. Define the blueprint (Class)
class Dog {
  // Instance Variables (Properties)
  // By default, we initialize them with fallback values.
  String name = 'Unknown';
  String breed = 'Unknown';
  int age = 0;

  // Method (Action)
  // A function that belongs to a class. It has access to the instance variables!
  void bark() {
    print('🔊 $name (the $breed, aged $age) says: Woof! Woof! 🐾');
  }

  void sleep() {
    print('😴 $name is curling up for a nap... Zzz.');
  }
}

void main() {
  print('====================================================');
  print('🎓 LESSON 02: CLASSES & OBJECTS IN DART');
  print('====================================================\n');

  print('👉 Step 1: Creating our first Dog object (dog1)...');
  // We create an object (instance) by calling the class name followed by parentheses.
  Dog dog1 = Dog();
  
  // Set properties using dot notation: object.property = value;
  dog1.name = 'Bruno';
  dog1.breed = 'Labrador Retriever';
  dog1.age = 3;

  // Trigger actions using dot notation: object.method();
  dog1.bark();
  dog1.sleep();
  print('----------------------------------------------------');

  print('👉 Step 2: Creating a completely separate Dog object (dog2)...');
  // Although dog2 is built from the exact same "Dog" blueprint,
  // it has its own separate container of data in computer memory!
  Dog dog2 = Dog();
  dog2.name = 'Max';
  dog2.breed = 'Toy Poodle';
  dog2.age = 1;

  dog2.bark(); // Max will bark, not Bruno!
  dog2.sleep();
  print('----------------------------------------------------');

  print('💡 Takeaway: One cookie cutter, multiple unique cookies!');
  print('Both dog1 and dog2 came from the "Dog" class, but they hold unique, independent values.');
  print('====================================================');
}
