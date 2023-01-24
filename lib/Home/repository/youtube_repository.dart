import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:youtube_clone_app/Home/models/statistics.dart';
import 'package:youtube_clone_app/Home/models/youtube_video_result.dart';
import 'package:youtube_clone_app/Home/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
  }

  Future<YoutubeVideoResult> loadVideos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10000&order=date&type=video&videoDefinition=high&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult> loadGetxVed(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10000&q=getx&order=date&type=video&videoDefinition=high&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult> loadCleanCode(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&q=cleancode&order=date&type=video&videoDefinition=high&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult> loadDart(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&q=dart&order=date&type=video&videoDefinition=high&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult> search(
      String searchKeyword, String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10000&order=date&type=video&videoDefinition=high&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=statistics&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
