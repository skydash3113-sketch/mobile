

class Game {
  final int? id;
  final String? title;
  final String? thumbnail;
  final String? short_description;
  final String? game_url;
  final String? genre;
  final String? platform;
  final String? publisher;
  final String? developer;
  final String? release_date;
  final String? freetogame_profile_url;

  Game({
    this.id,
    this.title,
    this.thumbnail,
    this.short_description,
    this.game_url,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.release_date,
    this.freetogame_profile_url,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Tanpa Judul',
      thumbnail: json['thumbnail'] ?? '',
      short_description: json['short_description'] ?? '',
      game_url: json['game_url'] ?? '',
      genre: json['genre'] ?? 'Tidak diketahui',
      platform: json['platform'] ?? 'Unknown',
      publisher: json['publisher'] ?? 'Unknown',
      developer: json['developer'] ?? 'Unknown',
      release_date: json['release_date'] ?? '-',
      freetogame_profile_url: json['freetogame_profile_url'] ?? '',
    );
  }
}
