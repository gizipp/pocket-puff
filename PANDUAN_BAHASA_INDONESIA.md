# Pocket Puff - Panduan Lengkap Bahasa Indonesia 🇮🇩

Panduan lengkap untuk pemula yang ingin membuat dan mempublikasikan aplikasi mobile Pocket Puff.

## 📱 Apa itu Pocket Puff?

Aplikasi mobile sederhana dan lucu di mana Anda bisa "meniup" awan ke layar ponsel menggunakan mikrofon, dan menghapusnya dengan menggoyangkan ponsel!

---

## 🚀 Bagian 1: Instalasi Flutter (Pertama Kali)

### Windows

1. **Download Flutter**
   - Kunjungi: https://docs.flutter.dev/get-started/install/windows
   - Download file ZIP Flutter
   - Extract ke `C:\src\flutter`

2. **Tambahkan Flutter ke PATH**
   - Ketik "Environment Variables" di pencarian Windows
   - Klik "Edit the system environment variables"
   - Klik "Environment Variables"
   - Di bagian "User variables", cari "Path" lalu klik "Edit"
   - Klik "New" dan masukkan: `C:\src\flutter\bin`
   - Klik OK di semua jendela

3. **Cek Instalasi**
   - Buka Command Prompt
   - Ketik: `flutter doctor`
   - Lihat apa yang perlu diperbaiki (akan ada tanda X merah)

### macOS

1. **Install Homebrew** (jika belum punya)
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Flutter**
   ```bash
   brew install --cask flutter
   ```

3. **Cek Instalasi**
   ```bash
   flutter doctor
   ```

### Linux (Ubuntu/Debian)

1. **Download Flutter**
   ```bash
   cd ~/
   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.0-stable.tar.xz
   tar xf flutter_linux_3.16.0-stable.tar.xz
   ```

2. **Tambahkan ke PATH**
   - Edit file `~/.bashrc`:
   ```bash
   nano ~/.bashrc
   ```
   - Tambahkan di akhir file:
   ```bash
   export PATH="$PATH:$HOME/flutter/bin"
   ```
   - Simpan (Ctrl+X, Y, Enter)
   - Reload:
   ```bash
   source ~/.bashrc
   ```

3. **Cek Instalasi**
   ```bash
   flutter doctor
   ```

---

## 🛠️ Bagian 2: Instalasi Android Studio

### Semua Platform (Windows/Mac/Linux)

1. **Download Android Studio**
   - Kunjungi: https://developer.android.com/studio
   - Download dan install

2. **Install Flutter Plugin**
   - Buka Android Studio
   - Pergi ke **File → Settings** (Windows/Linux) atau **Android Studio → Preferences** (Mac)
   - Klik **Plugins**
   - Cari "Flutter" dan klik **Install**
   - Cari "Dart" dan klik **Install**
   - Restart Android Studio

3. **Install Android SDK**
   - Di Android Studio, buka **File → Settings → Appearance & Behavior → System Settings → Android SDK**
   - Tab "SDK Platforms": centang **Android 14.0 (API 34)**
   - Tab "SDK Tools": centang semua yang penting:
     - Android SDK Build-Tools
     - Android SDK Command-line Tools
     - Android Emulator
     - Android SDK Platform-Tools
   - Klik **Apply** dan tunggu download selesai (bisa lama!)

4. **Terima Lisensi Android**
   ```bash
   flutter doctor --android-licenses
   ```
   - Ketik `y` untuk semua pertanyaan

5. **Cek Lagi**
   ```bash
   flutter doctor
   ```
   - Sekarang bagian Android harusnya sudah centang hijau ✓

---

## 📱 Bagian 3: Setup iOS (Khusus Mac)

Jika Anda pakai Mac dan ingin bikin app untuk iPhone:

1. **Install Xcode dari App Store**
   - Buka App Store
   - Cari "Xcode"
   - Klik Install (ukuran ~15GB, butuh waktu lama!)

