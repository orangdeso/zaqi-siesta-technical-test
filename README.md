# Zaqi Siesta Technical Test

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-9C27B0?style=for-the-badge&logo=flutter&logoColor=white)

*Aplikasi Flutter untuk implementasi technical test dengan Clean Architecture*

</div>

---

## 🇮🇩 Bahasa Indonesia

### 📋 Tentang Proyek

Proyek ini adalah implementasi technical test menggunakan Flutter dengan menerapkan prinsip **Clean Architecture** dan **SOLID principles**. Aplikasi ini terdiri dari tiga tugas utama yang mendemonstrasikan kemampuan dalam pengembangan UI, integrasi API, dan state management.

### 📖 Dokumentasi Technical Test

Untuk melihat detail soal dan spesifikasi lengkap technical test, silakan kunjungi:

**[📖 Technical Test Documentation](./docs/technical_test_documentation.md)**

Dokumentasi tersebut berisi:
- **Tugas 1**: Implementasi UI sesuai referensi Figma
- **Tugas 2**: Aplikasi dengan API integration (lazy loading, pull-to-refresh, shimmer effect)
- **Tugas 3**: TODO list application dengan state management
- Kriteria penilaian untuk setiap tugas
- API endpoints dan spesifikasi teknis

### 🏗️ Arsitektur Clean Architecture

Proyek ini mengimplementasikan Clean Architecture dengan struktur sebagai berikut:

```
lib/
├── core/                           # Core utilities dan shared components
│   ├── components/                 # Reusable UI components
│   │   ├── card_component.dart
│   │   ├── shimmer_loading.dart
│   │   └── ...
│   ├── network/                    # Network configuration
│   │   └── dio_client.dart
│   └── service/                    # Core services
│       ├── brand_color.dart
│       ├── font_size.dart
│       ├── typography.dart
│       └── icons_library.dart
├── features/                       # Feature modules (Clean Architecture)
│   ├── first_task/                 # Task 1: UI Implementation
│   │   └── presentation/
│   │       ├── controller/
│   │       └── page/
│   ├── second_task/                # Task 2: API Integration
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   ├── models/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── component/
│   │       ├── controller/
│   │       └── page/
│   ├── third_task/                 # Task 3: TODO App
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── main_screen/                # Main navigation
├── routes/                         # Navigation setup
│   ├── app_routes.dart
│   └── routes.dart
└── main.dart                       # Application entry point
```

### 🛠️ Teknologi yang Digunakan

#### Core Technologies
- **Flutter SDK**: Framework untuk pengembangan cross-platform
- **Dart**: Bahasa pemrograman utama

#### State Management
- **GetX**: State management yang powerful dan ringan
  - Reactive state management
  - Dependency injection
  - Route management
  - Internationalization support

#### UI/Design Libraries
- **flutter_screenutil**: Responsive design
- **google_fonts**: Custom fonts
- **flutter_svg**: SVG support
- **shimmer**: Loading animations
- **zoom_tap_animation**: Interactive animations
- **carousel_slider**: Image carousel
- **cached_network_image**: Optimized image loading

#### Network/Data Libraries
- **dio**: HTTP client untuk API calls
- **dartz**: Functional programming (Either type)
- **sqflite**: Local database
- **intl**: Internationalization

#### Development Tools
- **cupertino_icons**: iOS-style icons

### 🎯 Mengapa Memilih GetX?

GetX dipilih sebagai state management solution karena:

1. **Simplicity**: Syntax yang sederhana dan mudah dipahami
2. **Performance**: Sangat ringan dan cepat
3. **Productivity**: Mengurangi boilerplate code secara signifikan
4. **Complete Solution**: Menyediakan state management, dependency injection, dan route management dalam satu package
5. **Reactive Programming**: Mendukung reactive programming dengan `.obs` dan `Obx()`
6. **Memory Management**: Otomatis dispose controller ketika tidak digunakan
7. **Easy Testing**: Mudah untuk di-test dan di-mock

### 🚀 Cara Menjalankan Aplikasi

