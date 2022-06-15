import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadio_task/data_layer/models/popular_people_model.dart';
import 'package:squadio_task/data_layer/services/popular_people_service.dart';

class PopularPeopleProvider extends ChangeNotifier {
  final PopularPeopleService _popularPeopleService = PopularPeopleService();

  //----------------------------------------------------------------------------
  PopularPeopleModel _popularPeopleModel = PopularPeopleModel();

  PopularPeopleModel get popularPeopleModel => _popularPeopleModel;
  List<Results>? list = [];

  Future<void> getPopularPeople() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('page', 1);
    _popularPeopleModel = await _popularPeopleService.getPopularPeople(page: 1);
    list = _popularPeopleModel.results!;
    notifyListeners();
  }

  int page = 0;

  //----------------------------------------------------------------------------

  Future<void> getPaginationPopularPeople(int page) async {
    try {
      changePaginationLoading(true);
      notifyListeners();
      _popularPeopleModel = await _popularPeopleService.getPopularPeople(page: page + 1);
      list = list! + _popularPeopleModel.results!;
      changePaginationLoading(false);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  bool isPaginationLoading = false;

  changePaginationLoading(bool val) {
    isPaginationLoading = val;
    notifyListeners();
  }
}
