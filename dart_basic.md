# Phase 1 — Dart & Flutter Foundations

## Class Session Material · Shrijal Shrestha

> **Duration:** 3–4 hours &nbsp;|&nbsp; **Topics:** 9 Core &nbsp;|&nbsp; **Exit Goal:** Build a StatefulWidget counter from scratch

---

## 01 — Variables & Types

**⏱ ~20 min**

### var, final, const

**What to cover:**

- `var` — type is inferred at compile time; cannot change type after assignment
- `final` — assigned once at runtime; value determined when the code runs
- `const` — compile-time constant; value must be known before the program runs
- **Analogy:** `const` is "carved in stone before the app starts," `final` is "locked in a safe once assigned"

```dart
var name = 'Shrijal';         // String inferred — can reassign
name = 'Flutter Dev';          // ✅ allowed

final launchTime = DateTime.now(); // set once at runtime
// launchTime = DateTime.now();  ❌ cannot reassign

const maxRetries = 3;          // compile-time constant
const appName = 'MyFlutterApp';
```

> **💡 Tip:** Prefer `const` wherever possible — Flutter uses it to skip unnecessary widget rebuilds, directly improving performance.

---

### Core Types: String, int, double, bool, dynamic

**What to cover:**

- Dart is **strongly typed** — every variable has a type, even if inferred
- `int` and `double` are separate — no implicit conversion between them
- `dynamic` opts out of type checking — use sparingly
- String interpolation with `$variable` and `${expression}`

```dart
String  name    = 'Flutter';
int     version = 3;
double  rating  = 4.9;
bool    isReady = true;
dynamic anything = 'could be anything'; // avoid!

// String interpolation
print('$name version ${version + 1} — rating: $rating');
// Output: Flutter version 4 — rating: 4.9

// Type conversion
int parsed = int.parse('42');
String str = version.toString();
```

---

## 02 — Null Safety

**⏱ ~25 min**

### Nullable vs Non-nullable · The ? operator

**What to cover:**

- By default, **every variable is non-nullable** — it cannot be null unless explicitly allowed
- Adding `?` after a type makes it nullable: `String?` means "a String or null"
- This eliminates the infamous NullPointerException at compile time
- The `!` operator (null assertion) — use carefully; crashes if null at runtime

```dart
String  required = 'always here';    // cannot be null
String? optional = null;             // may be null

// Safe access with ?.
print(optional?.length);             // null if optional is null

// Null assertion — crashes if null at runtime!
print(optional!.length);             // ⚠️ only when you're certain

// Null-aware assignment
optional ??= 'default';              // assigns only if null

// Null coalescing operator
String display = optional ?? 'Guest'; // use 'Guest' if null
```

> **⚠️ Warning:** Overusing `!` defeats the purpose of null safety. Teach students to reach for `??` and `?.` first.

---

### The late keyword

**What to cover:**

- `late` means: "I promise this will be initialized before it's used"
- Common in Flutter for variables initialized in `initState()`
- Accessing a `late` variable before initialization throws a runtime error

```dart
class UserProfile {
  late String username; // will be set before use

  void load() {
    username = 'shrijal'; // initialized here
    print(username);       // safe to use now
  }
}
```

---

## 03 — Functions

**⏱ ~25 min**

### Named, Positional & Optional Parameters

**What to cover:**

- **Positional parameters** — order matters, passed by position
- **Named parameters** — wrapped in `{ }`, called by name — dominant in Flutter widgets
- `required` keyword — enforces that a named parameter must be provided
- **Default values** — what happens when a parameter is omitted

```dart
// Positional
int add(int a, int b) => a + b;
add(2, 3); // ✅

// Named parameters (Flutter's preferred style)
void greet({required String name, String role = 'Developer'}) {
  print('Hello $name, $role!');
}
greet(name: 'Shrijal');                // Hello Shrijal, Developer!
greet(name: 'Ali', role: 'Designer'); // Hello Ali, Designer!

// Optional positional
String tag(String text, [String? color]) {
  return color != null ? '[$color] $text' : text;
}
```

> **ℹ️ Info:** Nearly every Flutter widget constructor uses named parameters. Getting comfortable with this syntax here pays off immediately when students start writing widgets.

---

### Arrow Functions & Higher-Order Functions

**What to cover:**

- **Arrow syntax** `=>` for single-expression functions — shorthand, not a new concept
- Functions as **first-class citizens** — pass them as arguments, return them
- **Anonymous functions / lambdas** — used extensively in list operations and callbacks
- Common list methods: `map()`, `where()`, `forEach()`, `any()`, `reduce()`

```dart
// Arrow function
int square(int n) => n * n;

// Higher-order: passing a function
void runTwice(void Function() action) {
  action(); action();
}
runTwice(() => print('Hello!'));

// List operations
final scores = [85, 92, 78, 95, 60];

final passing = scores.where((s) => s >= 80).toList();  // [85, 92, 95]
final doubled = scores.map((s) => s * 2).toList();       // [170, 184, 156, 190, 120]
final total   = scores.reduce((a, b) => a + b);          // 410
```

