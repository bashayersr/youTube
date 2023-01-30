import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:youtube/Home/models/statistics.dart';
import 'package:youtube/Home/models/video.dart';
import 'package:youtube/Home/models/youtube_video_result.dart';
import 'package:youtube/Home/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
  }

  Future<YoutubeVideoResult?> loadVideos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10000&order=date&type=video&videoDefinition=high&key=AIzaSyBIPcLN8oQusuJptGy98ZPATymcpMCSILA&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
    return null;
  }

  Future<YoutubeVideoResult?> loadGetxVed(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10000&q=getx&order=date&type=video&videoDefinition=high&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> loadCleanCode(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&q=cleancode&order=date&type=video&videoDefinition=high&key=AIzaSyBIPcLN8oQusuJptGy98ZPATymcpMCSILA&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }


  Future<YoutubeVideoResult?> loadDart(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=10000&q=dart&order=date&type=video&videoDefinition=high&key=AIzaSyBIPcLN8oQusuJptGy98ZPATymcpMCSILA";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> search(
      String searchKeyword, String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10000&order=date&type=video&videoDefinition=high&key=AIzaSyBIPcLN8oQusuJptGy98ZPATymcpMCSILA&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
  Future<Statistics?> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=statistics&key=AIzaSyBIPcLN8oQusuJptGy98ZPATymcpMCSILA&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }


  Future<Youtuber?> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
  Future<Video?> getVideoByID(String videoID) async {
    String url =
        "/youtube/v3/videos?part=snippet&key=AIzaSyBIPcLN8oQusuJptGy98ZPATymcpMCSILA&id=$videoID";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(Exception(response.statusText));
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        print(response.body["items"]);
        response.body["items"][0]["id"]={
          "kind": "youtube#video",
          "videoId": response.body["items"][0]["id"]
        };
        print(response.body["items"]);

        print(response.body["items"][0]["id"]["videoId"]);
        return Video.fromJson(response.body["items"][0]);
      }
    }
  }


}


