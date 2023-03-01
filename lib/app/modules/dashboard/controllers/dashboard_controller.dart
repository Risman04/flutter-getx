import 'dart:convert';

import 'package:get/get.dart';
import 'package:project_ujikom/app/data/profile_response.dart';
import 'package:get/get_connect/connect.dart';
import '../../../data/entertainment_response.dart';
import '../../../data/headline_response.dart';
import '../../../data/sports_response.dart';
import '../../../data/technology_response.dart';
import '../../../data/profile_response.dart';
import '../../../utils/api.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  final _getConnect = GetConnect();

  Future<HeadlineResponse> getHeadline() async {
    final response = await _getConnect.get(BaseUrl.headline);
    return HeadlineResponse.fromJson(jsonDecode(response.body));
  }

  Future<entertainment_response> getEntertainment() async {
    final response = await _getConnect.get(BaseUrl.entertainment);
    return entertainment_response.fromJson(jsonDecode(response.body));
  }

  Future<sports_response> getSports() async {
    final response = await _getConnect.get(BaseUrl.sports);
    return sports_response.fromJson(jsonDecode(response.body));
  }
  
  Future<technology_response> getTechnology() async {
    final response = await _getConnect.get(BaseUrl.technology);
    return technology_response.fromJson(jsonDecode(response.body));
  }

  Future<ProfileResponse> getProfile() async {
    final response = await _getConnect.get(BaseUrl.profile);
    return ProfileResponse.fromJson(
    jsonDecode(response.body) as Map<String, dynamic>);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
