# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter note-taking application with mock authentication functionality. The app allows users to create, view, and delete notes with a simple Material Design interface.

## Development Commands

### Essential Commands
```bash
# Install dependencies
flutter pub get

# Run the app (web development server on port 8080)
flutter run -d web-server --web-port=8080

# Run on specific platforms
flutter run -d chrome        # Chrome browser
flutter run -d windows       # Windows desktop
flutter run -d android       # Android device/emulator

# Check Flutter environment
flutter doctor

# Run tests
flutter test

# Analyze code for issues
flutter analyze

# Clean build artifacts
flutter clean
```

### Development Notes
- The app currently uses mock authentication (no real Firebase integration)
- Primary testing is done via web server on port 8080
- Supports multiple platforms: Android, iOS, Web, Windows, macOS, Linux

## Architecture and Structure

### Application Architecture
The app follows a simple Flutter architecture pattern with:

- **Stateful Widgets**: Main UI components with local state management
- **Singleton Services**: AuthService for authentication state management
- **Local Storage**: SharedPreferences for data persistence
- **Stream-based State**: Using StreamBuilder for reactive authentication state

### Key Components

#### Authentication Flow
- `AuthWrapper` - Handles authentication state and routing between login/main screens
- `AuthService` - Singleton service managing mock user authentication and state
- `MockUser` - Data model representing authenticated user
- Authentication state is persisted in SharedPreferences

#### Note Management
- `Note` - Data model with id, content, and creation timestamp
- `NoteListPage` - Main interface for viewing and managing notes
- Notes are stored locally using SharedPreferences with JSON serialization

#### UI Components
- `LoginPage` - Mock Google sign-in interface with loading states
- `NoteListPage` - Card-based note listing with add/delete functionality
- Material Design 3 theming throughout

### File Structure
```
lib/
├── main.dart              # App entry point, routing, and note management UI
├── auth_service.dart      # Authentication service with mock implementation
├── models/               # (Currently empty)
└── services/             # (Currently empty)
```

### Data Flow
1. App initializes AuthService and checks for saved authentication state
2. AuthWrapper listens to authentication stream and shows appropriate screen
3. Notes are managed locally via SharedPreferences with JSON serialization
4. All note operations require authentication (enforced in UI)

## Authentication System

The project uses mock authentication for simplicity and ease of development:
- Mock Google Sign-In with 2-second loading simulation
- No external API keys or Firebase configuration required
- User data persisted locally using SharedPreferences
- Authentication state maintained across app restarts

## Development Guidelines

### Code Style
- Uses Flutter lints (`package:flutter_lints/flutter.yaml`)
- Material Design 3 principles
- Korean language UI text
- Error handling with user-friendly SnackBar messages

### Testing
- Basic widget test structure is present but needs updating for current app functionality
- Current test is outdated (tests for counter app, not note app)
- No unit tests for services currently implemented

### Security Considerations
- Mock authentication for development/demo purposes
- Real Firebase keys should be properly configured before production deployment
- Firestore security rules need implementation for production use

## Development Workflow

1. **Setup**: Run `flutter pub get` to install dependencies
2. **Development**: Use `flutter run -d web-server --web-port=8080` for web development
3. **Testing**: Update and run tests with `flutter test`
4. **Analysis**: Use `flutter analyze` to check for code issues
5. **Platform Testing**: Test on different platforms using platform-specific run commands

## Known Issues

- Widget tests are outdated and need updating for current app functionality
- Android development requires accepting Android licenses (`flutter doctor --android-licenses`)
- Android Studio not installed (IntelliJ IDEA and VS Code are available alternatives)