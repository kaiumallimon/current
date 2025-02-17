import 'package:flutter/material.dart';

import '../../../../core/widgets/_custom_shimmer.dart';

SizedBox homeCategoriesShimmer() {
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
  }