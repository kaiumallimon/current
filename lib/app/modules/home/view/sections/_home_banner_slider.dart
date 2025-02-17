import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/_assets.dart';
import '../../../../data/models/home/_banner_model.dart';

// Build the home banner slider
// - banners: list of banners
// - theme: color scheme
// - context: build context
// - return: CarouselSlider

CarouselSlider buildHomeBannerSlider(
    List<BannerModel> banners, ColorScheme theme, BuildContext context) {
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
                      sliderImage(banner),
                      // Overlay gradient
                      sliderOverlayGradient(theme),
                      // Overlay content
                      sliderTexts(banner, theme, context),
                    ],
                  ),
                ),
              ))
          .toList(),
      options: sliderOptions());
}

// Helper method to display the overlay gradient
// - primary: theme primary color
// - transparent: transparent

Container sliderOverlayGradient(ColorScheme theme) {
  return Container(
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
  );
}

// Helper method to display the banner image
// - placeholder: network image
// - image: network image
// - fit: cover
FadeInImage sliderImage(BannerModel banner) {
  return FadeInImage(
    placeholder: NetworkImage(AppAssets.placeholder),
    image: NetworkImage(banner.image),
    fit: BoxFit.cover,
    width: double.infinity,
    height: double.infinity,
  );
}

// Helper method to position the texts on the banner
// - title: bold, black
// - subtitle: light, grey

Positioned sliderTexts(
    BannerModel banner, ColorScheme theme, BuildContext context) {
  return Positioned(
    left: 20,
    bottom: 20,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        SizedBox(height: 5), // Add some spacing between title and subtitle
        Wrap(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.8, // You can adjust the width as needed
              child: Text(
                banner.subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: theme.onSurface.withOpacity(.7),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Carousel options:
// - viewportFraction: 1 (full screen)
// - initialPage: 0 (start from the first item)
// - enableInfiniteScroll: true (loop through items)
// - reverse: false (scroll direction)
CarouselOptions sliderOptions() {
  return CarouselOptions(
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
  );
}
