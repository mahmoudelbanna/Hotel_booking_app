
# 🏨 Hotel Booking App

  

A cross-platform hotel booking app built with Flutter. The app allows users to explore hotel offers, manage favorites, and customize account settings.

  

## 🚀 Features

  

- 🔍 **Browse Hotels** – Discover hotel offers with descriptions.

- ❤️ **Favorites** – Save and manage your favorite hotels locally.

- 🌐 **Multi-language Support** – Supports English and German, with automatic detection based on device settings.

- 🔗 **Deep Linking** – Navigate directly to the app, favorites, and specific links.

- 🗂️ **Persistent State** – Favorites and language settings are saved even after closing the app.

- ⚡ **Clean Architecture** – Follows a scalable, maintainable structure for business logic, data, and UI.

  

## 📸 Screenshots and Demo Video

  

- [View Screenshots](https://github.com/mahmoudelbanna/Hotel_booking_app/actions/)
- [View videos demo](https://drive.google.com/file/d/1kJpWHVeA7kBaTjTQS1lSCEH3NR-kzdd-/view?usp=share_link)

  

## ⚙️ Setup Instructions

  

### Prerequisites

  

- Flutter SDK (latest stable version)

- Dart SDK (bundled with Flutter)

- Android Studio, VS Code, or any preferred IDE

- Emulator or physical device for testing

  

### Clone the Repository

```bash

git  clone  https://github.com/mahmoudelbanna/Hotel_booking_app.git

cd  Hotel_booking_app

```

  
  

### Install Dependencies

  

```bash

flutter  pub  get

```

### Generate Code

Run the code generators (Freezed, json_serializable) before launching the app or
executing tests:

```bash
dart run build_runner build --delete-conflicting-outputs
```

For active development you can keep the generator running:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

  

### Environment Configuration

  

Create a `.env` file in the project root (not committed to GitHub) to store environment-specific variables:

  

```plaintext

URL=https://example.com/api

```

**Note:** GitHub Actions handle environment variables during CI/CD, so a `.env` file isn’t needed for automated tests.

  

## 🧪 Running Tests

  

```bash

flutter  test

```

  

## 🌍 Overview

  

The Hotel Booking App follows a clean architecture pattern, which separates the business logic from the UI and data sources. This separation makes the app easier to maintain, test, and scale.

  

- ✅ Supports two languages: English and German

- ✅ Automatic language detection based on device settings

- ✅ Local language switching from the settings screen

  

## 🏗️ App Architecture

  

The app is divided into three primary layers following the Clean Architecture principle:

  

1.  **Presentation Layer**

-  **Pages and Widgets**: UI components built using Flutter's widget system.

-  **BLoC (Business Logic Components)**: Handles state management and business logic.

-  **Navigation**: Managed with AutoRoute for smooth deep linking and route handling.

2.  **Domain Layer**

-  **Entities**: Core business models like `Hotel`.

-  **Use Cases**: Business rules that define specific operations.

-  **Repositories**: Abstract interfaces for data access.

3.  **Data Layer**

-  **Repositories (Implementations)**: Concrete classes that implement repository interfaces.

-  **Data Sources**: Remote data management (future API integration).

-  **Models**: Data Transfer Objects for serialization/deserialization.

  

## 💡 Key Design Decisions

  

1.  **State Management with BLoC**

-  **Implementation**: Each feature has its own BLoC handling state and business logic.

-  **Persistence**: Uses `hydrated_bloc` to persist state across app restarts.

2.  **Dependency Injection with `get_it`**

-  **Rationale**: Promotes loose coupling and easier testing.

-  **Implementation**: Dependencies are registered in a central file using `get_it`.

-  **Note**: `get_it` is used only for BLoC providers, not throughout the entire app.

3.  **Environment Configuration with `flutter_dotenv`**

-  **Implementation**: `.env` files store critical variables, loaded at app startup.

-  **Security**: Sensitive data is excluded from GitHub; GitHub Actions manage environment variables for CI/CD.

4.  **Clean Architecture**

-  **Rationale**: Ensures the app is scalable, testable, and easy to maintain.

-  **Implementation**: Clear separation between Presentation, Domain, and Data layers with well-defined interfaces.

5.  **Deep Linking**

-  **Rationale**: Allows users to access specific screens directly via URLs.

-  **Implementation**:

-  **Android**: Simulates server interaction using a local server with HTTP scheme.

-  `http://deeplinkserver` → Opens App

-  `http://deeplinkserver/favorites` → Opens the Favorites page

-  **iOS**: Uses a custom scheme to simulate deep linking.

-  `myapp://deeplinkserver` → Opens App

-  `myapp://deeplinkserver/favorites` → Opens the Favorites page

6.  **Language Support**

-  **Rationale**: Supports both English and German for international users.

-  **Implementation**:

-  **Auto-detection**: The app launches in German or English based on the device language.

-  **Fallback**: Defaults to English if the device language is unsupported.

-  **Manual Change**: Users can change the language in the settings, and the preference is stored locally.

7.  **Internet Connectivity Check**

-  **Rationale**: Ensures a stable and reliable user experience when interacting with online services.

-  **Implementation**: The app checks for an active internet connection before making any API calls, preventing errors and improving performance.

  

## 📦 Project Structure

  

```

lib/

├── main.dart

├── core/ # Core utilities and shared components

│ ├── app/

│ ├── app_router/

│ └── ...

├── features/ # Feature modules (Overview, Hotels, Favorites, Account)

│ ├── data/

│ ├── domain/

│ └── presentation/

```

  

## 🗂️ Tech Stack

  

- Flutter (Latest Stable Version)

- Dart (Primary programming language)

- BLoC & Hydrated Bloc (State management and persistence)

- AutoRoute (Declarative navigation with deep linking support)

- GetIt (Dependency injection)

- Flutter Dotenv (Environment configuration)

- Custom Widgets (Reusable UI components)


  

## 👥 Contributors

  

Mahmoud Elbanna
