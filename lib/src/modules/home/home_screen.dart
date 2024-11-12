import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gsb/src/modules/modules.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.paddingTop),
          child: Column(
            children: [
              const Text(
                'Suivi de vos Frais',
                style: TextStyles.header,
              ),
              const SizedBox(height: AppDimensions.gapMedium),
              CarouselSlider(
                items: [
                  CustomCard(
                    icon: AppIcons.car,
                    text: 'Déplacements',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCarFeesScreen()),
                    ),
                  ),
                  CustomCard(
                    icon: AppIcons.catering,
                    text: 'Restaurations',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCateringFeesScreen()),
                    ),
                  ),
                  CustomCard(
                    icon: AppIcons.hotel,
                    text: 'Hébergements',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddHotelFeesScreen()),
                    ),
                  ),
                  CustomCard(
                    icon: AppIcons.coffee,
                    text: 'Cafés',
                    height: AppDimensions.widgetExtraLargeHeight,
                    width: AppDimensions.widgetWidth,
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCoffeeFeesScreen()),
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
                isBlackBackground: true,
                onPressed: () => (),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
