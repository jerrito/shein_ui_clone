import 'package:flutter/material.dart';

class SheinLoginScreen extends StatelessWidget {
  const SheinLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing if needed
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // Use white background for the whole screen
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Make AppBar transparent to blend with the background
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        // Back arrow icon
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
      ),
      body: Padding(
        // Add horizontal padding to the main content
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          // Align children to the center horizontally
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Spacer to push content down a bit from the AppBar
            const SizedBox(height: 20),

            // SHEIN Logo
            const Text(
              'SHEIN',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 5, // Adjust letter spacing to match logo
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 60), // Space below logo

            // "Last Login" label
            Text(
              'Last Login',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 15), // Space below label

            // Profile picture placeholder with Google icon overlay
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                // Main placeholder circle
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.grey[200], // Light grey background
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[400], // Grey icon
                  ),
                ),
                // Small Google 'G' icon overlay
                Container(
                  padding: const EdgeInsets.all(2), // White border effect
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white, // Google uses white bg
                    // In a real app, use Image.asset for the Google logo
                    child: Text(
                      'G',
                      style: TextStyle(
                        color: Colors.blue, // Approximate Google blue
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15), // Space below profile pic

            // Email address
            const Text(
              'jer***240@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500, // Slightly bolder than normal
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30), // Space below email

            // Sign In Button
            SizedBox(
              width: double
                  .infinity, // Make button take full width (within padding)
              height: 50, // Standard button height
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background
                  foregroundColor: Colors.white, // White text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Slight rounding
                  ),
                  elevation: 2, // Subtle shadow
                ),
                onPressed: () {
                  // TODO: Implement Sign In logic
                  print('Sign In button pressed');
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20), // Space below Sign In button

            // Register / Sign in with another account link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                'Register / Sign in with another account',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700], // Dark grey color
                ),
              ),
            ),

            // Spacer to push the "Remove an Account" link to the bottom
            const Spacer(),

            // Remove an Account link
            TextButton(
              onPressed: () {
                // TODO: Implement remove account action
                print('Remove an Account pressed');
              },
              child: Text(
                'Remove an Account',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700], // Dark grey color
                ),
              ),
            ),

            // Padding at the very bottom
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
