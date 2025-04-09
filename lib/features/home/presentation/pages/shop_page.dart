import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shein_ui_clone/assets/svgs.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
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
    required this.categories,
  });
  final VoidCallback? categoryOnTap;
  final List<String> categories;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final CarouselSliderController controller = CarouselSliderController();

  String selectedCategory = 'All';
  int _imageIndex = 0;
  Color redColor = const Color.fromARGB(175, 225, 0, 42);
  Color greenColor = const Color.fromARGB(255, 46, 119, 58);
  Color blueLightColor = const Color.fromARGB(255, 153, 220, 224);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
              toolbarHeight: 55,
              pinned: true,
              collapsedHeight: 60,
              backgroundColor: _imageIndex == 0
                  ? blueLightColor
                  : _imageIndex == 1
                      ? redColor
                      : greenColor,
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
                          ? blueLightColor
                          : _imageIndex == 1
                              ? redColor
                              : greenColor,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      height: 50,
                      color: _imageIndex == 0
                          ? blueLightColor
                          : _imageIndex == 1
                              ? redColor
                              : greenColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Sizes.width(context, 0.86),
                            child: CategoriesNavBar(
                              isCategory: false,
                              selectedCategory: selectedCategory,
                              categories: widget.categories,
                              categoryIconOnTap: widget.categoryOnTap,
                              categoryOnTap: (string) => setState(() {
                                selectedCategory = string;
                              }),
                            ),
                          ),
                          // Spacer(),
                          SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              thickness: 0.5,
                              color: Colors.grey[200],
                            ),
                          ),
                          GestureDetector(
                              onTap: widget.categoryOnTap,
                              child: SvgPicture.asset(Svgs.menuSVG,
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn)
                                  // size: 26,
                                  ))
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
                      height: 170,
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
