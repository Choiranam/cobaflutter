import 'package:cobaflutter/models/country_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteCountries = <Country>[].obs;

  void addFavorite(Country country) {
    favoriteCountries.add(country);
  }

  void removeFavorite(Country country) {
    favoriteCountries.remove(country);
  }
}
