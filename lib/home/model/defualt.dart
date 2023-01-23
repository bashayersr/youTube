// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Default {
  String url;
  int width;
  int height;
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory Default.fromJson(Map<String, dynamic> json) {
    return Default(
      url: json['url'] as String,
      width: int.parse(json["width"]),
      height: json["height"],
    );
  }
}

class Thumbnails {
  Default thumbnailsDefault;
  Default medium;
  Default high;
  Thumbnails({
    
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    return Thumbnails(
      thumbnailsDefault: Default.fromJson(json["thumbnailsDefault"]),
      medium: Default.fromJson(json["medium"]),
      high: Default.fromJson(json["high"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "thumbnailsDefault": this.thumbnailsDefault,
      "medium": this.medium,
      "high": this.high,
    };
  }
}

class Snippet {
  Thumbnails thumbnails;
  DateTime publishedAt;
  DateTime publishTime;
  String channelId;
  String title;
  String description;
  String channelTitle;
  String liveBroadcastContent;
  Snippet({
    required this.thumbnails,
    required this.publishedAt,
    required this.publishTime,
    required this.channelId,
    required this.title,
    required this.description,
    required this.channelTitle,
    required this.liveBroadcastContent,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        liveBroadcastContent: json["liveBroadcastContent"],
        publishTime: json["publishTime"] == null
            ? DateTime.now()
            : DateTime.parse(json["publishTime"]),
      );

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toJson(),
        "channelTitle": channelTitle,
        "liveBroadcastContent": liveBroadcastContent,
        "publishTime": publishTime.toIso8601String(),
      };
}

class Id {
  String kind;
  String videoId;
  Id({
    required this.kind,
    required this.videoId,
  });

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json["kind"],
        videoId: json["videoId"],
      );
}

class Video {
  String kind;
  String etag;
  Id id;
  Snippet snippet;
  Video({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: Id.fromJson(json['id']),
      snippet: Snippet.fromJson(json['snippet']),
      kind: json['kind'],
      etag: json['etag'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": this.id,
        "snippet": this.snippet,
        "kind": this.kind,
        "etag": this.etag,
      };
}

class YoutubeVideoResult {
  int totalResults;
  int resultsPerPage;
  String nextPagetoken;
  List<Video> items;  // هذا يستقبل لسته الفيديوات 

  YoutubeVideoResult(
      {required this.totalResults,
      required this.resultsPerPage,
      required this.nextPagetoken,
      required this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalResults: int.parse(json["totalResults"]),
          resultsPerPage: json["resultsPerPage"],
          nextPagetoken: json["nextPageToken"],
          items: List<Video>.from(
              json["items"].map((data) => Video.fromJson(data))));
}
