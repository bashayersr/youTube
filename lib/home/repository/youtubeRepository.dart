import 'package:get/get.dart';
import 'package:youtube/home/model/statistics.dart';
import 'package:youtube/home/model/youtuberchanil.dart';

import '../model/defualt.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();
  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com/";
  }

  // method for bring all video
  Future<YoutubeVideoResult?> loadVideo(String nextPageToken) async {
    String url =
        "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=1000&order=date&pageToken=$nextPageToken&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusCode.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      } else {
        print(response.body);
      }
    }
  }

  //this screen will contain getxvideo
  Future<YoutubeVideoResult?> loadGetxvideo(String nextPageToken) async {
    String url =
        "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=1000&order=date&pageToken=$nextPageToken&q=getx&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusCode.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      } else {
        print(response.body);
      }
    }
  }

  //this screen will contain Dart video
  Future<YoutubeVideoResult?> loadDartvideo(String nextPageToken) async {
    String url =
        "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=1000&order=date&pageToken=$nextPageToken&q=dart&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusCode.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      } else {
        print(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> loadCleanCodevideo(String nextPageToken) async {
    String url =
        "youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=1000&order=date&pageToken=$nextPageToken&q=cleancode&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusCode.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      } else {
        print(response.body);
      }
    }
  }

//search
  Future<YoutubeVideoResult?> search(String nextPageToken, q) async {
    String url =
        "youtube/v3/search?part=snippet&maxResults=1000&order=date&pageToken=$nextPageToken&q=$q&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusCode.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      } else {
        print(response.body);
      }
    }
  }

  Future<Statistics?> getVideoInformationById(
      String nextPageToken, vidId) async {
    String url =
        "youtube/v3/videos?part=statistics&id=$vidId&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusCode.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      } else {
        print(response.body);
      }
    }
  }

  Future<Youtuber?> getchannelInformationById(
      String nextPageToken, channelId) async {
    String url =
        "youtube/v3/channels?part=statistics&part=snippet&id=$channelId&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY";

    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusCode.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      } else {
        print(response.body);
      }
    }
  }
}

  //method for fetch data for channel
  //fetch search
  //fetch for video





//this screen will contain cleancode
//channel information

//infromation about video



/**
 

https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=1000&order=date&pageToken=a&q=getx&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY




  //channel
https://youtube.googleapis.com/youtube/v3/channels?part=statistics&part=snippet&id=UCytEtngcIINSMbdc22SrbrQ&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY

//search
https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=1000&order=date&pageToken=a&q=getx&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY

//search gets
https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCytEtngcIINSMbdc22SrbrQ&maxResults=1000&order=date&pageToken=a&q=getx&type=video&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY
 //video 
https://youtube.googleapis.com/youtube/v3/videos?part=snippet&id=umhl2hakkcY&key=AIzaSyBm4aCbKG3aJZiDe1yh1jpzO7GGiqPddpY



 */
