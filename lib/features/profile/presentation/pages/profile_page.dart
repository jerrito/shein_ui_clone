import 'package:flutter/material.dart';
import 'package:shein_ui_clone/core/widgets/buttons/default_button.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/icon_text_item.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/navigation_item.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/product_card.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/profile_header.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/section_card.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/service_row.dart';
import 'package:shein_ui_clone/features/profile/presentation/widgets/stats_row.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // --- Top Notification Banner ---
              _buildTopBanner(),

              // --- Profile Header ---
              const ProfileHeader(),

              // --- Stats Row (Coupons, Points, Wallet, Gift Card) ---
              const StatsRowWidget(),

              // --- Expiring Coupon Banner ---
              _buildCouponBanner(),

              // --- My Orders Section ---
              SectionCard(
                  child: Column(
                children: [
                  _buildSectionHeader("My Orders", "View all"),
                  const SizedBox(height: 15),
                  _buildMyOrdersIcons(),
                ],
              )),

              // --- Navigation Row (Following, Wishlist, History) ---
              SectionCard(child: _buildNavigationRow()),

              // --- Services Row ---
              SectionCard(child: ServiceRowWidget()),

              // --- Recommended Products ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                // You might add a title here if needed like "Recommendations"
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ProductCard(
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
                        child: ProductCard(
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
            DefaultButton(
              isProfile: true,
              onPressed: () {},
              text: "Open",
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

  Widget _buildCouponBanner() {
    return Visibility(
      visible: _showCouponBanner,
      child: Container(
        color: Colors.orange[100], // Light red background
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
        IconTextItem(icon: Icons.payment_outlined, label: "Unpaid"),
        IconTextItem(icon: Icons.hourglass_top_outlined, label: "Processing"),
        IconTextItem(icon: Icons.local_shipping_outlined, label: "Shipped"),
        IconTextItem(icon: Icons.rate_review_outlined, label: "Review"),
        IconTextItem(icon: Icons.assignment_return_outlined, label: "Returns"),
      ],
    );
  }

  Widget _buildNavigationRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NavigationItem(label: "Following", count: "0 following"),
        NavigationItem(label: "Wishlist", count: "0 item"),
        NavigationItem(label: "History", count: "0 item"),
      ],
    );
  }
}

// --- Reusable Small Widgets ---

// For items in Stats Row, Orders Row, Services Row

// For Product Recommendation Cards
