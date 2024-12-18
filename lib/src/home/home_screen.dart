import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gsb/src/imports.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final LogoutService _logoutService = LogoutService();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(
          showBackArrow: true,
          title: 'Suivi de vos Frais',
          onLeaveArrowPressed: () => _logoutService.logout(context),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: AppDimensions.gapMedium),
              CarouselSlider(
                items: [
                  CustomCard(
                    icon: AppIcons.car,
                    text: 'Déplacements',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CarFeesScreen()),
                    ),
                  ),
                  CustomCard(
                    icon: AppIcons.catering,
                    text: 'Restaurations',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CateringFeesScreen()),
                    ),
                  ),
                  CustomCard(
                    icon: AppIcons.hotel,
                    text: 'Hébergements',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HotelFeesScreen()),
                    ),
                  ),
                  CustomCard(
                    icon: AppIcons.coffee,
                    text: 'Cafés',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoffeeFeesScreen()),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: AppDimensions.widgetExtraLargeHeight,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlay: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: false,
                  viewportFraction: 0.8,
                ),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomButton(
                text: 'Afficher les Frais',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListFeesScreen()),
                ),
              ),
            ],
          ),
        ),
      );
}
