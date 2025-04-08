import 'package:flutter/material.dart';
import 'package:shein_ui_clone/assets/svgs.dart';
import 'package:shein_ui_clone/core/widgets/bottom_navbar.dart';
import 'package:shein_ui_clone/features/cart/presentation/pages/cart.dart';
import 'package:shein_ui_clone/features/category/presentation/pages/category_page.dart';
import 'package:shein_ui_clone/features/home/presentation/pages/shop_page.dart';
import 'package:shein_ui_clone/features/profile/presentation/pages/profile_page.dart';
import 'package:shein_ui_clone/features/trends/presentation/pages/trends_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shein_ui_clone/features/trends/presentation/widgets/trend_icon.dart';

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
                e.image,
                e.label,
                // navBar(context, e.label),
                e.indexGet == currentIndex,
                e.indexGet == 2,
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
        categoryOnTap: () => navigateToCategories(),
      ),
      const CategoryPage(),
      const TrendsPage(),
      const Cart(),
      const ProfilePage(),
    ];

    super.initState();
  }

// nav bar item
  BottomNavigationBarItem barItem(
          String icon, String label, bool isSelected, bool isTrend) =>
      BottomNavigationBarItem(
        icon: isTrend
            ? TrendingWidget(
                text: "Trends",
                size: 45,
                color: Colors.indigoAccent.withValues(
                  alpha: 0.5,
                ),
              )
            : SvgPicture.asset(
                icon,
                // width: Sizes.height(context, 0.028),
                // height: Sizes.height(context, 0.028),
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
  ),
  profile(
    image: Svgs.profileSVG,
    label: "Profile",
    indexGet: 4,
  ),
  ;

  final String image, label;
  final int indexGet;

  const NavItems(
      {required this.image, required this.label, required this.indexGet});
}
