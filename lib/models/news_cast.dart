class NewsData {
  final int? currentPage;
  final List<NewsItem>? data;

  NewsData({
    this.currentPage,
    this.data,
  });

  factory NewsData.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return NewsData(
      currentPage: json['data']['current_page'],
      data: (json['data']['data'] as List?)
          ?.map((item) => NewsItem.fromJson(item))
          .toList(),
    );
  }
}

class NewsItem {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final String? type;
  final int? view;
  final String? author;
  final int? duration;
  final Fichier? fichier;
  final Modules? modules;
  final String? created_at;

  NewsItem({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.type,
    this.view,
    this.author,
    this.duration,
    this.fichier,
    this.modules,
    this.created_at,
  });

  factory NewsItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return NewsItem(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      view: json['view'] as int?,
      author: json['author'] as String?,
      duration: json['duration'] as int?,
      created_at: json['created_at'] as String?,
      fichier: (json['fichier'] as Map<String, dynamic>?) != null
          ? Fichier.fromJson(json['fichier'])
          : null,
      modules: (json['modules'] as Map<String, dynamic>?) != null
          ? Modules.fromJson(json['modules'])
          : null,
    );
  }
}

class Fichier {
  final int? id;
  final String? path;
  final String? source;

  Fichier({
    this.id,
    this.path,
    this.source,
  });

  factory Fichier.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Fichier(
      id: json['id'] as int?,
      path: json['path'] as String?,
      source: json['source'] as String?,
    );
  }
}

class Modules {
  final String? typeModule;
  final int? id;
  final String? name;
  final String? permalink;

  Modules({
    this.typeModule,
    this.id,
    this.name,
    this.permalink,
  });

  factory Modules.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Modules(
      typeModule: json['type_module'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      permalink: json['permalink'] as String?,
    );
  }
}
