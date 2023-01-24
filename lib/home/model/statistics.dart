// ignore_for_file: public_member_api_docs, sort_constructors_first

// like and dislike information
//information about one video
class Statistics {
  var viewCount;
  var likeCount;
  var dislikeCount;
  var favoriteCount;
  var commentCount;
  var subscriberCount;
  Statistics({
    this.viewCount,
    this.likeCount,
    this.dislikeCount,
    this.favoriteCount,
    this.commentCount,
    this.subscriberCount,
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
        "viewCount": this.viewCount,
        "likeCount": this.likeCount,
        "dislikeCount": this.dislikeCount,
        "favoriteCount": this.favoriteCount,
        "commentCount": this.commentCount,
      };
}
