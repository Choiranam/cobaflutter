class Country {
  final int? id;
  final String name;
  final String flag;
  final String capital;
  final List<String> languages;
  bool isFavorite;

  Country({
    this.id,
    required this.name,
    required this.flag,
    required this.capital,
    required this.languages,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'flag': flag,
      'capital': capital,
      'languages': languages.join(','),
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'],
      name: map['name'],
      flag: map['flag'],
      capital: map['capital'],
      languages: map['languages']?.split(',') ?? [],
      isFavorite: map['isFavorite'] == 1,
    );
  }
}
