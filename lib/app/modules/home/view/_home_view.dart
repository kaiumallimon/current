import 'package:blur/blur.dart';
import 'package:current/app/core/constants/_assets.dart';
import 'package:current/app/core/constants/_sizes.dart';
import 'package:current/app/core/widgets/_custom_shimmer.dart';
import 'package:current/app/data/models/home/_category_model.dart';
import 'package:current/app/modules/home/controller/_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'sections/_home_categories.dart';
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
                return SizedBox(
                  height: 35, // Define fixed height
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: CustomShimmer(
                          height: 35,
                          width: 80,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                );
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
                      child: buildHomeCategories(categories, index, theme, () {
                        // Handle category tap
                      }),
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
