import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/category_circles.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/category_nav_bar.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/coupon_discount.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/header_section.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/home_image_carousel.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/home_main_image.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/shipping_promo.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/super_deal.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({
    super.key,
    this.categoryOnTap,
  });
  final VoidCallback? categoryOnTap;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final CarouselSliderController controller = CarouselSliderController();
  List<String> categories = ["All", "Women", "Kids", "Men", "Curve", "Home"];
  String selectedCategory = 'All';
  int _imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
              pinned: true,
              collapsedHeight: 60,
              backgroundColor: _imageIndex == 0
                  ? Colors.blue
                  : _imageIndex == 1
                      ? Colors.red
                      : Colors.green.withValues(alpha: 0.5),
              bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 50),
                  child: SizedBox.shrink()),
              expandedHeight: 102,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    HeaderSection(
                      color: _imageIndex == 0
                          ? Colors.blue.withValues(alpha: 0.3)
                          : _imageIndex == 1
                              ? Colors.red
                              : Colors.green.withValues(alpha: 0.5),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      height: 50,
                      color: _imageIndex == 0
                          ? Colors.blue
                          : _imageIndex == 1
                              ? Colors.red
                              : Colors.green.withValues(alpha: 0.5),
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
                              child:
                                  const Icon(Icons.menu, color: Colors.white))
                        ],
                      ),
                    ),
                    // TopCarousel(
                    //   backgroundColor: Colors.red,
                    // ),
                    // ShippingAndPromoSection(),
                  ],
                ),
              )),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const HeaderSection(),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //   height: 50,
                  //   color: Colors.red,
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: CategoriesNavBar(
                  //           selectedCategory: selectedCategory,
                  //           categories: categories,
                  //           categoryIconOnTap: widget.categoryOnTap,
                  //           categoryOnTap: (string) => setState(() {
                  //             selectedCategory = string;
                  //           }),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //           onTap: widget.categoryOnTap,
                  //           child: const Icon(Icons.menu, color: Colors.white))
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: CarouselSlider.builder(
                          carouselController: controller,
                          itemCount: 3,
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                _imageIndex = index;
                              });
                            },
                            autoPlay: true,
                            viewportFraction: 1,
                          ),
                          itemBuilder: (context, index, ins) {
                            final imagePath =
                                HomeMainImages.values[index].imagePath;
                            final description =
                                HomeMainImages.values[index].description;
                            final name = HomeMainImages.values[index].name;
                            // final backgroundColor = HomeMainImages.values[index].color;
                            // print(backgroundColor);
                            return HomeImageCarousel(
                              name: name,
                              dotWidgets: HomeMainImages.values
                                  .map(
                                    (e) => DotWidget(
                                      isActive: e.name == name,
                                    ),
                                  )
                                  .toList(),
                              imagePath: imagePath,
                              description: description,
                            );
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        const ShippingPromoWidget(),
                        const CouponRow(),
                        const CategoryCircles(),
                        SuperDealsSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
