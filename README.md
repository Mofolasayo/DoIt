# 📋 Do-It — AI-Powered Task Management App

A modern mobile **Task Management App** built with **Flutter** and powered by **Google Gemini AI** to help you plan and organize tasks efficiently.  
Features include offline storage with Hive, AI-assisted task planning, and project/category management.

---

## ✨ Features

### 🔐 Authentication
- Email & password login/registration
- Basic input validation and error handling
- Local session storage using `shared_preferences`

### 📂 Task & Project Management
- Create, edit, delete tasks
- Categorize tasks into projects or categories
- Mark tasks as complete/incomplete
- Set priority levels and due dates

### 🧠 AI Integration (Gemini API)
- **AI Task Assistant**:  
  Type prompts like:
and get AI-generated task suggestions with titles, priorities, and due dates.
- **Selective Import**:  
Pick which AI-generated tasks to import into your list.
- **Smart Rescheduler (Bonus)**:  
For overdue tasks, tap "Suggest New Time" and AI will propose a new due date.

### 💾 Offline Support
- All tasks stored locally with **Hive**
- Data persists across app restarts
- Ready for background sync with a mock API



---

## 📱 Screenshots



---

## 🏗️ Architecture
The app follows a **Clean + MVVM architecture** using [Stacked](https://pub.dev/packages/stacked):


**Layers:**
1. **Presentation** — UI screens built with Flutter widgets & ViewModels
2. **Domain** — Core logic (task handling, AI prompts, scheduling)
3. **Data** — Hive storage & API calls (Gemini, Mock API)

---

## 🔧 Tech Stack
- **Flutter 3.x** with null safety
- [stacked](https://pub.dev/packages/stacked) for state management
- [hive](https://pub.dev/packages/hive) & [hive_flutter](https://pub.dev/packages/hive_flutter) for offline storage
- [google_generative_ai](https://pub.dev/packages/google_generative_ai) for AI task generation
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) for secure API key management
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) for task reminders

---

## 🚀 Getting Started

### 1️⃣ Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A **Google Gemini API key** from [Google AI Studio](https://makersuite.google.com/app/apikey)

### 2️⃣ Clone the repo
```bash
git clone https://github.com/YOUR_USERNAME/do-it.git
cd do-it

flutter pub 

flutter run


