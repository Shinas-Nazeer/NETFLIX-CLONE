
import '../core/failures/main_failures.dart';
import 'models/downloads.dart';
import 'package:dartz/dartz.dart';

abstract class DownloadServices {
  Future<Either<MainFailures, List<Downloads>>> getDownloadImages();
}