---

## 04 — Control Flow

**⏱ ~15 min**

### if / else · switch · for · while

**What to cover:**

- Standard `if/else` — identical to Java/JavaScript, no surprises
- `switch` — works on strings, ints, and enums; Dart 3 introduced exhaustive pattern matching
- `for-in` — iterate over any iterable cleanly
- Ternary operator `condition ? a : b` — used heavily inside Flutter widget trees

```dart
// if / else
int score = 87;
if (score >= 90) {
  print('A');
} else if (score >= 80) {
  print('B'); // ← prints this
} else {
  print('C or below');
}

// Ternary — great inside widget trees
String label = score > 80 ? 'Pass' : 'Fail';

// switch
switch (label) {
  case 'Pass': print('🎉 Passed!'); break;
  default:     print('Try again');
}

// for-in
final langs = ['Dart', 'Kotlin', 'Swift'];
for (final lang in langs) {
  print(lang);
}
```

---

## 05 — Collections: List, Map, Set

**⏱ ~20 min**

### List, Map, Set & Spread Operator

**What to cover:**

- **List** — ordered, indexed, allows duplicates (like an array)
- **Map** — key-value pairs; JSON objects in Dart are Maps
- **Set** — unordered, unique values only; great for deduplication
- **Spread operator** `...` — merge collections elegantly
- **Collection if / collection for** — build lists conditionally inside widget trees

```dart
// List
final fruits = ['apple', 'mango', 'banana'];
fruits.add('grape');
print(fruits[0]); // apple

// Map
final user = {
  'name': 'Shrijal',
  'role': 'Flutter Dev',
  'exp': 5,
};
print(user['name']); // Shrijal

// Set — no duplicates
final tags = {'flutter', 'dart', 'flutter'};
print(tags.length); // 2

// Spread operator
final extra = ['kiwi', 'pear'];
final allFruits = [...fruits, ...extra];

// Collection if (very common in Flutter widget trees)
final isAdmin = true;
final menu = [
  'Home',
  'Profile',
  if (isAdmin) 'Admin Panel', // only added if true
];
```

---

## 06 — OOP in Dart

**⏱ ~30 min**

### Classes & Constructors

**What to cover:**

- Standard class declaration — fields, methods, access modifiers (`_private` by convention)
- **Generative constructor** — primary constructor
- **Named constructors** — alternative initialization paths (e.g. `fromJson`)
- `this.` shorthand in constructors — eliminates boilerplate
- **Getters** — computed read-only properties

```dart
class User {
  final String name;
  final String email;
  int _loginCount = 0;         // private by convention

  // Primary constructor (this. shorthand)
  User({required this.name, required this.email});

  // Named constructor
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  // Method
  void login() => _loginCount++;

  // Getter
  int get loginCount => _loginCount;
}

final u1 = User(name: 'Shrijal', email: 's@dev.io');
final u2 = User.fromJson({'name': 'Ali', 'email': 'a@io'});
```

---

### Inheritance, Abstract Classes & Mixins

**What to cover:**

- `extends` — single inheritance; the child class IS a parent class
- `abstract class` — defines a contract; cannot be instantiated directly
- `implements` — a class must provide all methods of the interface
- `mixin` — reusable bundles of functionality; used with `with` keyword — Flutter uses these internally

```dart
// Abstract class (contract)
abstract class Animal {
  String get name;
  void speak(); // must be implemented
}

// Extends
class Dog extends Animal {
  @override
  String get name => 'Dog';
  @override
  void speak() => print('Woof!');
}

// Mixin — reusable behavior
mixin Logging {
  void log(String msg) => print('[LOG] $msg');
}

class ApiService with Logging {
  void fetchData() {
    log('Fetching...'); // from the mixin
  }
}
```

> **ℹ️ Info:** Flutter's own widget system is built heavily on abstract classes and mixins. `StatefulWidget` and `StatelessWidget` are abstract classes students will extend every day.

---

## 07 — Async / Await & Futures

**⏱ ~25 min**

### Future · async · await · try/catch

**What to cover:**

- **Future** — represents a value that will be available later (like a Promise in JS)
- `async` marks a function as asynchronous; it always returns a Future
- `await` pauses execution until the Future completes — without blocking the UI thread
- `try/catch` — handle errors from async operations gracefully
- **Analogy:** ordering coffee — you don't stand frozen at the counter, you sit down (`await`) and your coffee arrives later

