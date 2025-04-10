import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shein_ui_clone/assets/svgs.dart';
import 'package:shein_ui_clone/core/media_query_size.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/category_circles.dart';
import 'package:shein_ui_clone/features/home/presentation/widgets/category_nav_bar.dart';
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
  final ScrollController _scrollController = ScrollController();
  bool _showCompact = false;
  String selectedCategory = 'All';
  int _imageIndex = 0;
  Color redColor = const Color.fromARGB(192, 246, 69, 79);
  Color greenColor = const Color.fromARGB(255, 193, 220, 234);
  Color blueLightColor = const Color.fromARGB(255, 181, 207, 236);
  Color skyColor = const Color.fromARGB(255, 64, 137, 206);
  void _scrollListener() {
    print("na${_scrollController.offset}");
    if (_scrollController.offset > 120 && !_showCompact) {
      setState(() => _showCompact = true);
    } else if (_scrollController.offset <= 120 && _showCompact) {
      setState(() => _showCompact = false);
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  getColor(int imageIndex) {
    switch (imageIndex) {
      case 0:
        return greenColor;
      case 1:
        return redColor;
      case 2:
        return skyColor;
      case 3:
        return blueLightColor;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SafeArea(
        child: CustomScrollView(controller: _scrollController, slivers: [
          SliverAppBar(
              toolbarHeight: 55,
              pinned: true,
              collapsedHeight: 60,
              backgroundColor: getColor(_imageIndex),
              bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 50),
                  child: SizedBox.shrink()),
              expandedHeight: 102,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    HeaderSection(
                      iconColor: _scrollController.hasClients && _showCompact
                          ? Colors.black
                          : null,
                      isCategory: false,
                      color: !_scrollController.hasClients
                          ? getColor(_imageIndex)
                          : _showCompact
                              ? Colors.white
                              : getColor(_imageIndex),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        right: 8,
                        top: 8,
                        bottom: 8,
                      ),
                      height: 50,
                      color: !_scrollController.hasClients
                          ? getColor(_imageIndex)
                          : _showCompact
                              ? Colors.white
                              : getColor(_imageIndex),

                      // : getColor(_imageIndex),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Sizes.width(context, 0.86),
                            child: CategoriesNavBar(
                              isCategory:
                                  _scrollController.hasClients && _showCompact,
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
                              color:
                                  _scrollController.hasClients && _showCompact
                                      ? Colors.black
                                      : Colors.grey[200],
                            ),
                          ),
                          GestureDetector(
                              onTap: widget.categoryOnTap,
                              child: SvgPicture.asset(Svgs.menuSVG,
                                  colorFilter: ColorFilter.mode(
                                      _scrollController.hasClients &&
                                              _showCompact
                                          ? Colors.black
                                          : Colors.white,
                                      BlendMode.srcIn)
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
                      height: 160,
                      width: double.infinity,
                      child: CarouselSlider.builder(
                          carouselController: controller,
                          itemCount: HomeMainImages.values.length,
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
                            );
                          })),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        const ShippingPromoWidget(),
                        // const CouponRow(),
                        const CategoryCircles(),
                        SuperDealsSection(),
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
