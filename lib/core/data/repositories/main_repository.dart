import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/errors/exceptions/server_exceptions/server_exceptions.dart';

class MainRepository {
  Future<Either<ServerExceptions, T>> manageRequestResultWithApiHelper<T>({
    required Future<T> Function() makeRequest,
  }) async {
    try {
      final result = await makeRequest();
      return Right(result);
    } on ServerExceptions catch (e) {
      //Types of exception that might be thrown :
      //1-BadRequestException
      //2-UnAuthorizedException
      //3-TimeOutException
      // isSessionHasEnded(e);
      debugPrint("EXCEPTION THAT THROWN : ${e.runtimeType}");
      return Left(e);
    }
  }
}