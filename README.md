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

---

## 🚀 Complete Setup Guide for Beginners

This guide assumes you have **ZERO** experience with Flutter or mobile development. Follow each step carefully!

### Part 1: Installing Flutter and Development Tools

#### Step 1.1: Install Flutter SDK

Choose your operating system:

**For Windows:**
1. Download Flutter from: https://docs.flutter.dev/get-started/install/windows
2. Extract the downloaded ZIP file to `C:\src\flutter` (create the folder if needed)
3. Add Flutter to your PATH:
   - Search for "Environment Variables" in Windows
   - Click "Environment Variables"
   - Under "User variables", find "Path" and click "Edit"
   - Click "New" and add `C:\src\flutter\bin`
   - Click "OK" on all windows
4. Open Command Prompt and run: `flutter doctor`

**For macOS:**
1. Open Terminal
2. Install Homebrew (if not installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
3. Install Flutter:
   ```bash
   brew install --cask flutter
   ```
4. Verify installation:
   ```bash
   flutter doctor
   ```

**For Linux (Ubuntu/Debian):**
1. Open Terminal
2. Download Flutter:
   ```bash
   cd ~/
   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz
   tar xf flutter_linux_3.16.0-stable.tar.xz
   ```
3. Add to PATH (add this to `~/.bashrc` or `~/.zshrc`):
   ```bash
   export PATH="$PATH:$HOME/flutter/bin"
   ```
4. Reload shell:
   ```bash
   source ~/.bashrc
   ```
5. Run: `flutter doctor`

#### Step 1.2: Install Android Studio (for Android development)

1. Download Android Studio: https://developer.android.com/studio
2. Install Android Studio
3. Open Android Studio
4. Go to: **File → Settings → Plugins** (or **Android Studio → Preferences → Plugins** on Mac)
5. Search for "Flutter" and install the Flutter plugin
6. Also install the "Dart" plugin
7. Restart Android Studio

#### Step 1.3: Set up Android SDK

1. In Android Studio, go to: **File → Settings → Appearance & Behavior → System Settings → Android SDK**
2. Under "SDK Platforms" tab, check:
   - Android 14.0 (API 34)
   - Android 13.0 (API 33)
3. Under "SDK Tools" tab, check:
   - Android SDK Build-Tools
   - Android SDK Command-line Tools
   - Android Emulator
   - Android SDK Platform-Tools
4. Click "Apply" and let it download

#### Step 1.4: Accept Android Licenses

Open Terminal/Command Prompt and run:
```bash
flutter doctor --android-licenses
```
Type `y` and press Enter for each license.

#### Step 1.5: Install Xcode (for iOS development - Mac only)

1. Open App Store on your Mac
2. Search for "Xcode" and install it (this takes a while - it's ~15GB)
3. Open Xcode once installed
4. Accept the license agreement
5. Install additional components when prompted
6. Open Terminal and run:
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```
7. Install CocoaPods:
   ```bash
   sudo gem install cocoapods
   ```

#### Step 1.6: Verify Installation

Run this command to check if everything is set up:
```bash
flutter doctor
```

You should see green checkmarks ✓ for:
- Flutter
- Android toolchain
- Xcode (Mac only)
- Android Studio

---

### Part 2: Setting Up the Pocket Puff Project

#### Step 2.1: Clone the Repository

```bash
# Navigate to where you want to store the project
cd ~/Documents  # or wherever you prefer

# Clone the repository
git clone https://github.com/gizipp/pocket-puff.git
cd pocket-puff
```

#### Step 2.2: Install Project Dependencies

```bash
flutter pub get
```

This downloads all the required packages listed in `pubspec.yaml`.

#### Step 2.3: Create the Audio File

1. Navigate to the `assets/audio/` folder
2. You need to create a file named `mindful.mp3`
3. The audio should contain a robotic voice saying: **"You. Are. Blowing. At. A. Phone. This. Is. Very. Relaxing."**

**Easy ways to create this:**
- Use online TTS: https://ttsmaker.com/ (select a robotic voice)
- Use Google Cloud TTS: https://cloud.google.com/text-to-speech
- Record yourself and use a robot voice effect in Audacity (free software)

Save the file as `mindful.mp3` in the `assets/audio/` folder.

---

### Part 3: Testing Locally

You have two options: use an emulator or a real device.

#### Option A: Testing on Android Emulator

**Step 3A.1: Create an Android Emulator**

1. Open Android Studio
2. Click on **Device Manager** (phone icon on the right sidebar)
3. Click **"Create Device"**
4. Select a phone model (e.g., Pixel 7)
5. Click **Next**
6. Select a system image (e.g., API 34 - Tiramisu) and download it
7. Click **Next**, then **Finish**

**Step 3A.2: Start the Emulator**

1. In Android Studio Device Manager, click the ▶️ Play button next to your emulator
2. Wait for the emulator to boot (this takes 1-2 minutes the first time)

**Step 3A.3: Run the App**

Open Terminal/Command Prompt in your project folder:
```bash
flutter run
```

Flutter will detect the running emulator and install the app automatically!

#### Option B: Testing on Real Android Device

**Step 3B.1: Enable Developer Mode on Your Phone**

1. On your Android phone, go to **Settings → About Phone**
2. Tap **"Build Number"** 7 times until it says "You are now a developer"
3. Go back to **Settings → System → Developer Options**
4. Enable **"USB Debugging"**

**Step 3B.2: Connect Your Phone**

1. Connect your phone to your computer with a USB cable
2. On your phone, allow USB debugging when prompted
3. In Terminal, run:
   ```bash
   flutter devices
   ```
   You should see your device listed

**Step 3B.3: Run the App**

```bash
flutter run
```

The app will install and launch on your phone!

#### Option C: Testing on iOS Simulator (Mac only)

**Step 3C.1: Open iOS Simulator**

```bash
open -a Simulator
```

Or open Xcode → Window → Devices and Simulators → Click ▶️ next to a device

**Step 3C.2: Run the App**

```bash
flutter run
```

**Note**: Microphone doesn't work in iOS Simulator! You need a real device for full testing.

#### Option D: Testing on Real iPhone (Mac only)

**Step 3D.1: Set up Apple Developer Account**

1. Open Xcode
2. Go to Xcode → Preferences → Accounts
3. Click **+** and sign in with your Apple ID (free account works for testing)

**Step 3D.2: Configure Project**

1. Open the project in Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```
2. Select the "Runner" project in the left panel
3. Go to **"Signing & Capabilities"**
4. Select your Apple ID team
5. Change the Bundle Identifier to something unique (e.g., `com.yourname.pocketpuff`)

**Step 3D.3: Trust Developer Certificate**

1. Connect your iPhone
2. On iPhone: Settings → General → VPN & Device Management
3. Trust your developer certificate

**Step 3D.4: Run the App**

```bash
flutter run
```

---

### Part 4: Debugging and Testing

#### View Logs in Real-Time

While the app is running:
```bash
flutter logs
```

#### Hot Reload (Make changes without restarting)

While `flutter run` is active:
- Press `r` to hot reload (applies code changes instantly)
- Press `R` to hot restart (full restart)
- Press `q` to quit

#### Common Testing Tasks

**Test microphone:**
- Blow into your phone's microphone
- Clouds should appear
- Try different volumes (soft vs loud puffs)

**Test shake:**
- Shake your device
- All clouds should disappear

**Test audio:**
- Tap the brain icon 🧠
- You should hear the robotic voice

#### Check for Errors

```bash
flutter analyze
```

This checks your code for potential issues.

---

### Part 5: Building Release Versions

#### Building for Android

**Step 5.1: Build APK (easiest)**

```bash
flutter build apk --release
```

The APK will be at: `build/app/outputs/flutter-apk/app-release.apk`

You can now:
- Send this APK to friends via email/WhatsApp
- Install it directly on Android devices
- Test it before publishing to Play Store

**Step 5.2: Build App Bundle (for Play Store)**

```bash
flutter build appbundle --release
```

The bundle will be at: `build/app/outputs/bundle/release/app-release.aab`

#### Building for iOS

**Step 5.1: Build for Release**

```bash
flutter build ios --release
```

**Step 5.2: Create Archive in Xcode**

1. Open Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```
2. Select **"Any iOS Device"** as the target
3. Go to **Product → Archive**
4. Wait for archiving to complete

---

### Part 6: Publishing to App Stores

#### Publishing to Google Play Store

**Step 6.1: Create Google Play Developer Account**

1. Go to: https://play.google.com/console
2. Sign up (one-time $25 fee)
3. Complete account setup

**Step 6.2: Create App Signing Key**

Generate a keystore:
```bash
keytool -genkey -v -keystore ~/pocket-puff-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias pocket-puff
```

Follow the prompts to set a password.

**Step 6.3: Configure Signing**

Create `android/key.properties`:
```properties
storePassword=YOUR_PASSWORD
keyPassword=YOUR_PASSWORD
keyAlias=pocket-puff
storeFile=/path/to/pocket-puff-key.jks
```

Edit `android/app/build.gradle` and add before `android {`:
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

In the `android {` block, add:
```gradle
signingConfigs {
    release {
        keyAlias keystoreProperties['keyAlias']
        keyPassword keystoreProperties['keyPassword']
        storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
        storePassword keystoreProperties['storePassword']
    }
}
buildTypes {
    release {
        signingConfig signingConfigs.release
    }
}
```

**Step 6.4: Build Signed App Bundle**

```bash
flutter build appbundle --release
```

**Step 6.5: Upload to Play Console**

1. Go to Google Play Console
2. Click **"Create app"**
3. Fill in app details:
   - Name: Pocket Puff
   - Category: Entertainment
   - Free app
4. Complete all required sections:
   - App content (questionnaire)
   - Privacy policy (or select "doesn't collect data")
   - Target audience
5. Go to **Production → Create new release**
6. Upload the `.aab` file from `build/app/outputs/bundle/release/`
7. Add release notes
8. Click **Review release** → **Start rollout to Production**

**Step 6.6: Wait for Review**

Google typically reviews apps within 1-3 days.

#### Publishing to Apple App Store

**Step 6.1: Join Apple Developer Program**

1. Go to: https://developer.apple.com/programs/
2. Enroll ($99/year)
3. Wait for approval (can take 1-2 days)

**Step 6.2: Create App in App Store Connect**

1. Go to: https://appstoreconnect.apple.com/
2. Click **"My Apps"** → **"+"** → **"New App"**
3. Fill in:
   - Platform: iOS
   - Name: Pocket Puff
   - Primary Language: English
   - Bundle ID: (select from dropdown)
   - SKU: pocketpuff
   - User Access: Full Access
4. Click **Create**

**Step 6.3: Fill in App Information**

1. Upload screenshots (use iOS Simulator and take screenshots)
2. Add app description:
   ```
   Pocket Puff is a fun anti-mindfulness app that lets you blow clouds onto
   your phone screen! Use your microphone to create clouds and shake your
   device to clear them. Perfect for when you're bored!
   ```
3. Add keywords: cloud, puff, entertainment, toy, mindfulness, relaxing
4. Set category: Entertainment
5. Set age rating: 4+

**Step 6.4: Upload Build**

1. In Xcode, select **Product → Archive**
2. When done, click **Distribute App**
3. Select **App Store Connect**
4. Click **Upload**
5. Follow prompts

**Step 6.5: Submit for Review**

1. In App Store Connect, go to your app
2. Select the build you just uploaded
3. Complete all required information
4. Click **Submit for Review**

**Step 6.6: Wait for Review**

Apple typically reviews within 24-48 hours.

---

### Part 7: Troubleshooting

#### Problem: `flutter` command not found

**Solution:**
- Restart your terminal
- Check if Flutter is in your PATH (see Step 1.1)
- Run: `export PATH="$PATH:[PATH_TO_FLUTTER]/flutter/bin"`

#### Problem: Android licenses not accepted

**Solution:**
```bash
flutter doctor --android-licenses
```
Type `y` for all prompts.

#### Problem: No devices detected

**Solution:**
- For emulator: Start it in Android Studio first
- For real device: Enable USB Debugging (see Part 3)
- Run: `flutter devices` to list available devices

#### Problem: App crashes on real device

**Solution:**
- Check if microphone permission is granted
- View logs: `flutter logs`
- Build in debug mode first: `flutter run`

#### Problem: CocoaPods not working (iOS)

**Solution:**
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter run
```

#### Problem: Build fails on iOS

**Solution:**
- Update CocoaPods: `sudo gem install cocoapods`
- Clean build: `flutter clean`
- Try again: `flutter build ios`

#### Problem: APK too large

**Solution:**
Build separate APKs per architecture:
```bash
flutter build apk --split-per-abi
```

#### Problem: Microphone not working in emulator

**Solution:**
- Emulators have limited microphone support
- Test on a real device for microphone functionality
- In Android Emulator settings, try configuring virtual microphone

---

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

## 🎮 How to Use the App

1. **Launch the app** - You'll see a beautiful blue sky
2. **Grant permissions** - Allow microphone and motion sensor access
3. **Blow into your phone** - Watch clouds appear and drift across the sky
4. **Shake your device** - Clear all clouds at once
5. **Tap the brain icon** - Hear the "mindful" message

## 📚 Useful Resources for Beginners

- **Flutter Documentation**: https://docs.flutter.dev/
- **Flutter Codelabs**: https://docs.flutter.dev/codelabs
- **Dart Language Tour**: https://dart.dev/guides/language/language-tour
- **Flutter YouTube Channel**: https://www.youtube.com/flutterdev
- **Stack Overflow**: https://stackoverflow.com/questions/tagged/flutter

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

## 💡 Quick Reference Commands

```bash
# Check Flutter installation
flutter doctor

# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Build Android APK
flutter build apk --release

# Build Android App Bundle
flutter build appbundle --release

# Build iOS
flutter build ios --release

# View logs
flutter logs

# Analyze code
flutter analyze

# Clean build files
flutter clean

# List connected devices
flutter devices
```

---

**Note**: This is an offline app with no analytics, no ads, and no data collection. Just pure, simple entertainment.

**Support**: For issues, check the Troubleshooting section above or create an issue on GitHub.
