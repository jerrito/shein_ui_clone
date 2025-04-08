import 'package:flutter/material.dart';

// Assuming MyApp and main() are defined elsewhere if running standalone
// Or integrate this ProfileScreen widget into your existing app navigation

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // State for the bottom navigation bar index if this screen manages it
  // If managed globally (e.g., in HomeScreen), pass the index or use a state management solution

  bool _showTopBanner = true;
  bool _showCouponBanner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No AppBar needed directly on this screen based on the screenshot's content area
      // The app structure might have one, but the scrollable body starts below it.
      backgroundColor: Colors.grey[100], // Light grey background for the page
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Top Notification Banner ---
            _buildTopBanner(),

            // --- Profile Header ---
            _buildProfileHeader(),

            // --- Stats Row (Coupons, Points, Wallet, Gift Card) ---
            _buildStatsRow(),

            // --- Expiring Coupon Banner ---
            _buildCouponBanner(),

            // --- My Orders Section ---
            _buildSectionCard(
              child: Column(
                children: [
                  _buildSectionHeader("My Orders", "View all"),
                  const SizedBox(height: 15),
                  _buildMyOrdersIcons(),
                ],
              ),
            ),

            // --- Navigation Row (Following, Wishlist, History) ---
            _buildSectionCard(
              child: _buildNavigationRow(),
            ),

            // --- Services Row ---
            _buildSectionCard(
              child: _buildServicesRow(),
            ),

            // --- Recommended Products ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
              // You might add a title here if needed like "Recommendations"
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: _ProductCard(
                    imageUrl:
                        "https://via.placeholder.com/150/f5f5f5/000000?text=Sandal", // Placeholder
                    title: "Women Woven Thong San...",
                    tags: ["#1 Bestseller in Slides Women Shoes"],
                    price: "\$9.73",
                    soldCount: "200+ sold",
                    subTag: "High Repeat Customers",
                    discount: "-3%",
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: _ProductCard(
                    imageUrl:
                        "https://via.placeholder.com/150/e0e0e0/000000?text=Heel", // Placeholder
                    title: "2024 New Women Shoes...",
                    tags: [
                      "Trends #Shoe Statement",
                      "#2 Bestseller in White Women He..."
                    ],
                    price: "\$14.50",
                    soldCount: "100+ sold",
                    discount: "-24%",
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20), // Bottom padding
          ],
        ),
      ),
      // Assuming the BottomNavigationBar is part of the main app structure
      // If this screen should display it, include it here:
    );
  }

  // --- Helper Widgets ---

  Widget _buildTopBanner() {
    return Visibility(
      visible: _showTopBanner,
      child: Container(
        color: Colors.blue[50], // Light blue background
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                "Enable notifications for engagement & account permissions & subscriptions.",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {/* Handle Open */},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).primaryColor),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                textStyle: const TextStyle(fontSize: 12),
              ),
              child: const Text("Open"),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 18.0),
              onPressed: () => setState(() => _showTopBanner = false),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.orangeAccent, // Example color
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

  Widget _buildStatsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(Icons.confirmation_number_outlined, "3", "Coupons"),
          _buildStatItem(Icons.monetization_on_outlined, "0", "Points"),
          _buildStatItem(Icons.account_balance_wallet_outlined, null, "Wallet"),
          _buildStatItem(Icons.card_giftcard_outlined, null, "Gift Card"),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String? value, String label) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.black87),
        if (value != null)
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }

  Widget _buildCouponBanner() {
    return Visibility(
      visible: _showCouponBanner,
      child: Container(
        color: Colors.red[50], // Light red background
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                "You have 1 coupon(s) that will expire!",
                style: TextStyle(fontSize: 12.0, color: Colors.red),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, size: 18.0, color: Colors.red),
              onPressed: () => setState(() => _showCouponBanner = false),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required Widget child}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      elevation: 0.5, // Subtle elevation
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        InkWell(
          onTap: () {/* Handle View All / Action */},
          child: Row(
            children: [
              Text(actionText,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMyOrdersIcons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _IconTextItem(icon: Icons.payment_outlined, label: "Unpaid"),
        _IconTextItem(icon: Icons.hourglass_top_outlined, label: "Processing"),
        _IconTextItem(icon: Icons.local_shipping_outlined, label: "Shipped"),
        _IconTextItem(icon: Icons.rate_review_outlined, label: "Review"),
        _IconTextItem(icon: Icons.assignment_return_outlined, label: "Returns"),
      ],
    );
  }

  Widget _buildNavigationRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _NavigationItem(label: "Following", count: "0 following"),
        _NavigationItem(label: "Wishlist", count: "0 item"),
        _NavigationItem(label: "History", count: "0 item"),
      ],
    );
  }

  Widget _buildServicesRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: _IconTextItem(
                icon: Icons.headset_mic_outlined, label: "Customer Service")),
        Expanded(
            child: _IconTextItem(
                icon: Icons.calendar_today_outlined,
                label: "Check In")), // Placeholder icon
        Expanded(
            child: _IconTextItem(
                icon: Icons.poll_outlined,
                label: "Survey Center")), // Placeholder icon
        Expanded(
            child: _IconTextItem(
                icon: Icons.favorite_border_outlined,
                label: "Gals")), // Placeholder icon
        Expanded(
            child: _IconTextItem(
                icon: Icons.share_outlined, label: "Share & Earn")),
      ],
    );
  }
}

// --- Reusable Small Widgets ---

// For items in Stats Row, Orders Row, Services Row
class _IconTextItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconTextItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 26, color: Colors.black87),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11, color: Colors.grey[700]),
        ),
      ],
    );
  }
}

// For items in Navigation Row
class _NavigationItem extends StatelessWidget {
  final String label;
  final String count;

  const _NavigationItem({required this.label, required this.count});

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

// For Product Recommendation Cards
class _ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final List<String> tags;
  final String price;
  final String soldCount;
  final String? subTag; // e.g., "High Repeat Customers"
  final String? discount; // e.g., "-24%"

  const _ProductCard({
    required this.imageUrl,
    required this.title,
    required this.tags,
    required this.price,
    required this.soldCount,
    this.subTag,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      clipBehavior: Clip.antiAlias, // Ensures image respects the border radius
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                // Or Image.asset
                imageUrl,
                height: 130, // Adjust height as needed
                width: double.infinity,
                fit: BoxFit.cover,
                // Basic error handling for images
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 130,
                  color: Colors.grey[200],
                  child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.grey)),
                ),
              ),
              // Discount Badge
              if (discount != null)
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(discount!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Tags
                Wrap(
                  // Use Wrap for tags that might span multiple lines
                  spacing: 4.0, // Horizontal space between tags
                  runSpacing: 2.0, // Vertical space between lines of tags
                  children: tags
                      .map((tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.pink[50], // Example tag background
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(tag,
                                style: const TextStyle(
                                    fontSize: 9, color: Colors.pink)),
                          ))
                      .toList(),
                ),
                if (subTag != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.verified_user_outlined,
                          size: 12, color: Colors.orange), // Example icon
                      const SizedBox(width: 4),
                      Text(subTag!,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.orange)),
                    ],
                  ),
                ],
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        Text(
                          soldCount,
                          style:
                              const TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    // Add to cart button/icon
                    InkWell(
                      onTap: () {/* Handle Add to Cart */},
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(Icons.add_shopping_cart_outlined,
                            size: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
