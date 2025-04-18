import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/images/images.dart';

class HomeImageCarousel extends StatelessWidget {
  const HomeImageCarousel({
    super.key,
    required this.dotWidgets,
    this.imagePath,
    required this.name,
  });
  final List<DotWidget> dotWidgets;
  final String? imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildSaleCard(imagePath ?? ''),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: dotWidgets,
            ),
          ),
        ),
        // const SizedBox(height: 5),
        // Align(
        //   alignment: Alignment.topLeft,
        //   child: Text(
        //     description ?? 'Daily Drops | Bestsellers | Special Prices',
        //     style: TextStyle(color: Colors.white, fontSize: 12),
        //   ),
        // ),
      ],
    );
  }

  Widget buildSaleCard(String imagePath) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          // shape: BoxShape.circle,
          color: Colors.red[50],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imagePath == ''
                ? AssetImage(Images.foodImage)
                : AssetImage(
                    imagePath,
                  ),
          )),
      // child: const Placeholder(), // Replace with ClipOval and actual image
    );
  }

  Widget buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
