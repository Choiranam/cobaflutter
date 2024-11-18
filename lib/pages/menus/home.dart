import 'package:cobaflutter/components/reusable_app_bar.dart';
import 'package:cobaflutter/components/reusable_card.dart';
import 'package:cobaflutter/controllers/country_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final CountryController controller = Get.put(CountryController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Home',
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: Obx(() {
        if (controller.countries.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.countries.length,
          itemBuilder: (context, index) {
            final country = controller.countries[index];
            return ReusableCard(
              country: country,
              onFavoriteToggle: () {
                controller.toggleFavorite(country);
                Get.snackbar(
                  country.isFavorite
                      ? 'Added to Favorites'
                      : 'Removed from Favorites',
                  country.isFavorite
                      ? '${country.name} has been added to your favorites.'
                      : '${country.name} has been removed from your favorites.',
                  snackPosition: SnackPosition.TOP,
                );
              },
            );
          },
        );
      }),
    );
  }
}
