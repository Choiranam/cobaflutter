import 'package:get/get.dart';
import '../models/country_model.dart';
import '../services/api_service.dart';

class CountryController extends GetxController {
  final ApiService apiService = ApiService();

  var countries = <Country>[].obs;

  var favorites = <Country>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      final data = await apiService.fetchCountries();
      countries.assignAll(data);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch countries: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void toggleFavorite(Country country) {
    country.isFavorite = !country.isFavorite;
    if (country.isFavorite) {
      favorites.add(country);
    } else {
      favorites.removeWhere((item) => item.name == country.name);
    }
    countries.refresh();
    favorites.refresh();
  }

  void removeFavorite(Country country) {
    country.isFavorite = false;
    favorites.removeWhere((item) => item.name == country.name);
    countries.refresh();
    favorites.refresh();
  }
}
