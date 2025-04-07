import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/images/images.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/product_category.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/text_field_hint.dart';

class EcommerceHomePage extends StatefulWidget {
  const EcommerceHomePage({
    super.key,
    this.categoryOnTap,
  });
  final VoidCallback? categoryOnTap;

  @override
  State<EcommerceHomePage> createState() => _EcommerceHomePageState();
}

class _EcommerceHomePageState extends State<EcommerceHomePage> {
  List<String> categories = ["All", "Women", "Kids", "Men", "Curve", "Home"];
  String selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderSection(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 50,
                color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                      child: CategoriesNavBar(
                        selectedCategory: selectedCategory,
                        categories: categories,
                        categoryIconOnTap: widget.categoryOnTap,
                        categoryOnTap: (string) => setState(() {
                          selectedCategory = string;
                        }),
                      ),
                    ),
                    GestureDetector(
                        onTap: widget.categoryOnTap,
                        child: const Icon(Icons.menu, color: Colors.white))
                  ],
                ),
              ),
              TopCarousel(
                backgroundColor: Colors.red,
              ),
              ShippingAndPromoSection(),
              CouponRow(),
              CategoryCircles(),
              ProductCategories(),
              SuperDealsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.mail_outline, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  const Icon(Icons.search, color: Colors.white70),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 30,
                    // width: 200,
                    child: VerticalTextCarousel(texts: [
                      "Shoes",
                      "Bags",
                      "Phones",
                      "Accessories",
                      "Clothes",
                      "Electronics",
                      "Beauty",
                    ]),
                  ),
                  const Spacer(),
                  const Icon(Icons.camera_alt_outlined, color: Colors.white70),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.favorite_border, color: Colors.white),
        ],
      ),
    );
  }
}

class CategoriesNavBar extends StatelessWidget {
  const CategoriesNavBar({
    super.key,
    required this.categoryIconOnTap,
    required this.categories,
    required this.selectedCategory,
    required this.categoryOnTap,
  });
  final VoidCallback? categoryIconOnTap;
  final void Function(String category) categoryOnTap;
  final List<String> categories;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: categories
            .map(
              (category) => _buildCategoryTab(
                category,
                category == selectedCategory,
                categoryOnTap,
              ),
            )
            .toList());
  }

  Widget _buildCategoryTab(
    String title,
    bool isSelected,
    void Function(String title) onTap,
  ) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 3,
              width: 30,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}

class TopCarousel extends StatelessWidget {
  const TopCarousel({super.key, required this.backgroundColor});
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: 4,
        options: CarouselOptions(
          viewportFraction: 1,
        ),
        itemBuilder: (context, index, ins) {
          return Container(
            height: 200,
            color: backgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildSaleCard(),
                      _buildProductCard(
                          '${4.00}', 'assets/teeth_whitening.png'),
                      _buildProductCard(
                          '${1.70}', 'assets/vegetable_chopper.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(true),
                    _buildDot(false),
                    _buildDot(false),
                    _buildDot(false),
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                  'Daily Drops | Bestsellers | Special Prices',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildSaleCard() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.amber[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'SUPER',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SALE',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(String price, String imagePath) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Center(
              child: Placeholder(), // Replace with actual image
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
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

class ShippingAndPromoSection extends StatelessWidget {
  const ShippingAndPromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Free Shipping',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'On orders of \$69.00+',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Icon(Icons.local_shipping, color: Colors.grey[400]),
              ],
            ),
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SALE ZONE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Super coupons every day!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Icon(Icons.sell, color: Colors.grey[400]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CouponRow extends StatelessWidget {
  const CouponRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 80,
      child: Row(
        children: [
          _buildCoupon(
            'GET \$3 OFF',
            'on your first order',
            'CODE: SH3',
            Colors.pink[100]!,
          ),
          _buildCoupon(
            'SPIN TO WIN',
            'Coupons & Points',
            '',
            Colors.pink[100]!,
          ),
          _buildCoupon(
            'BUY \$100 GET',
            '15% OFF',
            'New users only',
            Colors.pink[100]!,
          ),
        ],
      ),
    );
  }

  Widget _buildCoupon(String title, String subtitle, String code, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: title.contains('15%') ? Colors.pink : Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12),
            ),
            if (code.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CategoryCircles extends StatelessWidget {
  const CategoryCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryCircle('Women', 'assets/women.png'),
          _buildCategoryCircle('Curve', 'assets/curve.png'),
          _buildCategoryCircle('Kids', 'assets/kids.png'),
          _buildCategoryCircle('Men', 'assets/men.png'),
          _buildCategoryCircle('Sports', 'assets/sports.png'),
        ],
      ),
    );
  }

  Widget _buildCategoryCircle(String title, String imagePath) {
    return Column(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                Images.tshirtImage,
              ))),
          // child: const Placeholder(), // Replace with ClipOval and actual image
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCategoryWidget(
                title: 'Jewelry &',
                subtitle: 'Accessories',
                imagePath: 'assets/jewelry.png',
              ),
              // ProductCategoryWidget('Tops', '', 'assets/tops.png'),
              // ProductCategoryWidget('Home &', 'Living', 'assets/home.png'),
              // ProductCategoryWidget('Baby &', 'Maternity', 'assets/baby.png'),
              // ProductCategoryWidget('Bottoms', '', 'assets/bottoms.png'),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductCategoryWidget(
                  title: 'Underwear &',
                  subtitle: 'Sleepwear',
                  imagePath: 'assets/underwear.png',
                ),
                ProductCategoryWidget(
                  title: 'Underwear &',
                  subtitle: 'Sleepwear',
                  imagePath: 'assets/underwear.png',
                ),
                ProductCategoryWidget(
                  title: 'Underwear &',
                  subtitle: 'Sleepwear',
                  imagePath: 'assets/underwear.png',
                ),
                ProductCategoryWidget(
                  title: 'Underwear &',
                  subtitle: 'Sleepwear',
                  imagePath: 'assets/underwear.png',
                ),
                ProductCategoryWidget(
                  title: 'Underwear &',
                  subtitle: 'Sleepwear',
                  imagePath: 'assets/underwear.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SuperDealsSection extends StatelessWidget {
  const SuperDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'Super',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.flash_on, color: Colors.orange),
                    Text(
                      'Deals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'View more',
                      style: TextStyle(fontSize: 14),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _buildDealCard('-53%', 'assets/deal1.png'),
                _buildDealCard('-20%', 'assets/deal2.png'),
                _buildDealCard('-35%', 'assets/deal3.png'),
                _buildDealCard('-15%', 'assets/deal4.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDealCard(String discount, String imagePath) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Center(
            child: const Placeholder(), // Replace with actual image
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                discount,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
