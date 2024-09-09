# Blood Donor App

A Flutter-based mobile application that allows donors to register with their phone number, submit ID information (or use automatic ID extraction), and receive notifications when blood banks need donations of their specific blood type. This project uses Firebase for authentication, storage, and notifications.

## Features

- **Phone Number Authentication**: Donors register using Firebase Authentication via their phone number.
- **ID Submission**: Donors can either manually input their ID details or upload a photo for automatic ID extraction.
- **Notifications**: Donors receive push notifications when the blood bank requires a specific blood type.
- **Data Management**: User information such as blood type, profession, and contact details is stored securely in Firebase Firestore.

## Project Structure

The project follows a feature-layered architecture using BLoC for state management:

```
lib/
├── data/
│   ├── models/
│   ├── repositories/
├── logic/
│   ├── blocs/
│   └── cubits/
├── presentation/
│   ├── screens/
│   └── widgets/
├── services/
├── app.dart
└── main.dart
```

- **Data Layer**: Manages models and repositories for handling data and interacting with Firebase.
- **Logic Layer**: Contains the BLoC and Cubit classes responsible for state management.
- **Presentation Layer**: Defines the UI, with screens for registration, ID submission, and notifications.
- **Services Layer**: Contains Firebase services for authentication, Firestore, and Cloud Messaging.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Firebase project: [Set up Firebase](https://firebase.google.com/docs/flutter/setup) with Authentication, Firestore, and Cloud Messaging.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/blood-donor-app.git
   cd blood-donor-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up Firebase:
   - Follow Firebase setup instructions to configure Firebase Authentication, Firestore, and Cloud Messaging.
   - Add `google-services.json` for Android and `GoogleService-Info.plist` for iOS.

4. Run the app:
   ```bash
   flutter run
   ```

## Features Breakdown

### Phone Number Authentication

The app uses Firebase Authentication for verifying the donor's phone number. Once verified, the donor proceeds to submit ID information.

### ID Information Submission

- **Manual Input**: Donors can enter details such as name, blood type, address, and profession.
- **Automatic ID Extraction (Optional)**: The app allows donors to upload a photo of their ID, and the information is extracted using OCR.

### Notifications

Firebase Cloud Messaging is used to notify donors when the blood bank requires donations for specific blood types. Notifications are sent based on the donor's blood type.

## Dependencies

- [firebase_core](https://pub.dev/packages/firebase_core)
- [firebase_auth](https://pub.dev/packages/firebase_auth)
- [cloud_firestore](https://pub.dev/packages/cloud_firestore)
- [firebase_messaging](https://pub.dev/packages/firebase_messaging)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [image_picker](https://pub.dev/packages/image_picker) (for ID photo upload)
- [firebase_ml_vision](https://pub.dev/packages/firebase_ml_vision) (for ID extraction via OCR, optional)

## Contributing

Feel free to submit pull requests or open issues. For major changes, please open an issue first to discuss what you'd like to change.

## License

[MIT](LICENSE)
