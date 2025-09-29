# Simple BLE Test App

A minimal Flutter app to test BLE connection to "SC NUS Peripheral".

## Setup

```bash
# Create Flutter project
flutter create simple_ble_test
cd simple_ble_test

# Add to pubspec.yaml dependencies:
flutter_blue_plus: ^1.12.13
permission_handler: ^11.0.1

# Install dependencies
flutter pub get

# Run
flutter run
```

## What it does
1. Scans for "SC NUS Peripheral" 
2. Connects automatically
3. Shows "Connected ✓" or "Not Connected ❌"
4. That's it!