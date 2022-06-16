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

  Future<void> getPopularPeople() async {
    _popularPeopleModel = await _popularPeopleService.getPopularPeople(page: 1);
    notifyListeners();
  }

  int page = 1;
  incrementPage(){
    page++;
    notifyListeners();
  }
  //----------------------------------------------------------------------------
  PopularPeopleModel tempPopularPeopleModel = PopularPeopleModel();
  Future<void> getPaginationPopularPeople() async {
    try {
      changePaginationLoading(true);
      notifyListeners();
      incrementPage();
      tempPopularPeopleModel = await _popularPeopleService.getPopularPeople(page: page);
      _popularPeopleModel.results.addAll(tempPopularPeopleModel.results);
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
