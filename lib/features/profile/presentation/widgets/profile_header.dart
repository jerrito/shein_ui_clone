import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.orange[200], // Example color
            child:
                Text("J", style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("jerrito0240",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(width: 5),
                    // Placeholder for VIP/Level Icon
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(Icons.star,
                            color: Colors.orange, size: 12)),
                  ],
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () {/* Navigate to My Profile Edit */},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("My Profile",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Icon(Icons.edit, size: 14, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Right side Icons (Placeholders)
          IconButton(
            icon: const Icon(Icons.qr_code_scanner), // Example Icon
            onPressed: () {/* Handle QR code */},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined), // Example Icon
            onPressed: () {/* Handle Settings */},
          ),
        ],
      ),
    );
  }
}
