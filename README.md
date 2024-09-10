# Blood Donor App

A Flutter-based blood donor app that allows users to register and log in using email/password and Google sign-in. This app also uses Firebase for user authentication and Firestore for storing user data.

## Features

- User registration using email and password
- User login using email and password
- Google sign-in authentication
- Navigation using GetX
- Firebase Firestore integration for storing user data
- Responsive state management with GetX
- Error handling with GetX's Snackbar notifications

## Project Structure

```
lib/
├── controllers/
│   └── auth_controller.dart      # Handles authentication logic
├── screens/
│   ├── login_screen.dart         # User login screen
│   ├── register_screen.dart      # User registration screen
│   └── home_screen.dart          # Home screen for authenticated users
├── services/
│   └── auth_service.dart         # Handles Firebase Authentication and Firestore interaction
└── main.dart                     # Entry point of the app
```

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/) installed on your machine.
- A Firebase project set up. Follow [this guide](https://firebase.google.com/docs/flutter/setup) to add Firebase to your Flutter app.
- Enable **Email/Password Authentication** and **Google Authentication** in your Firebase project's Authentication settings.

### Firebase Setup

1. Add your Firebase configuration to the app by downloading the `google-services.json` file and placing it in the `android/app` directory.
2. Enable the Firebase Authentication sign-in methods for Email/Password and Google in the Firebase Console.

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/blood-donor-app.git
   ```

2. Navigate to the project directory:
   ```
   cd blood-donor-app
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the app:
   ```
   flutter run
   ```

## Authentication Flow

### Email and Password Authentication

- Users can register using their email and password.
- After registration, they are automatically logged in and navigated to the `HomeScreen`.
- On successful login, users are navigated to the `HomeScreen`.

### Google Sign-In Authentication

- Users can sign in using their Google account.
- On successful login, users are navigated to the `HomeScreen`.

### Navigation and State Management

- Navigation between screens is handled using GetX's `Get.to()` method.
- User authentication status is managed using GetX's `AuthController`.
- Loading states are displayed during registration and login.

## Dependencies

The following dependencies are used in the project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: latest_version
  firebase_auth: latest_version
  cloud_firestore: latest_version
  google_sign_in: latest_version
  get: latest_version
```

## Screenshots

Include screenshots of the app (e.g., login screen, registration screen, home screen) here.

---

## License

This project is licensed under the MIT License.