```dart
// Simulating an API call
Future<String> fetchUsername() async {
  await Future.delayed(Duration(seconds: 2)); // simulate delay
  return 'shrijal_dev';
}

// Calling with async/await
void loadProfile() async {
  try {
    final name = await fetchUsername();
    print('Welcome, $name!');
  } catch (e) {
    print('Error: $e');
  }
}

// Future with .then() style (alternative)
fetchUsername()
  .then((name) => print(name))
  .catchError((e) => print(e));
```

> **💡 Tip:** In Flutter, API calls, database reads, and file operations are all async. Mastering `async/await` here directly enables Phase 4 (API Integration).

---

## 08 — The Flutter Widget Tree

**⏱ ~30 min**

### Everything is a Widget — The Mental Model

**What to cover:**

- In Flutter, **every element of the UI is a widget** — text, images, padding, rows, even the app itself
- Widgets are **immutable descriptions** of the UI — they describe what to draw, not draw it directly
- Flutter builds a **widget tree**: parent widgets contain child widgets, forming a hierarchy
- **BuildContext** — the widget's location in the tree; used to look up inherited data and themes
- Essential widgets to introduce: `Text`, `Container`, `Row`, `Column`, `Padding`, `Center`, `SizedBox`, `Image`, `Icon`

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(                   // root widget
      home: Scaffold(                     // page structure
        appBar: AppBar(
          title: const Text('Hello Flutter'),
        ),
        body: Center(                     // layout widget
          child: Column(                  // vertical stack
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome!',
                style: TextStyle(fontSize: 24)),
              const SizedBox(height: 16), // spacer
              ElevatedButton(
                onPressed: () {},
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

> **💡 Teaching Tip:** Draw the widget tree on a whiteboard alongside the code.
> `MaterialApp → Scaffold → Center → Column → Text`
> This visual moment is the single most effective teaching exercise in Phase 1.

---

## 09 — StatelessWidget vs StatefulWidget

**⏱ ~30 min**

### StatelessWidget — Immutable UI

**What to cover:**

- Use when the widget's content **never changes after it's built**
- Examples: a logo, a static text label, an icon, a profile card
- Only has a `build()` method — no internal state
- Always **faster and cheaper** — prefer when state is not needed

```dart
class WelcomeBanner extends StatelessWidget {
  final String username;

  const WelcomeBanner({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade50,
      child: Text(
        'Welcome back, $username!',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Usage
WelcomeBanner(username: 'Shrijal')
```

---

### StatefulWidget — Dynamic UI & Lifecycle

**What to cover:**

- Use when the widget needs to **change over time** — button taps, counters, toggles, loading states
- Two classes: the **Widget** (configuration) and the **State** (mutable data)
- `setState()` — tells Flutter "my state changed, please rebuild this widget"
- Key lifecycle: `initState()` → `build()` → `setState()` → `build()` → `dispose()`
- **Analogy:** the widget is a TV remote's _specification_; the State is the TV's _current channel and volume_

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0; // mutable state

  @override
  void initState() {
    super.initState();
    // runs once when widget is inserted into the tree
  }

  void _increment() {
    setState(() => _count++); // triggers rebuild
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Count: $_count',
          style: const TextStyle(fontSize: 32)),
        ElevatedButton(
          onPressed: _increment,
          child: const Text('Tap Me'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // clean up controllers, listeners here
    super.dispose();
  }
}
```

> **⚠️ Common Mistake:** Calling `setState()` after `dispose()` has been called causes a runtime error. Always check `if (mounted)` before calling setState in async contexts.

---

## ✅ Session Delivery Checklist

| #   | Topic                 | Key Concept                                     | Time   |
| --- | --------------------- | ----------------------------------------------- | ------ |
| 01  | Variables & Types     | `var` · `final` · `const` · core types          | 20 min |
| 02  | Null Safety           | `?` · `!` · `??` · `?.` · `late`                | 25 min |
| 03  | Functions             | Named params · arrow syntax · higher-order      | 25 min |
| 04  | Control Flow          | `if/else` · `switch` · `for-in` · ternary       | 15 min |
| 05  | Collections           | `List` · `Map` · `Set` · spread · collection-if | 20 min |
| 06  | OOP in Dart           | Classes · constructors · inheritance · mixins   | 30 min |
| 07  | Async / Await         | `Future` · `async/await` · `try/catch`          | 25 min |
| 08  | Widget Tree           | Widget model · `BuildContext` · basic widgets   | 30 min |
| 09  | Stateless vs Stateful | `setState()` · lifecycle                        | 30 min |

---

### 🎯 Phase 1 Exit Goal

Every student can:

1. Write a `StatefulWidget` counter from scratch — without looking at notes
2. Explain why `setState()` triggers a rebuild and when to avoid it
3. Describe what the widget tree is and draw a simple one on a whiteboard
4. Write a null-safe Dart function with named parameters
5. Use `async/await` to simulate a delayed data fetch

---

_Class Material prepared for Shrijal Shrestha · Phase 1 of 5 · Flutter Training Program_