1. **Clone repository**
   ```bash
   git clone <repository-url>
   cd zaqi-siesta-technical-test
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi**
   ```bash
   flutter run
   ```

### 📱 Fitur Aplikasi

#### Task 1: UI Implementation
- ✅ Implementasi UI sesuai design Figma
- ✅ Responsive design dengan flutter_screenutil
- ✅ Custom components dan styling

#### Task 2: API Integration
- ✅ Product listing dengan lazy loading
- ✅ Pull-to-refresh functionality
- ✅ Shimmer loading effects
- ✅ Search functionality
- ✅ Product detail modal
- ✅ Error handling dengan custom error widgets
- ✅ Network connectivity detection

#### Task 3: TODO Application
- ✅ CRUD operations untuk TODO items
- ✅ Local database dengan SQLite
- ✅ State management dengan GetX
- ✅ Persistent data storage

---

## 🇺🇸 English

### 📋 About Project

This project is a technical test implementation using Flutter with **Clean Architecture** and **SOLID principles**. The application consists of three main tasks demonstrating capabilities in UI development, API integration, and state management.

### 📖 Technical Test Documentation

For detailed requirements and complete technical test specifications, please visit:

**[📖 Technical Test Documentation](./docs/technical_test_documentation.md)**

The documentation contains:
- **Task 1**: UI implementation according to Figma reference
- **Task 2**: Application with API integration (lazy loading, pull-to-refresh, shimmer effect)
- **Task 3**: TODO list application with state management
- Evaluation criteria for each task
- API endpoints and technical specifications

### 🏗️ Clean Architecture Structure

This project implements Clean Architecture with the following structure:

```
lib/
├── core/                           # Core utilities and shared components
│   ├── components/                 # Reusable UI components
│   ├── network/                    # Network configuration
│   └── service/                    # Core services
├── features/                       # Feature modules (Clean Architecture)
│   ├── first_task/                 # Task 1: UI Implementation
│   ├── second_task/                # Task 2: API Integration
│   │   ├── data/                   # Data layer
│   │   ├── domain/                 # Domain layer
│   │   └── presentation/           # Presentation layer
│   ├── third_task/                 # Task 3: TODO App
│   └── main_screen/                # Main navigation
├── routes/                         # Navigation setup
└── main.dart                       # Application entry point
```

### 🛠️ Technologies Used

#### Core Technologies
- **Flutter SDK**: Cross-platform development framework
- **Dart**: Primary programming language

#### State Management
- **GetX**: Powerful and lightweight state management
  - Reactive state management
  - Dependency injection
  - Route management
  - Internationalization support

#### UI/Design Libraries
- **flutter_screenutil**: Responsive design
- **google_fonts**: Custom fonts
- **flutter_svg**: SVG support
- **shimmer**: Loading animations
- **zoom_tap_animation**: Interactive animations
- **carousel_slider**: Image carousel
- **cached_network_image**: Optimized image loading

#### Network/Data Libraries
- **dio**: HTTP client for API calls
- **dartz**: Functional programming (Either type)
- **sqflite**: Local database
- **intl**: Internationalization

### 🎯 Why Choose GetX?

GetX was chosen as the state management solution because:

1. **Simplicity**: Simple and easy-to-understand syntax
2. **Performance**: Very lightweight and fast
3. **Productivity**: Significantly reduces boilerplate code
4. **Complete Solution**: Provides state management, dependency injection, and route management in one package
5. **Reactive Programming**: Supports reactive programming with `.obs` and `Obx()`
6. **Memory Management**: Automatically disposes controllers when not in use
7. **Easy Testing**: Easy to test and mock

### 🚀 How to Run the Application

1. **Clone repository**
   ```bash
   git clone <repository-url>
   cd zaqi-siesta-technical-test
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run application**
   ```bash
   flutter run
   ```

### 📱 Application Features

#### Task 1: UI Implementation
- ✅ UI implementation according to Figma design
- ✅ Responsive design with flutter_screenutil
- ✅ Custom components and styling

#### Task 2: API Integration
- ✅ Product listing with lazy loading
- ✅ Pull-to-refresh functionality
- ✅ Shimmer loading effects
- ✅ Search functionality
- ✅ Product detail modal
- ✅ Error handling with custom error widgets
- ✅ Network connectivity detection

#### Task 3: TODO Application
- ✅ CRUD operations for TODO items
- ✅ Local database with SQLite
- ✅ State management with GetX
- ✅ Persistent data storage

---

<div align="center">

**Developed with ❤️ using Flutter & GetX**

</div>
