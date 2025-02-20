import 'package:current/app/core/constants/_sizes.dart';
import 'package:current/app/core/widgets/_custom_shimmer.dart';
import 'package:current/app/data/models/home/_category_model.dart';
import 'package:current/app/modules/account/controller/_account_controller.dart';
import 'package:current/app/modules/home/controller/_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/home/_banner_model.dart';
import 'sections/_home_banner_slider.dart';
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
          // refresh the home page
          await controller.refreshHome();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.paddingSide, vertical: 10),
          child: Column(
            spacing: 15,
            children: [
              // Header
              homeHeader(theme),
              // Body
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                          List<CategoryModel> categories =
                              controller.categories;

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
                                child: buildHomeCategories(
                                    categories, index, theme, () {
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

                          return buildHomeBannerSlider(banners, theme, context);
                        }
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row homeHeader(ColorScheme theme) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                color: theme.onSurface.withOpacity(.5),
                fontSize: 17,
              ),
            ),
            Text('${Get.find<AccountController>().userData['name']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: theme.onSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ],
        )
      ],
    );
  }
}
