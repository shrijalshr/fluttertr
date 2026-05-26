# Phase 2 — OOP Basics in Dart & Flutter Basics
## 🎓 Complete Beginner's Interactive Classroom Repository
> Prepared for the Flutter Training Program under **Shrijal Shrestha**.

Welcome to **Phase 2** of the Flutter Training Program! This repository is carefully crafted for absolute beginners, transitioning you from standard programming logic into a fully-fledged interactive app developer.

---

## 🗺️ Curriculum Map & Branch Guide

To make learning smooth and stress-free, this repository is divided into **git branches**. Think of each branch as a "save point" in a game: you can check out any branch to see the exact code for that specific topic!

```
                    [ 🚀 main ]
            (Documentation, Guides & Syllabus)
                        │
                        ▼
             [ 📦 course/01-oop-basics ]
           (Part A: Dart OOP Playground CLI)
                        │
                        ▼
            [ 🎨 course/02-flutter-basics ]
           (Part B: Widget Catalog App UI)
                        │
                        ▼
         [ ⚡ course/03-flutter-interaction-nav ]
         (Part B: Input, State & Multi-Screen)
                        │
                        ▼
              [ 🏆 course/mini-project ]
           (Premium 2-Screen Profile Card App)
```

| Branch Name | Core Concept | Main Files / Exercises | Est. Time |
| :--- | :--- | :--- | :--- |
| **`main`** | Course Hub & Full Docs | `/README.md`, `/docs/` | *Reference* |
| **`course/01-oop-basics`** | Dart Object-Oriented Fundamentals | `bin/01_classes.dart`<br>`bin/02_constructors.dart`<br>`bin/03_encapsulation.dart`<br>`bin/04_inheritance.dart` | **1.5 hrs** |
| **`course/02-flutter-basics`** | Core & Layout UI Widgets | `lib/screens/core_widgets.dart`<br>`lib/screens/layout_widgets.dart` | **1.0 hrs** |
| **`course/03-flutter-interaction-nav`** | Interaction, Input & Navigation | `lib/screens/interaction_screen.dart`<br>`lib/screens/nav_home_screen.dart`<br>`lib/screens/nav_detail_screen.dart` | **1.2 hrs** |
| **`course/mini-project`** | Premium 2-Screen App Implementation | `lib/models/user_profile.dart`<br>`lib/screens/setup_profile_screen.dart`<br>`lib/screens/profile_card_screen.dart` | **1.0 hrs** |

---

## 🛠️ Step-by-Step Learning Guide

### 1. Navigating Branches
Students can easily switch between lessons using their terminal:
```bash
# To view the Dart OOP exercises:
git checkout course/01-oop-basics

# To view basic widgets:
git checkout course/02-flutter-basics

# To view interaction and screen navigation:
git checkout course/03-flutter-interaction-nav

# To view the completed mini-project:
git checkout course/mini-project
```

### 2. Running Code

#### running Dart CLI exercises (on `course/01-oop-basics`):
```bash
# Navigate to the folder and run any script directly:
dart run bin/01_classes.dart
dart run bin/02_constructors.dart
```

#### running Flutter Demos (on `course/02-...` & `course/03-...` & `course/mini-project`):
```bash
# Check connected devices:
flutter devices

# Run the live interactive catalog:
flutter run
```

---

## 📖 Phase 2 Syllabus Overview

### PART A — OOP Basics in Dart
- **01. What is OOP?** - The cookie cutter (Class) vs the cookie (Object) blueprint analogy.
- **02. Classes & Objects** - Defining properties, creating instances, and dot `.` notation.
- **03. Constructors** - Default, shorthand `this.`, and Named Constructors (`fromMap`).
- **04. Encapsulation** - Private fields using `_`, custom getters, and object methods.
- **05. Inheritance** - Reusing code with `extends`, method overriding (`@override`), and `super`.

### PART B — Flutter Basics
- **06. Core Widgets** - Building blocks: `Text`, `Container`, `Image`, `Icon`, and `SizedBox`.
- **07. Layout Widgets** - Positioning elements: `Row`, `Column`, `Stack`, `Padding`, `Expanded`, and `ListView`.
- **08. Basic Interaction** - Clickable interfaces: `ElevatedButton`, `TextButton`, `IconButton`, `TextField` capturing, and `GestureDetector`.
- **09. Navigation Between Screens** - Screen changes using `Navigator.push`, `Navigator.pop`, and parameter-passing.

---

## 🎯 Phase 2 Exit Goals
Every student who completes this curriculum will be able to:
1. Write a custom Dart class with private properties, robust constructors, and encapsulation.
2. Build child classes using inheritance and override parent methods.
3. Compose complex layouts in Flutter utilizing nested columns, rows, stacks, and padding.
4. Capture user-input dynamically using `TextField` and update the UI in real-time with `setState()`.
5. Connect screens, push routes, pop back, and share structured objects between them.

---

*Class Material prepared for Shrijal Shrestha · Phase 2 of 5 · Flutter Training Program*
