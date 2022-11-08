

import 'package:dartz/dartz.dart';

import '../core/failures/main_failures.dart';
import 'models/new_and_hot.dart';

abstract class NewAndHotServices {
  Future<Either<MainFailures, NewAndHotResp>> getnewAndHotMovieData();
  Future<Either<MainFailures, NewAndHotResp>> getnewAndHotTvData();
}