import 'package:cobaflutter/components/reusable_app_bar.dart';
import 'package:cobaflutter/components/reusable_card.dart';
import 'package:cobaflutter/controllers/country_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  final CountryController controller = Get.find();

  Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Favorite',
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final country = controller.favorites[index];
            return ReusableCard(
              country: country,
              onFavoriteToggle: () {},
              onDelete: () {
                Get.dialog(
                  AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text('Do you want to remove ${country.name} from your favorites?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          controller.removeFavorite(country);
                          Get.snackbar(
                            'Removed from Favorites',
                            '${country.name} has been removed from your favorites.',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          Get.back();
                        },
                        child: Text('Yes'),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
