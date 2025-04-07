import 'dart:async';

import 'package:flutter/material.dart';

class VerticalTextCarousel extends StatefulWidget {
  final List<String> texts;
  final Duration duration; // How long each item stays visible
  final Duration animationDuration; // Duration of the slide animation
  final TextStyle? textStyle;
  final Curve curve; // Animation curve

  const VerticalTextCarousel({
    super.key,
    required this.texts,
    this.duration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 500),
    this.textStyle,
    this.curve = Curves.easeInOut, // Default animation curve
  });

  @override
  State<VerticalTextCarousel> createState() => _VerticalTextCarouselState();
}

class _VerticalTextCarouselState extends State<VerticalTextCarousel> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer only if there's more than one text item
    if (widget.texts.length > 1) {
      _startTimer();
    }
  }

  void _startTimer() {
    // Cancel any existing timer
    _timer?.cancel();
    // Create a new periodic timer
    _timer = Timer.periodic(widget.duration, (timer) {
      if (!mounted) {
        timer.cancel(); // Ensure timer stops if widget is disposed
        return;
      }
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.texts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // IMPORTANT: Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Handle empty or single item lists gracefully
    if (widget.texts.isEmpty) {
      return const SizedBox.shrink(); // Return an empty widget
    }
    if (widget.texts.length == 1) {
      return Text(widget.texts[0],
          style: widget.textStyle); // Just display the single text
    }

    return AnimatedSwitcher(
      duration: widget.animationDuration, // Duration of the animation itself
      transitionBuilder: (Widget child, Animation<double> animation) {
        // Create a slide transition
        // Offset(0, 1) means starting from below
        // Offset(0, -1) would mean starting from above
        final slideAnimation = Tween<double>(
          begin: 0, // Start below the view
          end: 1, // End at the center
        ).animate(CurvedAnimation(
                parent: animation, curve: widget.curve) // Apply curve
            );

        // AnimatedSwitcher fades out the old child by default.
        // We only define the slide-in for the new child here.
        return FadeTransition(
          opacity: slideAnimation,
          child: child, // The incoming Text widget
        );
      },
      child: Text(
        // IMPORTANT: Use a unique Key for AnimatedSwitcher to detect change
        widget.texts[_currentIndex],
        key: ValueKey<int>(_currentIndex), // Key changes, triggering animation
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
