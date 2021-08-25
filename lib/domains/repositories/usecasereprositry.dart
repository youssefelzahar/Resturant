import 'package:study/core/error/failures.dart';
import 'package:study/domains/entities/UseCaseModel.dart';
import 'package:dartz/dartz.dart';

abstract class AuthReprositry {
  // ignore: non_constant_identifier_names
  Future<Either<Failure, UserDataModel>> getauthofuser(
      String username, useremail, userpassword);
}
