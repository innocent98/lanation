class NewsDetails {
  final List<NewsItem> data;

  NewsDetails({required this.data});

  factory NewsDetails.fromJson(List<dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    List<NewsItem> newsItems =
        json.map((item) => NewsItem.fromJson(item)).toList();
    return NewsDetails(data: newsItems);
  }
}

class NewsItem {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final String? type;
  final int? inSlider;
  final int? public;
  final int? deleted;
  final int? view;
  final int? userId;
  final int? moduleId;
  final int? fichierId;
  final String? createdAt;
  final String? updatedAt;
  final String? author;
  final String? url;
  final int? inAlert;
  final int? forSubscriber;
  final int? duration;
  final Fichier? fichier;
  final Modules? modules;
  final List<Comment>? comments;
  final List<Paragraph>? paragraphs;
  final List<Tag>? tags;

  NewsItem({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.type,
    this.inSlider,
    this.public,
    this.deleted,
    this.view,
    this.userId,
    this.moduleId,
    this.fichierId,
    this.createdAt,
    this.updatedAt,
    this.author,
    this.url,
    this.inAlert,
    this.forSubscriber,
    this.duration,
    this.fichier,
    this.modules,
    this.comments,
    this.paragraphs,
    this.tags,
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
      inSlider: json['in_slider'] as int?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      view: json['view'] as int,
      userId: json['user_id'] as int?,
      moduleId: json['module_id'] as int?,
      fichierId: json['fichier_id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      author: json['author'] as String?,
      url: json['url'] as String?,
      inAlert: json['in_alert'] as int?,
      forSubscriber: json['for_subscriber'] as int?,
      duration: json['duration'] as int?,
      fichier: (json['fichier'] as Map<String, dynamic>?) != null
          ? Fichier.fromJson(json['fichier'])
          : null,
      modules: (json['modules'] as Map<String, dynamic>?) != null
          ? Modules.fromJson(json['modules'])
          : null,
      comments: (json['comments'] as List<dynamic>)
          .map((comment) => Comment.fromJson(comment))
          .toList(),
      paragraphs: (json['paragraphs'] as List<dynamic>)
          .map((paragraph) => Paragraph.fromJson(paragraph))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((tag) => Tag.fromJson(tag))
          .toList(),
    );
  }
}

class Fichier {
  final int? id;
  final String? path;
  final String? source;

  Fichier({this.id, this.path, this.source});

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

class Comment {
  final int? id;
  // Add other properties as needed

  Comment({this.id});

  factory Comment.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Comment(
      id: json['id'] as int?,
      // Initialize other properties
    );
  }
}

class Paragraph {
  int? id;
  String? content;
  int? insertion_id;
  String? created_at;
  String? updated_at;
  Pivot? pivot;
  Insertion? insertion;

  Paragraph({
    this.id,
    this.content,
    this.insertion_id,
    this.created_at,
    this.updated_at,
    this.pivot,
    this.insertion,
  });

  factory Paragraph.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Paragraph(
      id: json['id'] as int?,
      content: json['content'] as String?,
      insertion_id: json['insertion_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
      insertion: json['insertion'] != null
          ? Insertion.fromJson(json['insertion'])
          : null,
    );
  }
}

class Pivot {
  int? newscastId;
  int? paragraphId;

  Pivot({
    this.newscastId,
    this.paragraphId,
  });

  factory Pivot.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Pivot(
      newscastId: json['newscast_id'] as int?,
      paragraphId: json['paragraph_id'] as int?,
    );
  }
}

class Insertion {
  int? id;
  int? fichierId;
  int? userId;
  int? isPublic;
  DateTime? start;
  DateTime? end;
  String? name;
  String? content;
  String? link;
  int? isDeleted;
  int? moduleId;
  Fichier? fichier;

  Insertion({
    this.id,
    this.fichierId,
    this.userId,
    this.isPublic,
    this.start,
    this.end,
    this.name,
    this.content,
    this.link,
    this.isDeleted,
    this.moduleId,
    this.fichier,
  });

  factory Insertion.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Insertion(
      id: json['id'] as int?,
      fichierId: json['fichier_id'] as int?,
      userId: json['user_id'] as int?,
      isPublic: json['public'] as int?,
      start: DateTime.tryParse(json['start'] as String? ?? ""),
      end: DateTime.tryParse(json['end'] as String? ?? ""),
      name: json['name'] as String?,
      content: json['content'] as String?,
      link: json['link'] as String?,
      isDeleted: json['deleted'] as int?,
      moduleId: json['module_id'] as int?,
      fichier:
          json['fichier'] != null ? Fichier.fromJson(json['fichier']) : null,
    );
  }
}

class Tag {
  final int? id;
  final String? title;
  final String? permalink;
  final String? created_at;
  final String? updated_at;
  final Pivot? pivot;

  Tag(
      {this.id,
      this.title,
      this.permalink,
      this.created_at,
      this.updated_at,
      this.pivot});

  factory Tag.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Tag(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
    );
  }
}
