import 'package:flutter/material.dart';

class SheinSettingsScreen extends StatelessWidget {
  const SheinSettingsScreen({super.key});

  // Helper function to build consistent ListTile rows
  Widget _buildSettingsTile(
    BuildContext context, // Added context for potential theme access
    String title, {
    Widget? valueWidget, // Widget for the value/indicator before chevron
    VoidCallback? onTap,
    bool dense = false, // Make tile vertically smaller if needed
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 15.5, // Slightly adjusted font size
            color: Colors.black87 // Slightly less intense black
            ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min, // Keep row width compact
        children: [
          if (valueWidget != null) valueWidget, // Display value if provided
          if (valueWidget != null)
            const SizedBox(width: 8), // Space before chevron
          Icon(
            Icons.arrow_forward_ios,
            size: 15, // Smaller chevron icon
            color: Colors.grey[400], // Lighter grey for chevron
          ),
        ],
      ),
      onTap: onTap ??
          () {
            print('$title tapped'); // Default tap action
          },
      dense: dense,
      // Add subtle content padding if needed
      // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Define commonly used text style for trailing values
    final trailingTextStyle = TextStyle(
      fontSize: 14,
      color: Colors.grey[600],
    );

    // Define the small red dot widget
    final redDotIndicator = Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.white, // White AppBar background
        elevation: 0.5, // Subtle elevation or border effect
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // TODO: Implement back navigation
            print('Back button pressed');
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true, // Center title if desired (not strictly in image)
        // Optional: Add explicit bottom border if elevation isn't enough
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(1.0),
        //   child: Container(
        //     color: Colors.grey[300],
        //     height: 1.0,
        //   ),
        // ),
      ),
      body: ListView(
        children: <Widget>[
          // --- Section 1: User ---
          Container(
            color: Colors.white, // White background for tiles
            child: _buildSettingsTile(
              context,
              'jerrito0240',
              valueWidget: Icon(
                Icons.qr_code_scanner, // Using a standard QR icon
                color: Colors.grey[600],
                size: 20,
              ),
              onTap: () {/* Navigate to profile/QR */},
            ),
          ),

          const SizedBox(height: 12), // Space between sections

          // --- Section 2: Account ---
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSettingsTile(
                  context,
                  'Address Book',
                  onTap: () {/* Navigate to Address Book */},
                ),
                _buildSettingsTile(
                  context,
                  'My Payment Options',
                  onTap: () {/* Navigate to Payment Options */},
                ),
                _buildSettingsTile(
                  context,
                  'Manage My Account',
                  valueWidget: redDotIndicator, // Add the red dot here
                  onTap: () {/* Navigate to Account Management */},
                ),
                _buildSettingsTile(
                  context,
                  'Show&Outfit',
                  onTap: () {/* Navigate to Show&Outfit */},
                ),
              ],
            ),
          ),

          const SizedBox(height: 12), // Space between sections

          // --- Section 3: App Settings ---
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSettingsTile(
                  context,
                  'Location',
                  valueWidget: Text('GH', style: trailingTextStyle),
                  onTap: () {/* Open Location Settings */},
                ),
                _buildSettingsTile(
                  context,
                  'Language',
                  onTap: () {/* Open Language Settings */},
                ),
                _buildSettingsTile(
                  context,
                  'Currency',
                  valueWidget: Text('USD', style: trailingTextStyle),
                  onTap: () {/* Open Currency Settings */},
                ),
                _buildSettingsTile(
                  context,
                  'Contact Preferences',
                  onTap: () {/* Open Contact Preferences */},
                ),
                _buildSettingsTile(
                  context,
                  'Blocked Contact List',
                  onTap: () {/* Open Blocked List */},
                ),
                _buildSettingsTile(
                  context,
                  'Clear Cache',
                  valueWidget: Text('131.27MB', style: trailingTextStyle),
                  onTap: () {/* Implement Clear Cache */},
                ),
              ],
            ),
          ),

          const SizedBox(height: 12), // Space between sections

          // --- Section 4: Info/Legal ---
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSettingsTile(
                  context,
                  'Privacy & Cookie Policy',
                  onTap: () {/* Navigate to Privacy Policy */},
                ),
                _buildSettingsTile(
                  context,
                  'Terms & Conditions',
                  onTap: () {/* Navigate to Terms */},
                ),
                _buildSettingsTile(
                  context,
                  'Rating & Feedback',
                  onTap: () {/* Navigate to Rating/Feedback */},
                ),
                _buildSettingsTile(
                  context,
                  'Connect to Us',
                  onTap: () {/* Navigate to Social/Contact */},
                ),
                _buildSettingsTile(
                  context,
                  'Ad Choice',
                  onTap: () {/* Navigate to Ad Choices */},
                ),
              ],
            ),
          ),
          const SizedBox(height: 12), // Optional space at the bottom
        ],
      ),
    );
  }
}
