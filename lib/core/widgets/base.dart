import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/svgs.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
import 'package:shein_ui_clone/core/widgets/bottom_navbar.dart';
import 'package:shein_ui_clone/core/widgets/floating_action_widget.dart';
import 'package:shein_ui_clone/features/cart/presentation/pages/cart.dart';
import 'package:shein_ui_clone/features/category/presentation/pages/category_page.dart';
import 'package:shein_ui_clone/features/home/presentation/pages/shop_page.dart';
import 'package:shein_ui_clone/features/profile/presentation/pages/profile_page.dart';
import 'package:shein_ui_clone/features/trends/presentation/pages/trends_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SheinAppBase extends StatefulWidget {
  final int currentIndex;
  const SheinAppBase({
    super.key,
    required this.currentIndex,
  });

  @override
  State<SheinAppBase> createState() => _SheinAppBaseState();
}

class _SheinAppBaseState extends State<SheinAppBase> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Scr
  int currentIndex = 0;
  bool isScrolling = false, isDone = false;
  bool? hasPadding = false;
  List<Widget> pages = [];

  @override
  void dispose() {
    // controller.removeListener(listener);
    super.dispose();
  }

  // bool hide(bool value) {
  //  await Future.delayed(Duration(milliseconds: 300), () {
  //     value != value;
  //     return value;
  //   });
  //   //return value;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      key: scaffoldKey,
      body: IndexedStack(index: currentIndex, children: pages),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionWidget(
        isActive: currentIndex == 2,
        onTap: () => setState(() {
          currentIndex = 2;
        }),
      ),
      bottomNavigationBar: BottomNav(
        //backgroundColor: isScrolling? Colors.transparent : VacanciesColors.baseWhite,
        pages: pages,
        onTap: (index) {
          currentIndex = index!;

          setState(() {});
        },
        items: NavItems.values
            .map(
              (e) => barItem(
                e.image!,
                e.label!,
                // navBar(context, e.label),
                e.indexGet == currentIndex,
                e.indexGet == 2,
                e.indexGet == 1,
                e.selectedIcon,
              ),
            )
            .toList(),
        currentIndex: currentIndex,
      ),
    );
  }

  navigateToCategories() {
    // print("object");
    setState(() {
      currentIndex = 1;
    });
  }

  @override
  void initState() {
    currentIndex = widget.currentIndex;

    // pages
    pages = [
      ShopPage(
          categoryOnTap: () => navigateToCategories(), categories: categories),
      CategoryPage(categories: categories),
      const TrendsPage(),
      Cart(
        categoryOnTap: () => navigateToCategories(),
      ),
      const ProfilePage(),
    ];

    super.initState();
  }

  List<String> categories = [
    "All",
    "Women",
    "Shoes",
    "Kids",
    "Men",
    "Curve",
    "Home",
    "Jewelry & Accs",
    "Lingerie & Sleep",
    "Bags",
    "Sports",
    "Electronics",
    "Toys",
    "Office",
    "Appliances",
    "Pets",
  ];
// nav bar item
  BottomNavigationBarItem barItem(String svg, String label, bool isSelected,
          bool isTrend, bool isCategory, String? iconData) =>
      BottomNavigationBarItem(
        icon: isTrend
            ? SizedBox(
                width: 50,
              )
            : !isSelected || isCategory
                ? SvgPicture.asset(
                    svg,
                    width: Sizes.height(context, 0.024),
                    height: Sizes.height(context, 0.024),
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? Colors.black
                          : Colors.black.withValues(alpha: 0.5),
                      isSelected ? BlendMode.srcIn : BlendMode.dstOut,
                    ),
                  )
                : SvgPicture.asset(
                    iconData ?? svg,
                    width: Sizes.height(context, 0.024),
                    height: Sizes.height(context, 0.024),
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? Colors.black
                          : Colors.black.withValues(alpha: 0.5),
                      isSelected ? BlendMode.srcIn : BlendMode.dstOut,
                    ),
                  ),
        label: label,
      );
}

enum NavItems {
  shop(
    image: Svgs.shopSVG,
    label: "Shop",
    indexGet: 0,
    selectedIcon: Svgs.homeFilledSVG,
  ),
  category(
    image: Svgs.categorySVG,
    label: "Category",
    indexGet: 1,
  ),
  trends(
    image: Svgs.categorySVG,
    label: "",
    indexGet: 2,
  ),
  cart(
    image: Svgs.cartSVG,
    label: "Cart",
    indexGet: 3,
    selectedIcon: Svgs.shopFilledSVG,
  ),
  profile(
    image: Svgs.profileSVG,
    label: "Me",
    indexGet: 4,
    selectedIcon: Svgs.userFilledSVG,
  ),
  ;

  final String? image, label, selectedIcon;
  final int indexGet;

  const NavItems({
    this.image,
    required this.label,
    required this.indexGet,
    this.selectedIcon,
  });
}
