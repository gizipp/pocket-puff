**Project Name:** "Pocket Puff"

**Category:** Entertainment / Digital Toy

**Concept:** A 100% offline "anti-mindfulness" app for when users are bored. The app is a single screen (a blue sky) that allows users to "blow" clouds onto it using their phone's microphone and shake them away using the accelerometer.

**Core Features (MVP):**

1. **Main Screen:**  
   * The app consists of only one screen.  
   * The background must be a simple, clean vertical gradient from sky blue (top) to a slightly lighter blue (bottom).  
   * There should be no other major UI elements, menus, or settings.  
2. **Core Mechanic 1: "Puff" (Microphone Input)**  
   * The app must ask for **Microphone permission** on launch.  
   * It must actively listen to the microphone's input **amplitude (volume level)**. It should *not* record audio.  
   * You need to set an audio amplitude threshold to detect a "puff" or "blow" sound from the user.  
   * When a "puff" is detected:  
     * Instantiate a simple, 2D, cartoon-style cloud object (let's call it a "Puff").  
     * The "Puff" should spawn from one side of the screen (e.g., the right side).  
     * It should then drift slowly and horizontally across the screen to the other side before fading out.  
   * *Bonus (if possible):* The **size/scale** of the generated "Puff" cloud should be proportional to the **loudness** (amplitude) of the user's puff.  
3. **Core Mechanic 2: "Shake" (Accelerometer Input)**  
   * The app must use the device's **Accelerometer/Gyroscope**.  
   * It must detect a "shake" gesture.  
   * When the device is shaken, all "Puff" clouds currently visible on the screen must immediately "disperse" (e.g., break into smaller pieces, fade away quickly, or fly off the screen).  
4. **Core Mechanic 3: "The 'Mindful' Button" (Parody)**  
   * There should be one small button in the bottom-right corner. It can use a simple icon like a brain (🧠) or a yoga pose (🧘).  
   * When this button is pressed, the app must play a short, **local/pre-packaged audio file**.  
   * The audio file should be a simple, robotic, monotone voice saying something like: *"You. Are. Blowing. At. A. Phone. This. Is. Very. Relaxing."*

**Technical Requirements:**

* The app must be **100% offline**. No network calls.  
* All assets (audio files, cloud images) must be bundled locally with the app
* Use Flutter ensure UI yang 100% konsisten on iOs and Android

