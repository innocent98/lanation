// To parse this JSON data, do
//
//     final tags = tagsFromJson(jsonString);

class Tags {
  List<TagItem>? data;

  Tags({
    this.data,
  });

  factory Tags.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Tags(data: null);
    }

    return Tags(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => TagItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TagItem {
  int? id;
  String? title;
  String? permalink;
  String? createdAt;
  String? updatedAt;
  String? categorie;
  String? type;
  String? fichier;
  String? date;

  TagItem(
      {this.id,
      this.title,
      this.permalink,
      this.createdAt,
      this.updatedAt,
      this.categorie,
      this.type,
      this.fichier,
      this.date});

  factory TagItem.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return TagItem();
    }

    return TagItem(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      categorie: json['categorie'] as String?,
      type: json['type'] as String?,
      fichier: json['fichier'] as String?,
      date: json['date'] as String?,
    );
  }
}

// single tag
class SingleTag {
  int? id;
  String? title;
  String? permalink;
  String? createdAt;
  String? updatedAt;
  List<Newscast>? newscasts;
  List<dynamic>? documentations;

  SingleTag({
    this.id,
    this.title,
    this.permalink,
    this.createdAt,
    this.updatedAt,
    this.newscasts,
    this.documentations,
  });

  factory SingleTag.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return SingleTag(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      newscasts: (json['newscasts'] as List<dynamic>?)
              ?.map((e) => Newscast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      documentations: json['documentations'] ?? [],
    );
  }
}

class Newscast {
  int? id;
  String? title;
  String? permalink;
  String? content;
  String? type;
  int? inSlider;
  int? public;
  int? deleted;
  int? view;
  int? userId;
  int? moduleId;
  int? fichierId;
  String? createdAt;
  String? updatedAt;
  String? author;
  String? url;
  int? inAlert;
  int? forSubscriber;
  int? duration;
  int? report;
  Pivot? pivot;
  Fichier? fichier;

  Newscast({
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
    this.report,
    this.pivot,
    this.fichier,
  });

  factory Newscast.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Newscast(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      inSlider: json['in_slider'] as int?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      view: json['view'] as int?,
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
      report: json['report'] as int?,
      pivot: Pivot.fromJson(json['pivot'] ?? {}),
      fichier: (json['fichier'] as Map<String, dynamic>?) != null
          ? Fichier.fromJson(json['fichier'])
          : null,
    );
  }
}

class Pivot {
  int? tagId;
  int? newscastId;

  Pivot({
    this.tagId,
    this.newscastId,
  });

  factory Pivot.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Pivot(
      tagId: json['tag_id'] as int?,
      newscastId: json['newscast_id'] as int?,
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
