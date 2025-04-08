// For items in Navigation Row
import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  final String label;
  final String count;

  const NavigationItem({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {/* Handle Navigation */},
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 2),
              Text(count,
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}
