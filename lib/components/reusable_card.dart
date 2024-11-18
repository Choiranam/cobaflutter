import 'package:flutter/material.dart';
import '../models/country_model.dart';

class ReusableCard extends StatelessWidget {
  final Country country;
  final VoidCallback onFavoriteToggle;
  final VoidCallback? onDelete;

  const ReusableCard({
    super.key,
    required this.country,
    required this.onFavoriteToggle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(country.flag, width: 50, fit: BoxFit.cover),
        title: Text(country.name),
        subtitle: Text('Capital: ${country.capital}\nLanguages: ${country.languages.join(", ")}'),
        trailing: onDelete == null
            ? IconButton(
                icon: Icon(
                  country.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: country.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: onFavoriteToggle,
              )
            : IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
      ),
    );
  }
}
