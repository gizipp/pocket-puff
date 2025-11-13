# Pocket Puff 🌬️☁️

A fun, offline "anti-mindfulness" mobile app built with Flutter. Blow clouds onto your screen using your phone's microphone and shake them away with the accelerometer!

## 📱 About

Pocket Puff is a simple, single-screen entertainment app for when you're bored. It's a digital toy that lets you:
- **Blow** clouds onto a blue sky using your microphone
- **Shake** your phone to clear all clouds
- Tap the **"Mindful" button** for a humorous reality check

## ✨ Features

### Core Mechanics

1. **Puff (Microphone Input)**
   - Blow into your phone's microphone to create clouds
   - Cloud size is proportional to the loudness of your puff
   - Clouds drift slowly across the screen before fading away

2. **Shake (Accelerometer)**
   - Shake your device to instantly clear all clouds from the screen
   - Uses device motion sensors for natural interaction

3. **The "Mindful" Button**
   - A small brain icon (🧠) in the bottom-right corner
   - Plays a humorous robotic voice message when tapped
   - Provides comedic commentary on the app experience

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Android Studio / Xcode (for building Android/iOS apps)
- A physical device or emulator with:
  - Microphone support
  - Accelerometer sensor

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd pocket-puff
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Create the audio file**
   - Navigate to `assets/audio/`
   - Follow the instructions in `assets/audio/README.md` to create `mindful.mp3`
   - The audio should be a robotic voice saying: "You. Are. Blowing. At. A. Phone. This. Is. Very. Relaxing."

4. **Run the app**
   ```bash
   flutter run
   ```

   Or build for release:
   ```bash
   # Android
   flutter build apk --release

   # iOS
   flutter build ios --release
   ```

## 📦 Dependencies

The app uses the following Flutter packages:

- `permission_handler` - For requesting microphone permissions
- `mic_stream` - For capturing microphone input
- `sensors_plus` - For accelerometer access
- `shake` - For shake gesture detection
- `audioplayers` - For playing audio files

All dependencies are 100% offline after installation. No network calls are made.

## 🎨 Design

- **Background**: Clean vertical gradient from sky blue (#87CEEB) to powder blue (#B0E0E6)
- **Clouds**: Simple, cartoon-style cloud shapes rendered using Flutter's CustomPaint
- **UI**: Minimal interface with no menus or settings - just the sky and a single button

## 🔒 Permissions

### Android
- `RECORD_AUDIO` - Required for microphone input to detect puffs
- Accelerometer sensor - Required for shake detection

### iOS
- `NSMicrophoneUsageDescription` - Required for microphone access
- `NSMotionUsageDescription` - Required for motion sensor access

Permissions are requested on first launch.

## 🛠️ Technical Details

### Project Structure

```
pocket-puff/
├── lib/
│   └── main.dart           # Main application code
├── android/                # Android-specific configuration
├── ios/                    # iOS-specific configuration
├── assets/
│   └── audio/              # Audio assets directory
├── pubspec.yaml            # Project dependencies
└── README.md               # This file
```

### Key Implementation Details

- **Microphone Threshold**: Set to amplitude > 25 to detect puffs
- **Cloud Animation**: 8-second drift across screen with fade in/out
- **Shake Detection**: Requires 2 shakes within 500ms to trigger
- **Performance**: Uses Flutter's animation system for smooth 60fps rendering

## 🎮 How to Use

1. **Launch the app** - You'll see a beautiful blue sky
2. **Grant permissions** - Allow microphone and motion sensor access
3. **Blow into your phone** - Watch clouds appear and drift across the sky
4. **Shake your device** - Clear all clouds at once
5. **Tap the brain icon** - Hear the "mindful" message

## 🤝 Contributing

This is a simple, fun project! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Share your experience

## 📄 License

This project is open source. See PRD.md for the original product requirements.

## 🎉 Credits

Created as a humorous take on mindfulness apps - because sometimes the best way to relax is to blow at your phone!

---

**Note**: This is an offline app with no analytics, no ads, and no data collection. Just pure, simple entertainment.