2. **Setup Xcode**
   - Buka Xcode setelah selesai install
   - Terima license agreement
   - Install komponen tambahan yang diminta

3. **Setup Command Line Tools**
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

4. **Install CocoaPods**
   ```bash
   sudo gem install cocoapods
   ```

5. **Cek Flutter Doctor**
   ```bash
   flutter doctor
   ```
   - Xcode harusnya sudah centang hijau ✓

---

## 💻 Bagian 4: Setup Proyek Pocket Puff

### 4.1: Clone Proyek

```bash
# Masuk ke folder Documents (atau folder lain yang Anda mau)
cd ~/Documents

# Clone repository
git clone https://github.com/gizipp/pocket-puff.git

# Masuk ke folder proyek
cd pocket-puff
```

### 4.2: Install Dependencies

```bash
flutter pub get
```

Tunggu sampai selesai download semua package yang dibutuhkan.

### 4.3: Buat File Audio

1. Buka folder `assets/audio/`
2. Anda perlu membuat file bernama `mindful.mp3`
3. Isinya: suara robot yang bilang **"You. Are. Blowing. At. A. Phone. This. Is. Very. Relaxing."**

**Cara mudah membuat audio:**
- Pakai website TTS (Text-to-Speech): https://ttsmaker.com/
  - Pilih bahasa English
  - Pilih suara yang robot/monoton
  - Ketik teks di atas
  - Download sebagai MP3
- Atau pakai Google Translate, play audio, lalu rekam
- Atau rekam sendiri dengan suara robot

Simpan file sebagai `mindful.mp3` di folder `assets/audio/`

---

## 📲 Bagian 5: Testing di Emulator/HP Anda

### Opsi A: Test Pakai Emulator Android

**Langkah 1: Buat Emulator**

1. Buka Android Studio
2. Klik icon **Device Manager** (icon HP di sidebar kanan)
3. Klik **"Create Device"**
4. Pilih model HP (contoh: Pixel 7)
5. Klik **Next**
6. Pilih system image (contoh: API 34 - Tiramisu) dan download
7. Klik **Next**, lalu **Finish**

**Langkah 2: Jalankan Emulator**

1. Di Device Manager, klik tombol ▶️ di samping emulator Anda
2. Tunggu emulator nyala (1-2 menit pertama kali)

**Langkah 3: Run App**

Buka Terminal/Command Prompt di folder proyek:
```bash
flutter run
```

App akan otomatis terinstall dan jalan di emulator!

### Opsi B: Test Pakai HP Android Asli (Direkomendasikan!)

**Langkah 1: Aktifkan Developer Mode**

1. Di HP Android Anda, buka **Settings → About Phone**
2. Tap **"Build Number"** 7 kali sampai muncul "You are now a developer"
3. Kembali ke **Settings → System → Developer Options**
4. Nyalakan **"USB Debugging"**

**Langkah 2: Sambungkan HP ke Komputer**

1. Sambungkan HP ke komputer pakai kabel USB
2. Di HP, izinkan USB debugging (tap OK pada popup)
3. Di komputer, buka Terminal dan ketik:
   ```bash
   flutter devices
   ```
   - HP Anda harus muncul di list

**Langkah 3: Run App**

```bash
flutter run
```

App akan terinstall di HP Anda dan langsung jalan!

### Opsi C: Test di iPhone Asli (Khusus Mac)

**Langkah 1: Setup Apple Developer**

1. Buka Xcode
2. Pergi ke **Xcode → Preferences → Accounts**
3. Klik **+** dan login dengan Apple ID Anda (gratis untuk testing)

**Langkah 2: Konfigurasi Proyek**

