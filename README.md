# Hotel Booking App

## Overview

The **Hotel Booking App** is a **Flutter-based** mobile application designed for seamless **hotel room booking** across **iOS and Android** platforms. It follows **Clean Architecture**, ensuring a structured, maintainable, and scalable codebase.

## Key Features

- **🛠️ State Management:** Uses the **BLoC pattern** for efficient state handling.
- **💾 Local Storage:** Implements **hydrated_bloc** and **path_provider** for local data management.
- **🔗 Dependency Injection:** Utilizes a structured DI system for better modularity.
- **📱 Cross-Platform Compatibility:** Works seamlessly on both **iOS** and **Android**.
- **🎨 User-Friendly UI:** Designed for an intuitive and engaging user experience.

## Architecture

The app follows **Clean Architecture**, dividing the codebase into distinct layers for better maintainability:

### **1️⃣ Presentation Layer**

- **Pages and Widgets:** Handles UI components and user interactions.
- **BLoC (Business Logic Component):** Manages app state and business logic.
- **Dependency Injection:** Handles the dependencies required for this layer.

### **2️⃣ Domain Layer**

- **Entities:** Represents the core business models.
- **Use Cases:** Encapsulates business logic and rules.
- **Repositories (Interfaces):** Defines contracts for data operations.

### **3️⃣ Data Layer**

- **Data Sources:** Fetches data from APIs, databases, or local storage.
- **Models:** Defines data structures for API communication.
- **Repository Implementations:** Provides actual data handling logic.
