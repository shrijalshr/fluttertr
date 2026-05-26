/// ─── Topic 03: Constructors ────────────────────────────────────────────
///
/// Without a constructor, you have to assign every field line-by-line (messy!).
/// A constructor is a special function that runs immediately when an object is built.
///
/// In this script, we'll see:
/// 1. The classic (verbose) constructor.
/// 2. Dart's elegant shorthand constructor `this.name`.
/// 3. Named constructors (`fromMap`) which are critical for parsing API JSON data.

// A class representing a Dog using different constructors
class Dog {
  String name;
  String breed;
  int age;

  // 1. Classic Constructor (Verbose)
  // Inside constructors, "this" refers to the current instance we are building.
  /*
  Dog(String name, String breed, int age) {
    this.name = name;
    this.breed = breed;
    this.age = age;
  }
  */

  // 2. Dart Shorthand Constructor (Standard & Recommended)
  // This automatically captures the parameters and assigns them directly to the fields.
  Dog(this.name, this.breed, this.age);

  // 3. Named Constructor (fromMap)
  // Allows us to create objects from a Map of key-value pairs (like JSON from an API!).
  // We use an initializer list (the colon ":") to assign values safely with default fallbacks.
  Dog.fromMap(Map<String, dynamic> data)
      : name = data['name'] ?? 'Unknown',
        breed = data['breed'] ?? 'Unknown',
        age = data['age'] ?? 0;

  void bark() {
    print('🔊 $name the $breed says: Woof! (Age: $age) 🐕');
  }
}

void main() {
  print('====================================================');
  print('🎓 LESSON 03: CONSTRUCTORS IN DART');
  print('====================================================\n');

  print('👉 Step 1: Instantiating objects using the Shorthand Constructor...');
  // Instead of four lines of code per dog, we pass the data inside a single line!
  Dog dog1 = Dog('Bruno', 'Labrador', 3);
  Dog dog2 = Dog('Max', 'Poodle', 1);

  dog1.bark();
  dog2.bark();
  print('----------------------------------------------------');

  print('👉 Step 2: Instantiating an object using a Named Constructor (fromMap)...');
  // Imagine this data map came from a network request or database!
  Map<String, dynamic> apiResponse = {
    'name': 'Bella',
    'breed': 'Siberian Husky',
    'age': 4
  };

  // We call our custom named constructor "fromMap"
  Dog dogFromApi = Dog.fromMap(apiResponse);
  
  print('Successfully parsed map data into a structured Dog object:');
  dogFromApi.bark();
  print('----------------------------------------------------');

  print('💡 Takeaway: Constructors keep code clean and allow parsing diverse data formats easily.');
  print('In Flutter, you will use Named Constructors (like fromJson) to convert internet data into visual app cards!');
  print('====================================================');
}
