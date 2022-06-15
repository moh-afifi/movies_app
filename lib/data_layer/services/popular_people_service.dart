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
      return popularPeopleModel;
    } catch (e) {
      return PopularPeopleModel();
    }
  }

}
