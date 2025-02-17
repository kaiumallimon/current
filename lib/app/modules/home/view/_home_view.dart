import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:current/app/core/constants/_assets.dart';
import 'package:current/app/core/constants/_sizes.dart';
import 'package:current/app/core/widgets/_custom_shimmer.dart';
import 'package:current/app/core/widgets/_gradient_bg.dart';
import 'package:current/app/data/models/home/_category_model.dart';
import 'package:current/app/modules/home/controller/_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/home/_banner_model.dart';
import 'sections/_home_categories.dart';
import 'sections/_home_categories_shimmer.dart';
import 'sections/_home_searchbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the HomeController if not already initialized
    final HomeController controller = Get.put(HomeController());

    // Get theme
    final theme = Theme.of(context).colorScheme;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: RefreshIndicator(
        onRefresh: () async {
          controller.refreshHome();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.paddingSide, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              // Search bar
              buildSearchBar(theme),

              // Categories
              Obx(() {
                if (controller.isCategoryLoading.value) {
                  // Show shimmer effect while loading
                  return homeCategoriesShimmer();
                } else {
                  // Show categories
                  List<CategoryModel> categories = controller.categories;

                  if (categories.isEmpty) {
                    return const Center(
                      child: Text("No categories available"),
                    );
                  }

                  return SizedBox(
                    height: 35, // Define fixed height
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 10),
                        child:
                            buildHomeCategories(categories, index, theme, () {
                          // Handle category tap
                        }),
                      ),
                    ),
                  );
                }
              }),

              // Banners
              Obx(() {
                if (controller.isBannerLoading.value) {
                  return CustomShimmer(
                    height: 120,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(20),
                  );
                } else {
                  // Banners
                  List<BannerModel> banners = controller.banners;

                  return CarouselSlider(
                      items: banners
                          .map((banner) => Container(
                                width: double.infinity,
                                height: 250, // Set the height of each banner
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: theme.primary.withOpacity(.3),
                                    width: 1,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      // Background image as full screen
                                      FadeInImage(
                                        placeholder:
                                            NetworkImage(AppAssets.placeholder),
                                        image: NetworkImage(banner.image),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                      // Overlay gradient
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              theme.primary.withOpacity(.2),
                                              Colors.transparent,
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                          ),
                                        ),
                                      ),
                                      // Overlay content
                                      Positioned(
                                        left: 20,
                                        bottom: 20,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              banner.title,
                                              style: TextStyle(
                                                color: theme.onSurface,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    5), // Add some spacing between title and subtitle
                                            Wrap(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.8, // You can adjust the width as needed
                                                  child: Text(
                                                    banner.subtitle,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: theme.onSurface
                                                          .withOpacity(.7),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
