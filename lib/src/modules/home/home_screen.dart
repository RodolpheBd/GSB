import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gsb/src/modules/modules.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Déconnexion de Firebase
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginScreen()), // Redirection vers l'écran de connexion
        (route) => false,
      );
    } catch (e) {
      // Gestion des erreurs de déconnexion si nécessaire
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur de déconnexion : ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(
          showBackArrow: true,
          title: 'Suivi de vos Frais',
          onBackArrowPressed: () => _logout(context),
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
                          builder: (context) => const AddCarFeesScreen()),
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
                          builder: (context) => const AddCateringFeesScreen()),
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
                          builder: (context) => const AddHotelFeesScreen()),
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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShowFeesScreen()),
                ),
              ),
            ],
          ),
        ),
      );
}