1. Buka proyek di Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```
2. Klik "Runner" di panel kiri
3. Pergi ke tab **"Signing & Capabilities"**
4. Pilih team Apple ID Anda
5. Ganti Bundle Identifier jadi unik (contoh: `com.namaanda.pocketpuff`)

**Langkah 3: Trust Developer Certificate**

1. Sambungkan iPhone ke Mac
2. Di iPhone: **Settings → General → VPN & Device Management**
3. Tap nama Anda dan tap "Trust"

**Langkah 4: Run App**

```bash
flutter run
```

---

## 🎮 Bagian 6: Testing Fitur App

### Test Microphone (Puff)
1. Tiup mikrofon HP Anda
2. Awan harus muncul di layar
3. Coba tiup pelan dan keras - ukuran awan harus berbeda

### Test Shake
1. Goyang HP Anda
2. Semua awan harus hilang

### Test Audio Button
1. Tap icon otak 🧠 di pojok kanan bawah
2. Harus ada suara robot

### Lihat Log/Error
Kalau ada masalah, lihat log:
```bash
flutter logs
```

---

## 📦 Bagian 7: Build APK untuk Dibagikan

### Build APK Biasa

```bash
flutter build apk --release
```

File APK ada di: `build/app/outputs/flutter-apk/app-release.apk`

**APK ini bisa:**
- Dikirim ke teman via WhatsApp/email
- Diinstall langsung di HP Android
- Dibagikan ke siapa saja tanpa perlu Play Store

### Install APK ke HP

1. Kirim file APK ke HP Anda (via email, Google Drive, dll)
2. Buka file di HP
3. HP akan tanya "Install from unknown source?" - pilih **Yes/Allow**
4. Tap **Install**

---

## 🏪 Bagian 8: Publish ke Play Store (Opsional)

### Langkah 1: Daftar Google Play Developer

1. Buka: https://play.google.com/console
2. Daftar (bayar $25 sekali seumur hidup)
3. Isi data diri dan tunggu approval

### Langkah 2: Buat Signing Key

```bash
keytool -genkey -v -keystore ~/pocket-puff-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias pocket-puff
```

- Isi semua pertanyaan
- **CATAT PASSWORD-NYA!** Jangan sampai lupa!

### Langkah 3: Konfigurasi Signing

Buat file baru `android/key.properties`:
```properties
storePassword=password_anda
keyPassword=password_anda
keyAlias=pocket-puff
storeFile=/Users/namaanda/pocket-puff-key.jks
```

Ganti path sesuai lokasi file JKS Anda.

### Langkah 4: Edit build.gradle

Edit file `android/app/build.gradle`:

Tambahkan di atas baris `android {`:
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

Di dalam blok `android {`, tambahkan:
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

### Langkah 5: Build App Bundle

```bash
flutter build appbundle --release
```

File AAB ada di: `build/app/outputs/bundle/release/app-release.aab`

### Langkah 6: Upload ke Play Console

1. Login ke Google Play Console
2. Klik **"Create app"**
3. Isi info app:
   - Nama: Pocket Puff
   - Bahasa: English (atau Indonesia)
   - App/Game: App
   - Gratis/Berbayar: Gratis
4. Isi semua section yang required:
   - **App content**: isi kuesioner
   - **Privacy policy**: pilih "tidak mengumpulkan data"
   - **Target audience**: All ages
   - **App category**: Entertainment
5. Buat **Production Release**:
   - Upload file `.aab`
   - Isi release notes (contoh: "Initial release")
6. **Review release** → **Start rollout to Production**

### Langkah 7: Tunggu Review

- Google biasanya review 1-3 hari
- Cek email untuk update status
- Kalau ditolak, baca alasan dan perbaiki

---

## 🍎 Bagian 9: Publish ke App Store (Opsional - Khusus Mac)

### Langkah 1: Daftar Apple Developer Program

1. Buka: https://developer.apple.com/programs/
2. Daftar ($99/tahun - mahal!)
3. Tunggu approval (1-2 hari)

### Langkah 2: Buat App di App Store Connect

1. Buka: https://appstoreconnect.apple.com/
2. Klik **"My Apps"** → **"+"** → **"New App"**
3. Isi data:
   - Platform: iOS
   - Name: Pocket Puff
   - Language: English
   - Bundle ID: pilih dari dropdown
   - SKU: pocketpuff

### Langkah 3: Siapkan Screenshot dan Info

1. Screenshot: jalankan app di iOS Simulator, ambil screenshot
2. App description:
   ```
   Pocket Puff adalah aplikasi hiburan unik yang memungkinkan Anda
   "meniup" awan ke layar ponsel menggunakan mikrofon! Goyang HP
   untuk menghapus awan. Sempurna untuk mengisi waktu luang!
   ```
3. Keywords: cloud, puff, entertainment, relax, fun
4. Category: Entertainment
5. Age rating: 4+

### Langkah 4: Build dan Upload

1. Build di Xcode:
   ```bash
   open ios/Runner.xcworkspace
   ```
2. Pilih **"Any iOS Device"** sebagai target
3. **Product → Archive**
4. Setelah selesai, klik **"Distribute App"**
5. Pilih **"App Store Connect"** → **Upload**

### Langkah 5: Submit untuk Review

1. Di App Store Connect, pilih build yang baru diupload
2. Lengkapi semua info yang required
3. **Submit for Review**

### Langkah 6: Tunggu Review

- Apple biasanya review 24-48 jam
- Bisa ditolak kalau ada masalah, baca feedback dan perbaiki

---

## 🐛 Troubleshooting (Masalah Umum)

### "flutter command not found"

**Solusi:**
- Tutup dan buka Terminal lagi
- Cek PATH sudah benar (lihat Bagian 1)
- Restart komputer

### "No devices found"

**Solusi:**
- Emulator: Pastikan sudah jalan di Android Studio
- HP real: Pastikan USB Debugging aktif
- Cek: `flutter devices`

### App crash di HP

**Solusi:**
- Cek permission mikrofon sudah diizinkan
- Lihat log error: `flutter logs`
- Build ulang: `flutter clean` lalu `flutter run`

### Mikrofon tidak work di emulator

**Solusi:**
- Emulator support mikrofon terbatas
- Lebih baik test di HP asli
- Di setting emulator Android, coba enable virtual microphone

### Build error

**Solusi:**
```bash
flutter clean
flutter pub get
flutter run
```

### Error CocoaPods (iOS)

**Solusi:**
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter run
```

---

## 💡 Command Cepat (Cheat Sheet)

```bash
# Cek instalasi Flutter
flutter doctor

# Install dependencies
flutter pub get

# Run app (debug mode)
flutter run

# Build APK (bisa dibagikan)
flutter build apk --release

# Build untuk Play Store
flutter build appbundle --release

# Build iOS
flutter build ios --release

# Lihat device tersambung
flutter devices

# Lihat log/error
flutter logs

# Bersihkan build files
flutter clean

# Cek error di code
flutter analyze
```

---

## 📞 Butuh Bantuan?

- **Flutter Docs**: https://docs.flutter.dev/
- **Stack Overflow**: https://stackoverflow.com/questions/tagged/flutter
- **Flutter Community**: https://flutter.dev/community
- **YouTube Tutorial Flutter Indonesia**: Cari "Flutter tutorial bahasa indonesia"

---

## 🎉 Selamat!

Anda sekarang sudah bisa:
- ✅ Install Flutter dari nol
- ✅ Setup Android Studio dan/atau Xcode
- ✅ Run app di emulator dan HP asli
- ✅ Build APK untuk dibagikan
- ✅ Publish ke Play Store dan App Store

**Good luck dengan Pocket Puff Anda! 🚀**

---

**Catatan Penting:**
- Untuk iOS, HARUS pakai Mac (tidak bisa di Windows/Linux)
- Publish ke App Store butuh $99/tahun
- Publish ke Play Store cuma $25 sekali seumur hidup
- Test selalu di HP asli sebelum publish!
