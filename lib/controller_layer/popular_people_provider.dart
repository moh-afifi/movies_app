import 'package:flutter/material.dart';
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
  //----------------------------------------------------------------------------
  PopularPeopleModel tempPopularPeopleModel = PopularPeopleModel();

  bool isPaginationLoading = false;

  changePaginationLoading(bool val) {
    isPaginationLoading = val;
    notifyListeners();
  }

  Future<void> getPaginationPopularPeople(int page) async {
    tempPopularPeopleModel = await _popularPeopleService.getPopularPeople(page:page);
    print('${tempPopularPeopleModel.results?[0]} lllllllllllllllllllllllllllllllll');
    // _popularPeopleModel.results!.addAll(tempPopularPeopleModel.results!);
    notifyListeners();
  }

}
