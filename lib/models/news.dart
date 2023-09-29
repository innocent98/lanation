class News {
  final PrincipalNewscats? principalNewscats;
  final List<AlertInfoNewscasts>? alertInfoNewscasts;
  final List<OverViewNewscasts>? overViewNewscasts;
  final List<InLiveNewscasts>? inLiveNewscasts;
  final List<LatestVideos>? latestVideos;
  final List<LatestNewspapers>? latestNewspapers;
  final List<AllNewscastsByModule>? allnewscastsByModule;

  News({
    this.principalNewscats,
    this.alertInfoNewscasts,
    this.overViewNewscasts,
    this.inLiveNewscasts,
    this.latestVideos,
    this.latestNewspapers,
    this.allnewscastsByModule,
  });

  factory News.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    // Add a null check for 'data'
    if (!json.containsKey('data')) {
      throw ArgumentError('Key data is missing in the JSON');
    }

    final dynamic jsonData = json['data'];

    return News(
      principalNewscats:
          PrincipalNewscats.fromJson(jsonData['principalNewscats']),
      alertInfoNewscasts: (jsonData['alertInfoNewscasts'] as List<dynamic>?)
          ?.map((item) => AlertInfoNewscasts.fromJson(item))
          .toList(),
      overViewNewscasts: (jsonData['overViewNewscasts'] as List<dynamic>?)
          ?.map((item) => OverViewNewscasts.fromJson(item))
          .toList(),
      inLiveNewscasts: (jsonData['inLiveNewscasts'] as List<dynamic>?)
          ?.map((item) => InLiveNewscasts.fromJson(item))
          .toList(),
      latestVideos: (jsonData['latestVideos'] as List<dynamic>?)
          ?.map((item) => LatestVideos.fromJson(item))
          .toList(),
      latestNewspapers: (jsonData['latestNewspapers'] as List<dynamic>?)
          ?.map((item) => LatestNewspapers.fromJson(item))
          .toList(),
      allnewscastsByModule: (jsonData['allnewscastsByModule'] as List<dynamic>?)
          ?.map((item) => AllNewscastsByModule.fromJson(item))
          .toList(),
    );
  }

  get fichier => null;
}

class PrincipalNewscats {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final String? type;
  final int? inSlider;
  final int? public;
  final int? deleted;
  final int? view;
  final int? user_id;
  final int? module_id;
  final int? fichier_id;
  final String? created_at;
  final String? updated_at;
  final String? author;
  final String? url;
  final int? in_alert;
  final int? for_subscriber;
  final int? duration;
  final int? report;
  final Fichier? fichier;
  final Modules? modules;

  PrincipalNewscats({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.type,
    this.inSlider,
    this.public,
    this.deleted,
    this.view,
    this.user_id,
    this.module_id,
    this.fichier_id,
    this.created_at,
    this.updated_at,
    this.author,
    this.url,
    this.in_alert,
    this.for_subscriber,
    this.duration,
    this.report,
    this.fichier,
    this.modules,
  });

