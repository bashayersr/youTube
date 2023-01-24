// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Default {
  var url;
  var width;
  var height;
  Default({
    this.url,
    this.width,
    this.height,
  });

  Map<String, dynamic> toJson() {
    return {
      'url': this.url,
      'width': this.width,
      'height': this.height,
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
  var thumbnailsDefault;
  var medium;
  var high;
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
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
  var channelId;
  var title;
  var description;
  var channelTitle;
  var liveBroadcastContent;
  Snippet({
    required this.thumbnails,
    required this.publishedAt,
    required this.publishTime,
    this.channelId,
    this.title,
    this.description,
    this.channelTitle,
    this.liveBroadcastContent,
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
        "publishedAt": this.publishedAt.toIso8601String(),
        "channelId": this.channelId,
        "title": this.title,
        "description": this.description,
        "thumbnails": this.thumbnails.toJson(),
        "channelTitle": this.channelTitle,
        "liveBroadcastContent": this.liveBroadcastContent,
        "publishTime": this.publishTime.toIso8601String(),
      };
}

class Id {
  var kind;
  var videoId;
  Id({
    this.kind,
    this.videoId,
  });

  Map<String, dynamic> toJson() => {
        "kind": this.kind,
        "videoId": this.videoId,
      };

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json["kind"],
        videoId: json["videoId"],
      );
}

class Video {
  var kind;
  var etag;
  Id id;
  Snippet snippet;
  Video({
    this.kind,
    this.etag,
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
  var totalResults;
  var resultsPerPage;
  var nextPagetoken;
  List<Video> items; // هذا يستقبل لسته الفيديوات

  YoutubeVideoResult(
      {this.totalResults,
      this.resultsPerPage,
      this.nextPagetoken,
      required this.items});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalResults: int.parse(json["totalResults"]),
          resultsPerPage: json["resultsPerPage"],
          nextPagetoken: json["nextPageToken"],
          items: List<Video>.from(
              json["items"].map((data) => Video.fromJson(data)))

          // items:List.of(json["items"])
          // .map((i) =>i )
          //  .toList(),
          );
}
