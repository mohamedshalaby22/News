import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  String baseUrl = 'https://newsapi.org';
  getApiData(String category) async {
    String url =
        '$baseUrl/v2/top-headlines?country=eg&category=$category&apiKey=928319684f894686adf952ac7e4dadf0';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        // print(body);
        return body['articles'];
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  getALLApiData(String value) async {
    String url =
        '$baseUrl/v2/everything?q=$value&apiKey=928319684f894686adf952ac7e4dadf0';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        return body['articles'];
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  getTeslaData() async {
    String url =
        '$baseUrl/v2/everything?q=tesla&from=2022-07-05&sortBy=publishedAt&apiKey=928319684f894686adf952ac7e4dadf0';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        return body['articles'];
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
