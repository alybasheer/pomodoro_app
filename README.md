# 🍅 Pomodoro Timer (Flutter)

A clean and reactive **Pomodoro Timer application** built using **Flutter** and **GetX**, following best practices for state management, controller lifecycle, and UI performance.

---

## ✨ Features

- Pomodoro, Short Break, and Long Break modes  
- Circular countdown timer animation  
- Start / Pause / Restart controls  
- Customizable time durations  
- Reactive UI updates using GetX (`Obx`)  
- Clean separation of UI and business logic  

---

## 🛠 Tech Stack

- **Flutter**
- **GetX** (State Management & Dependency Injection)
- **circular_countdown_timer**

---

## 🧱 Project Structure

lib/
├── bindings/
│ └── app_binding.dart
├── home_screen/
│ ├── controller/
│ │ └── home_cntrl.dart
│ └── view/
│ └── home_screen.dart
├── setting_screen/
│ ├── controller/
│ │ └── setting_cntrl.dart
│ └── view/
│ └── setting_screen.dart
└── utility/
└── constants/
└── app_colors.dart

yaml
Copy code

---

## 🧠 Architecture Overview

- All screens are built using `StatelessWidget`
- UI is a pure function of state
- All mutable state lives inside GetX controllers
- Controllers are created once using **Bindings**
- Widgets access controllers using `Get.find()`
- No controllers are created inside `build()` methods
- `Obx` rebuilds only its subtree, not the entire widget tree

---

## 🔄 Controller Lifecycle

Controllers follow the GetX lifecycle:

- `onInit()` → initialize controllers and resources
- `onClose()` → dispose resources safely
- Controllers outlive widget rebuilds
- Animation controllers are owned by business controllers, not widgets

---

## ⏱ Timer Logic

- User-selected durations are stored in **minutes**
- Converted to **seconds** before starting the timer
- Countdown animation is controlled exclusively by `HomeController`

<img width="1052" height="767" alt="image" src="https://github.com/user-attachments/assets/c470a5e2-7dcd-4bcc-8b3c-16c5b9703c63" />


