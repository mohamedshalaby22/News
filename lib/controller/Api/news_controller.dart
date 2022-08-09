import 'dart:async';
import 'package:best_design/Repository/repo.dart';
import 'package:best_design/models/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var isLoading = false.obs;
  var newsBusiness = <NewsModel>[].obs;
  var newsSports = <NewsModel>[].obs;
  var newshealth = <NewsModel>[].obs;
  var newsscience = <NewsModel>[].obs;
  var teslaNews = <NewsModel>[].obs;
  var allNews = <NewsModel>[].obs;
  var newsSearch = <NewsModel>[].obs;

  var text = TextEditingController();
  NewsApi newsApi = NewsApi();

  ////////////////////////////////
  PageController pageController = PageController();
  late Timer _timer;
  int currentPage = 0;
  @override
  void onInit() {
    _timer = Timer.periodic(const Duration(seconds: 7), (Timer timer) {
      if (currentPage < teslaNews.length) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    });

    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  ////////////////////////////////////////////
  NewsController() {
    getNewsGeneral();
    getNewsBusiness();
    getNewsHealth();
    getNewsSports();
    getNewsScience();
    getNewsSearch();
  }

  getNewsGeneral() async {
    isLoading(true);
    List myList = await newsApi.getApiData('general');
    teslaNews
        .addAll(myList.map<NewsModel>((e) => NewsModel.fromJson(e)).toList());

    isLoading(false);
  }

//////////////////////////////
  getNewsBusiness() async {
    isLoading(true);
    List businessList = await newsApi.getApiData('business');
    newsBusiness.addAll(
        businessList.map<NewsModel>((e) => NewsModel.fromJson(e)).toList());
    isLoading(false);
  }

  ///////////////////////
  getNewsHealth() async {
    isLoading(true);
    List healthList = await newsApi.getApiData('health');
    newshealth.addAll(
        healthList.map<NewsModel>((e) => NewsModel.fromJson(e)).toList());
    isLoading(false);
  }

  /////////////////////
  getNewsSports() async {
    isLoading(true);
    List sportList = await newsApi.getApiData('sports');
    newsSports.addAll(
        sportList.map<NewsModel>((e) => NewsModel.fromJson(e)).toList());
    isLoading(false);
  }

  /////////////////////
  getNewsScience() async {
    isLoading(true);
    List scienceList = await newsApi.getApiData('science');
    newsscience.addAll(
        scienceList.map<NewsModel>((e) => NewsModel.fromJson(e)).toList());
    isLoading(false);
  }

  getNewsSearch() async {
    isLoading(true);
    List searchList = await newsApi.getALLApiData('value');
    allNews.addAll(
        searchList.map<NewsModel>((e) => NewsModel.fromJson(e)).toList());
    isLoading(false);
  }

//SEARCH METHOD
  searchList(String value) {
    newsSearch.value = allNews
        .where((search) => search.title!.toLowerCase().contains(value))
        .toList();
    update();
  }

  clearSearch() {
    text.clear();
    searchList('');
    update();
  }

/////////////////////
  ///CUPERTION SWITCH
  bool swithcValue = false;
  void changeSwitch(bool value) {
    swithcValue = value;
    update();
  }
}
