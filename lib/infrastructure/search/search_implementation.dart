


import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/core/api_end_points.dart';

import '../../domain/core/failures/main_failures.dart';
import '../../domain/search/models/search_response.dart';
import '../../domain/search/search_services.dart';

@LazySingleton(as: SearchService)
class SearchImplemention extends SearchService {
  @override
  Future<Either<MainFailures, SearchResponse>> searchMovie(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.search,
        queryParameters: {
          'query': movieQuery,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());

        final result = SearchResponse.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}