// ignore_for_file: public_member_api_docs, sort_constructors_first

// like and dislike information 
//information about one video
class Statistics {
  String viewCount;
  String likeCount;
  String dislikeCount;
  String favoriteCount;
  String commentCount;
  String subscriberCount;
  Statistics({
    required this.viewCount,
    required this.likeCount,
    required this.dislikeCount,
    required this.favoriteCount,
    required this.commentCount,
    required this.subscriberCount,
  });
  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"],
        dislikeCount: json["dislikeCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
        subscriberCount: json["subscriberCount"],
      );
  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "dislikeCount": dislikeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
      };
}






