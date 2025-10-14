# Krakebik - Recycling App 🌱♻️

A Flutter mobile application designed to make recycling easier and more accessible. Krakebik helps users turn waste into
value by connecting them with recycling services and providing a platform to manage recyclable materials.

## 📱 App Overview

Krakebik is a comprehensive recycling management app that allows users to:

- **Contribute to sustainability** with easy, effective recycling
- **Find the nearest recycling drop-off points** with real-time updates
- **Recycle waste easily** and turn waste into material value
- **Post recyclable materials** for collection services
- **Track and manage** their recycling activities

## ✨ Features

### 🔐 Authentication

- User registration and login
- Password reset functionality
- OTP verification
- Firebase Authentication integration

### 🏠 Home Dashboard

- Browse different types of recyclable materials
- Search functionality for materials
- Real-time pricing information
- Material categories including:
    - Metal waste
    - Plastic waste
    - Paper waste
    - Electronic waste
    - Oil waste
    - Carton waste

### 📝 Material Posting

- Post recyclable materials for collection
- Upload material pictures
- Specify quantity and descriptions
- Schedule preferred collection dates and times
- Set pickup locations

### 👤 User Profile

- Edit personal information
- Manage account settings
- Track recycling history

### 🎨 Modern UI/UX

- Clean, intuitive interface
- Custom themes and styling
- Responsive design with ScreenUtil
- Beautiful onboarding experience

## 🛠 Technical Stack

### Frontend

- **Flutter** - Cross-platform mobile development
- **Dart** - Programming language
- **flutter_bloc** - State management
- **go_router** - Navigation and routing
- **flutter_screenutil** - Responsive UI scaling

### Backend & Services

- **Firebase Core** - Backend infrastructure
- **Firebase Auth** - User authentication
- **Firebase Storage** - File and image storage

### UI & Design

- **Material Design** - Design system
- **Custom fonts** (Otama-ep)
- **SVG support** - Scalable vector graphics
- **Custom color schemes** and themes

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/          # App constants (strings, colors, assets)
│   ├── services/          # Core services (authentication, etc.)
│   ├── theme/             # App theming and styling
│   ├── utils/             # Utilities (routing, validators)
│   └── widgets/           # Reusable UI components
├── features/
│   ├── auth/              # Authentication feature
│   │   ├── cubit/         # State management
│   │   ├── screens/       # Auth screens
│   │   └── widgets/       # Auth-specific widgets
│   ├── home/              # Home dashboard feature
│   ├── post/              # Material posting feature
│   ├── profile/           # User profile feature
│   └── splash/            # Splash screen
└── main.dart              # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.7.2)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd NHA-228
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
    - Create a Firebase project
    - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
    - Update `firebase_options.dart` with your configuration

4. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android:**

```bash
flutter build apk --release
```

**iOS:**

```bash
flutter build ios --release
```

## 🎯 Key Screens

- **Splash Screen** - App introduction and branding
- **Onboarding** - Feature introduction with illustrations
- **Login/Register** - User authentication
- **Home** - Material browsing and search
- **Material Posting** - Create recycling requests
- **Profile** - User account management

## 🔧 Configuration

The app uses several configuration files:

- `pubspec.yaml` - Dependencies and assets
- `firebase.json` - Firebase configuration
- `analysis_options.yaml` - Code analysis rules

## 📊 Dependencies

### Core Dependencies

- `firebase_core: ^4.1.1`
- `firebase_auth: ^6.1.0`
- `flutter_bloc: ^9.1.1`
- `go_router: ^16.2.4`
- `flutter_screenutil: ^5.9.3`

### Development Dependencies

- `flutter_test`
- `flutter_lints: ^5.0.0`

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is part of the DEPI (Digital Egypt Pioneers Initiative) program.

## 🌍 Environmental Impact

Krakebik contributes to environmental sustainability by:

- Reducing waste going to landfills
- Promoting circular economy principles
- Making recycling accessible to everyone
- Connecting waste generators with recycling services
- Educating users about sustainable practices

---

**Built with ❤️ for a sustainable future**
