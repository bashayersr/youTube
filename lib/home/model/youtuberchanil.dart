// ignore_for_file: public_member_api_docs, sort_constructors_first
//chanel information

import 'package:youtube/home/model/defualt.dart';
import 'package:youtube/home/model/statistics.dart';

class Youtuber {
   Snippet snippet;
  Statistics statistics;
  Youtuber({
    required this.snippet,
    required this.statistics,
  });
   factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
        snippet: Snippet.fromJson(json["snippet"]),
        statistics: Statistics.fromJson(json["statistics"]),
      );
}
