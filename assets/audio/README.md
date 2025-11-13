# Audio Asset

This directory should contain the audio file for the "mindful" button.

## Required File

- **Filename**: `mindful.mp3`
- **Content**: A robotic, monotone voice saying: "You. Are. Blowing. At. A. Phone. This. Is. Very. Relaxing."

## How to Create the Audio File

You can create this audio file using:

1. **Text-to-Speech (TTS) Services**:
   - Use online TTS services like:
     - Google Cloud Text-to-Speech
     - Amazon Polly
     - Microsoft Azure TTS
   - Select a robotic or monotone voice
   - Generate the audio with the text: "You. Are. Blowing. At. A. Phone. This. Is. Very. Relaxing."
   - Add pauses between words for comedic effect

2. **Manual Recording**:
   - Record yourself saying the phrase in a monotone, robotic voice
   - Use audio editing software (Audacity, GarageBand, etc.) to:
     - Add effects to make it sound more robotic
     - Add pauses between words
     - Export as MP3

3. **AI Voice Generators**:
   - Use AI voice generators like ElevenLabs, Play.ht, or similar
   - Choose a robotic voice preset
   - Generate the audio

## Installation

Once you have created `mindful.mp3`:
1. Place it in this directory: `assets/audio/mindful.mp3`
2. The app will automatically detect and use it

## Note

The app will show an error message if this file is missing when you tap the mindful button.
