import 'package:dio/dio.dart';
import 'package:forsat/application/classes/common/pagination.dart';
import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/classes/opportunity/opportunities.dart';
import 'package:forsat/application/classes/opportunity/opportunity.dart';
import 'package:forsat/application/forsat_api.dart';
import 'package:forsat/application/storage/local_storage.dart';
import 'package:forsat/application/storage/storage_key.dart';

abstract class OpportunityRepository {
  Future<Opportunities> getAllOpportunities(int page);
}

class OpportunityRepositoryImpl implements OpportunityRepository {
  @override
  Future<Opportunities> getAllOpportunities(int page) async {
    try {
      final response = await ForsatApi.dio.get("/api/opportunity?page=$page",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(TOKEN)}"
          }));
      List _temp = response.data['data'];
      var _meta = response.data['meta'];

      Pagination _pagination = Pagination.fromJson(_meta);
      List<Opportunity> _opportunities = _temp
          .map((opportunity) => Opportunity.fromJson(opportunity))
          .toList();
      print(_opportunities);
      print(_meta);
      return Opportunities(
          pagination: _pagination, opportunities: _opportunities);
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