  factory PrincipalNewscats.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return PrincipalNewscats(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      inSlider: json['in_slider'] as int?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      view: json['view'] as int?,
      user_id: json['user_id'] as int?,
      module_id: json['module_id'] as int?,
      fichier_id: json['fichier_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      author: json['author'] as String?,
      url: json['url'] as String?,
      in_alert: json['in_alert'] as int?,
      for_subscriber: json['for_subscriber'] as int?,
      duration: json['duration'] as int?,
      report: json['report'] as int?,
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
  final String? type_module;
  final int? id;
  final String? name;
  final String? permalink;

  Modules({
    this.type_module,
    this.id,
    this.name,
    this.permalink,
  });

  factory Modules.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Modules(
      type_module: json['type_module'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      permalink: json['permalink'] as String?,
    );
  }
}

class AlertInfoNewscasts {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final String? type;
  final int? inSlider;
  final int? public;
  final int? deleted;
  final int? view;
  final int? user_id;
  final int? module_id;
  final int? fichier_id;
  final String? created_at;
  final String? updated_at;
  final String? author;
  final String? url;
  final int? in_alert;
  final int? for_subscriber;
  final int? duration;
  final int? report;

  AlertInfoNewscasts({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.type,
    this.inSlider,
    this.public,
    this.deleted,
    this.view,
    this.user_id,
    this.module_id,
    this.fichier_id,
    this.created_at,
    this.updated_at,
    this.author,
    this.url,
    this.in_alert,
    this.for_subscriber,
    this.duration,
    this.report,
  });

  factory AlertInfoNewscasts.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return AlertInfoNewscasts(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      inSlider: json['in_slider'] as int?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      view: json['view'] as int?,
      user_id: json['user_id'] as int?,
      module_id: json['module_id'] as int?,
      fichier_id: json['fichier_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      author: json['author'] as String?,
      url: json['url'] as String?,
      in_alert: json['in_alert'] as int?,
      for_subscriber: json['for_subscriber'] as int?,
      duration: json['duration'] as int?,
      report: json['report'] as int?,
    );
  }
}

class OverViewNewscasts {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final String? type;
  final int? inSlider;
  final int? public;
  final int? deleted;
  final int? view;
  final int? user_id;
  final int? module_id;
  final int? fichier_id;
  final String? created_at;
  final String? updated_at;
  final String? author;
  final String? url;
  final int? in_alert;
  final int? for_subscriber;
  final int? duration;
  final int? report;
  final Fichier? fichier;
  final Modules? modules;

  OverViewNewscasts({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.type,
    this.inSlider,
    this.public,
    this.deleted,
    this.view,
    this.user_id,
    this.module_id,
    this.fichier_id,
    this.created_at,
    this.updated_at,
    this.author,
    this.url,
    this.in_alert,
    this.for_subscriber,
    this.duration,
    this.report,
    this.fichier,
    this.modules,
  });

  factory OverViewNewscasts.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return OverViewNewscasts(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      inSlider: json['in_slider'] as int?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      view: json['view'] as int?,
      user_id: json['user_id'] as int?,
      module_id: json['module_id'] as int?,
      fichier_id: json['fichier_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      author: json['author'] as String?,
      url: json['url'] as String?,
      in_alert: json['in_alert'] as int?,
      for_subscriber: json['for_subscriber'] as int?,
      duration: json['duration'] as int?,
      report: json['report'] as int?,
      fichier: (json['fichier'] as Map<String, dynamic>?) != null
          ? Fichier.fromJson(json['fichier'])
          : null,
      modules: (json['modules'] as Map<String, dynamic>?) != null
          ? Modules.fromJson(json['modules'])
          : null,
    );
  }
}

class InLiveNewscasts {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final String? type;
  final int? inSlider;
  final int? public;
  final int? deleted;
  final int? view;
  final int? user_id;
  final int? module_id;
  final int? fichier_id;
  final String? created_at;
  final String? updated_at;
  final String? author;
  final String? url;
  final int? in_alert;
  final int? for_subscriber;
  final int? duration;
  final int? report;
  final Fichier? fichier;
  final Modules? modules;

  InLiveNewscasts({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.type,
    this.inSlider,
    this.public,
    this.deleted,
    this.view,
    this.user_id,
    this.module_id,
    this.fichier_id,
    this.created_at,
    this.updated_at,
    this.author,
    this.url,
    this.in_alert,
    this.for_subscriber,
    this.duration,
    this.report,
    this.fichier,
    this.modules,
  });

  factory InLiveNewscasts.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return InLiveNewscasts(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      inSlider: json['in_slider'] as int?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      view: json['view'] as int?,
      user_id: json['user_id'] as int?,
      module_id: json['module_id'] as int?,
      fichier_id: json['fichier_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      author: json['author'] as String?,
      url: json['url'] as String?,
      in_alert: json['in_alert'] as int?,
      for_subscriber: json['for_subscriber'] as int?,
      duration: json['duration'] as int?,
      report: json['report'] as int?,
      fichier: (json['fichier'] as Map<String, dynamic>?) != null
          ? Fichier.fromJson(json['fichier'])
          : null,
      modules: (json['modules'] as Map<String, dynamic>?) != null
          ? Modules.fromJson(json['modules'])
          : null,
    );
  }
}

class LatestVideos {
  final int? id;
  final String? link;
  final String? title;
  final int? public;
  final int? user_id;
  final int? module_id;
  final String? created_at;
  final String? updated_at;
  final int? deleted;
  final Modules? modules;

  LatestVideos({
    this.id,
    this.link,
    this.title,
    this.public,
    this.user_id,
    this.module_id,
    this.created_at,
    this.updated_at,
    this.deleted,
    this.modules,
  });

  factory LatestVideos.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return LatestVideos(
      id: json['id'] as int?,
      link: json['link'] as String?,
      title: json['title'] as String?,
      public: json['public'] as int?,
      user_id: json['user_id'] as int?,
      module_id: json['module_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      deleted: json['deleted'] as int?,
      modules: (json['modules'] as Map<String, dynamic>?) != null
          ? Modules.fromJson(json['modules'])
          : null,
    );
  }
}

class LatestNewspapers {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final int? public;
  final int? deleted;
  final String? published_at;
  final int? download;
  final int? view;
  final int? user_id;
  final int? module_id;
  final int? fichier_id;
  final String? created_at;
  final String? updated_at;
  final int? for_subscriber;
  final int? file;
  final int? encode;

  LatestNewspapers({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.public,
    this.deleted,
    this.published_at,
    this.download,
    this.view,
    this.user_id,
    this.module_id,
    this.fichier_id,
    this.created_at,
    this.updated_at,
    this.for_subscriber,
    this.file,
    this.encode,
  });

  factory LatestNewspapers.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return LatestNewspapers(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      published_at: json['published_at'] as String?,
      download: json['download'] as int?,
      view: json['view'] as int?,
      user_id: json['user_id'] as int?,
      module_id: json['module_id'] as int?,
      fichier_id: json['fichier_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      for_subscriber: json['for_subscriber'] as int?,
      file: json['file'] as int?,
      encode: json['encode'] as int?,
    );
  }
}

class AllNewscastsByModule {
  final int? id;
  final String? name;
  final String? type_module;
  final int? public;
  final int? deleted;
  final int? user_id;
  final String? created_at;
  final String? updated_at;
  final int? fichier_id;
  final String? permalink;
  final List<Newscasts>? newscasts;

  AllNewscastsByModule({
    this.id,
    this.name,
    this.type_module,
    this.public,
    this.deleted,
    this.user_id,
    this.created_at,
    this.updated_at,
    this.fichier_id,
    this.permalink,
    this.newscasts,
  });

  factory AllNewscastsByModule.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return AllNewscastsByModule(
      id: json['id'] as int?,
      name: json['name'] as String?,
      type_module: json['type_module'] as String?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      user_id: json['user_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      fichier_id: json['fichier_id'] as int?,
      permalink: json['permalink'] as String?,
      newscasts: (json['newscasts'] as List<dynamic>?)
          ?.map((item) => Newscasts.fromJson(item))
          .toList(),
    );
  }
}

class Newscasts {
  final int? id;
  final String? title;
  final String? permalink;
  final String? content;
  final String? type;
  final int? inSlider;
  final int? public;
  final int? deleted;
  final int? view;
  final int? user_id;
  final int? module_id;
  final int? fichier_id;
  final String? created_at;
  final String? updated_at;
  final String? author;
  final String? url;
  final int? in_alert;
  final int? for_subscriber;
  final int? duration;
  final int? report;
  final Fichier? fichier;

  Newscasts({
    this.id,
    this.title,
    this.permalink,
    this.content,
    this.type,
    this.inSlider,
    this.public,
    this.deleted,
    this.view,
    this.user_id,
    this.module_id,
    this.fichier_id,
    this.created_at,
    this.updated_at,
    this.author,
    this.url,
    this.in_alert,
    this.for_subscriber,
    this.duration,
    this.report,
    this.fichier,
  });

  factory Newscasts.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Input map cannot be null');
    }

    return Newscasts(
      id: json['id'] as int?,
      title: json['title'] as String?,
      permalink: json['permalink'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      inSlider: json['in_slider'] as int?,
      public: json['public'] as int?,
      deleted: json['deleted'] as int?,
      view: json['view'] as int?,
      user_id: json['user_id'] as int?,
      module_id: json['module_id'] as int?,
      fichier_id: json['fichier_id'] as int?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      author: json['author'] as String?,
      url: json['url'] as String?,
      in_alert: json['in_alert'] as int?,
      for_subscriber: json['for_subscriber'] as int?,
      duration: json['duration'] as int?,
      report: json['report'] as int?,
      fichier: (json['fichier'] as Map<String, dynamic>?) != null
          ? Fichier.fromJson(json['fichier'])
          : null,
    );
  }
}
