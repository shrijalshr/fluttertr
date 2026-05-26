# Part B — Flutter Basics
> **Target Audience:** Complete beginners with zero programming experience.

Welcome to your study guide for Flutter UI development! In Flutter, **Everything is a Widget**. A widget is a declaration of how a piece of UI should look and act.

---

## 06. Core Widgets

These are the fundamental building blocks of almost every app you will build.

### A. Text
Displays a string of text with customizable styles (size, weight, colors).
```dart
Text(
  'Hello Flutter! 🚀',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
  ),
)
```

### B. Container
A versatile box. It can have a fixed size, background color, border radius, inner space (padding), and outer space (margin).
```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue.shade100,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.blue, width: 2),
  ),
  child: Text('Inside the box!'),
)
```

### C. Icon & SizedBox
- **`Icon`**: Displays pre-made system icons easily.
- **`SizedBox`**: A blank box. Mostly used as a **spacer** to push widgets away from each other.
```dart
Row(
  children: [
    Icon(Icons.star, color: Colors.amber, size: 24),
    SizedBox(width: 8), // Adds a 8-pixel horizontal gap
    Text('4.8 Rating'),
  ],
)
```

### D. Image
Loads and displays photos.
- `Image.network('url')`: Loads directly from the web.
- `Image.asset('path')`: Loads from your local app bundle.
```dart
Image.network(
  'https://picsum.photos/300',
  width: 150,
  height: 150,
  fit: BoxFit.cover, // Resizes to fill the dimensions without distortion
)
```

---

## 07. Layout Widgets

Layout widgets arrange multiple child widgets on the screen.

### A. Row & Column
- **`Row`**: Arranges children side-by-side (horizontally).
- **`Column`**: Arranges children top-to-bottom (vertically).

#### 💡 Alignment Cheatsheet:
- **`mainAxisAlignment`**: Aligns children along the direction of flow.
  - In a `Row`, this aligns items **horizontally** (left, center, right, spaceBetween).
  - In a `Column`, this aligns items **vertically** (top, center, bottom, spaceBetween).
- **`crossAxisAlignment`**: Aligns children along the opposite direction of flow.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)
```

### B. Expanded
When inside a `Row` or `Column`, wrapping a child in `Expanded` makes it stretch to fill all remaining empty space.
```dart
Row(
  children: [
    Icon(Icons.message),
    SizedBox(width: 8),
    Expanded(
      child: Text('This message is extremely long and will wrap automatically instead of crashing off-screen!'),
    ),
  ],
)
```

### C. Stack
Places widgets on top of each other (like layers). The first widget in the list is on the bottom, and the last is on the top.
```dart
Stack(
  children: [
    Container(width: 100, height: 100, color: Colors.blue),
    Positioned(
      bottom: 5,
      right: 5,
      child: Icon(Icons.check_circle, color: Colors.white),
    ),
  ],
)
```

### D. ListView
A scrollable column. Standard columns crash if the items exceed the screen height. `ListView` lets users scroll through infinite lists smoothly.
```dart
ListView(
  children: [
    ListTile(
      leading: CircleAvatar(child: Text('A')),
      title: Text('Alice'),
      subtitle: Text('Developer'),
    ),
    ListTile(
      leading: CircleAvatar(child: Text('B')),
      title: Text('Bob'),
      subtitle: Text('Designer'),
    ),
  ],
)
```

---

## 08. Basic Interaction

Interactivity makes an app feel alive!

### A. Buttons
- **`ElevatedButton`**: Raised, solid-colored button.
- **`TextButton`**: Flat, plain text button (mostly used for secondary actions).
- **`IconButton`**: A clickable icon with no surrounding borders.
```dart
ElevatedButton(
  onPressed: () {
    print('Button clicked!');
  },
  child: Text('Submit'),
)
```

### B. Capturing Text Input (`TextField`)
To get text from a user, we use a `TextField` controlled by a `TextEditingController`.

```dart
class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // 1. Create a controller
  final TextEditingController _controller = TextEditingController();
  String _greeting = '';

  @override
  void dispose() {
    _controller.dispose(); // ⚠️ Crucial: Always clean up controllers!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Enter Name'),
        ),
        ElevatedButton(
          onPressed: () {
            // 2. Read text and update state
            setState(() {
              _greeting = _controller.text;
            });
          },
          child: Text('Greet Me'),
        ),
        Text('Hello, $_greeting!'),
      ],
    );
  }
}
```

### C. GestureDetector
Wraps any normal widget (like an image or a styled Container) to detect taps, double-taps, or long-presses.
```dart
GestureDetector(
  onTap: () => print('Container tapped!'),
  child: Container(
    padding: EdgeInsets.all(12),
    color: Colors.teal.shade100,
    child: Text('Tap Me!'),
  ),
)
```

---

## 09. Navigation Between Screens

In Flutter, different screens are represented by whole Widgets (usually standard `Scaffold` pages). We navigate between them using the **`Navigator`** API.

### The Stack of Cards Analogy
Think of the Navigator like a stack of playing cards:
- **`push()`**: Piles a new card (screen) on top. The user sees this new screen.
- **`pop()`**: Slips the top card off, returning the user to the card underneath.

```
   Navigator.push()               Navigator.pop()
 ──────────────────             ─────────────────
  [ Page 2: Detail ]  ◄── (Top)    [ Page 2: Detail ]  (Removed!)
  [ Page 1: Home   ]               [ Page 1: Home   ]  ◄── (Now visible)
```

### Basic Navigation Code

```dart
// 1. Going to Page 2
ElevatedButton(
  child: Text('Go to Details'),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen()),
    );
  },
)

// 2. Going back to Page 1
ElevatedButton(
  child: Text('Go Back'),
  onPressed: () {
    Navigator.pop(context);
  },
)
```

### Passing Data to a New Screen
To send data to a new screen, simply pass the data as constructor arguments when creating the Screen Widget!

```dart
// 1. In Page 1 (Sending Data):
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProfileScreen(userName: 'Shrijal'),
  ),
);

// 2. In Page 2 (Receiving Data):
class ProfileScreen extends StatelessWidget {
  final String userName; // Declared field

  // Required in constructor
  const ProfileScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Welcome back, $userName!')),
    );
  }
}
```

---

*Open up the `course/02-flutter-basics` and `course/03-flutter-interaction-nav` branches to see these widgets and navigation patterns running live!*
