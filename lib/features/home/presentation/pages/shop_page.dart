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
              toolbarHeight: 60,
              pinned: true,
              collapsedHeight: 65,
              backgroundColor: _imageIndex == 0
                  ? const Color.fromARGB(255, 128, 179, 221)
                  : _imageIndex == 1
                      ? const Color.fromARGB(255, 197, 31, 20)
                      : const Color.fromARGB(255, 18, 87, 20),
              bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 50),
                  child: SizedBox.shrink()),
              expandedHeight: 102,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    HeaderSection(
                      isCategory: false,
                      color: _imageIndex == 0
                          ? const Color.fromARGB(255, 128, 179, 221)
                          : _imageIndex == 1
                              ? const Color.fromARGB(255, 197, 31, 20)
                              : const Color.fromARGB(255, 18, 87, 20),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      height: 50,
                      color: _imageIndex == 0
                          ? const Color.fromARGB(255, 128, 179, 221)
                          : _imageIndex == 1
                              ? const Color.fromARGB(255, 197, 31, 20)
                              : const Color.fromARGB(255, 18, 87, 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: CategoriesNavBar(
                              isCategory: false,
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
                  ],
                ),
              )),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                    padding: const EdgeInsets.symmetric(horizontal: 6),
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
