import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mic_stream/mic_stream.dart';
import 'package:shake/shake.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const PocketPuffApp());
}

class PocketPuffApp extends StatelessWidget {
  const PocketPuffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Puff',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PocketPuffScreen(),
    );
  }
}

class PocketPuffScreen extends StatefulWidget {
  const PocketPuffScreen({super.key});

  @override
  State<PocketPuffScreen> createState() => _PocketPuffScreenState();
}

class _PocketPuffScreenState extends State<PocketPuffScreen> {
  final List<CloudPuff> _clouds = [];
  StreamSubscription<List<int>>? _microphoneSubscription;
  ShakeDetector? _shakeDetector;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Microphone settings
  static const int amplitudeThreshold = 25; // Threshold for detecting a puff
  static const int sampleRate = 16000;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _initializeShakeDetector();
  }

  Future<void> _requestPermissions() async {
    final micStatus = await Permission.microphone.request();

    if (micStatus.isGranted) {
      _startListening();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Microphone permission is required for this app to work'),
          ),
        );
      }
    }
  }

  void _startListening() async {
    if (_isListening) return;

    try {
      final stream = await MicStream.microphone(
        audioSource: AudioSource.DEFAULT,
        sampleRate: sampleRate,
        channelConfig: ChannelConfig.CHANNEL_IN_MONO,
        audioFormat: AudioFormat.ENCODING_PCM_16BIT,
      );

      _microphoneSubscription = stream?.listen((samples) {
        // Calculate amplitude from samples
        if (samples.isEmpty) return;

        double sum = 0;
        for (var sample in samples) {
          sum += sample.abs();
        }
        double amplitude = sum / samples.length;

        // Detect puff
        if (amplitude > amplitudeThreshold) {
          _createPuff(amplitude);
        }
      });

      _isListening = true;
    } catch (e) {
      debugPrint('Error starting microphone: $e');
    }
  }

  void _createPuff(double amplitude) {
    // Map amplitude to cloud size (larger amplitude = larger cloud)
    // Normalize amplitude to a reasonable size range
    double normalizedSize = (amplitude / 100).clamp(0.5, 2.5);

    final random = Random();
    final startFromRight = random.nextBool();

    setState(() {
      _clouds.add(CloudPuff(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        size: normalizedSize,
        startFromRight: startFromRight,
        yPosition: random.nextDouble() * 0.7, // Random y position (upper 70% of screen)
      ));
    });

    // Remove cloud after it completes its animation
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          _clouds.removeWhere((cloud) =>
            cloud.id == DateTime.now().millisecondsSinceEpoch.toString());
        });
      }
    });
  }

  void _initializeShakeDetector() {
    _shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () {
        _disperseClouds();
      },
      minimumShakeCount: 2,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  void _disperseClouds() {
    setState(() {
      _clouds.clear();
    });
  }

  Future<void> _playMindfulAudio() async {
    try {
      await _audioPlayer.play(AssetSource('audio/mindful.mp3'));
    } catch (e) {
      debugPrint('Error playing audio: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Audio file not found. Please add mindful.mp3 to assets/audio/'),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _microphoneSubscription?.cancel();
    _shakeDetector?.stopListening();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF87CEEB), // Sky blue
              Color(0xFFB0E0E6), // Lighter blue (powder blue)
            ],
          ),
        ),
        child: Stack(
          children: [
            // Clouds
            ..._clouds.map((cloud) => CloudWidget(cloud: cloud)),

            // Mindful button
            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton(
                onPressed: _playMindfulAudio,
                backgroundColor: Colors.white.withOpacity(0.8),
                child: const Text(
                  '🧠',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CloudPuff {
  final String id;
  final double size;
  final bool startFromRight;
  final double yPosition;

  CloudPuff({
    required this.id,
    required this.size,
    required this.startFromRight,
    required this.yPosition,
  });
}

class CloudWidget extends StatefulWidget {
  final CloudPuff cloud;

  const CloudWidget({super.key, required this.cloud});

  @override
  State<CloudWidget> createState() => _CloudWidgetState();
}

class _CloudWidgetState extends State<CloudWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _positionAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    );

    // Position animation - moves cloud across screen
    _positionAnimation = Tween<double>(
      begin: widget.cloud.startFromRight ? 1.0 : -0.2,
      end: widget.cloud.startFromRight ? -0.2 : 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    // Opacity animation - fades in and out
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 6,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: MediaQuery.of(context).size.width * _positionAnimation.value,
          top: MediaQuery.of(context).size.height * widget.cloud.yPosition,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: CustomPaint(
              size: Size(80 * widget.cloud.size, 50 * widget.cloud.size),
              painter: CloudPainter(),
            ),
          ),
        );
      },
    );
  }
}

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw a simple cartoon cloud using circles
    final width = size.width;
    final height = size.height;

    // Main cloud body
    canvas.drawCircle(Offset(width * 0.3, height * 0.5), height * 0.4, paint);
    canvas.drawCircle(Offset(width * 0.5, height * 0.4), height * 0.45, paint);
    canvas.drawCircle(Offset(width * 0.7, height * 0.5), height * 0.4, paint);

    // Fill gaps
    canvas.drawRect(
      Rect.fromLTWH(width * 0.3, height * 0.5, width * 0.4, height * 0.3),
      paint,
    );
  }

  @override
  bool shouldRepaint(CloudPainter oldDelegate) => false;
}
