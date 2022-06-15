import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../utils/api_handler.dart';
import '../models/popular_people_model.dart';

class PopularPeopleService {
  final _apiHandler = ApiHandler();

  Future<PopularPeopleModel> getPopularPeople({int page = 1}) async {
    PopularPeopleModel popularPeopleModel;
    try {
      final response = await _apiHandler.call(
        method: APIMethod.get,
        path: 'person/popular',
        page: page,
      );

      popularPeopleModel = PopularPeopleModel.fromJson(response);
      print('${popularPeopleModel.results!.length} 0000000000000000000000000');
      return popularPeopleModel;
    } catch (e) {
      return PopularPeopleModel();
    }
  }
}
