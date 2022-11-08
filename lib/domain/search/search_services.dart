



import 'package:dartz/dartz.dart';

import '../core/failures/main_failures.dart';
import 'models/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResponse>> searchMovie({
    required String movieQuery,
  });
}