import 'dart:async';

import 'package:checkout_payment_integration/core/data/constants/api_constants/response_codes.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/bad_request_exception.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/conflict_exception.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/internal_server_error.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/timeout_exception.dart';
import 'package:checkout_payment_integration/infrastructure/errors/exceptions/server_exceptions/un_authorized_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


abstract class ApiHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
    dynamic options,

  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    dynamic options,
    String? token,
    CancelToken? cancelToken,
    bool isMultipart = false,
  });

  Future<dynamic> put({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
    dynamic options,

  });

  Future<dynamic> patch({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
    dynamic options,

  });

  Future<dynamic> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
  });
}

extension RequestFunction on ApiHelper {
  Future requestData({
    required Future<Response> Function() call,
  }) async {
    try {
      final response = await call();
      debugPrint("Response_Data => ${response.data}");
      debugPrint("Response_Type => ${response.data.runtimeType}");
      debugPrint("Response_Code => ${response.statusCode}");

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        throw TimeOutException(
          errorCode: e.error.toString(),
          statusCode: timeoutStatusCode,
        );
      } else {
        _handleThrowingExceptions(e);
      }
    }
  }

  void _handleThrowingExceptions(DioException e) {
    if (e.response!.statusCode == badRequestStatusCode) {
      throw BadRequestException(
        errorCode: e.response!.data['error_code'],
        statusCode: badRequestStatusCode,
        errorMessage: e.response!.data['error_description'],
      );
    }
    if (e.response!.statusCode == internalServerErrorStatusCode) {
      throw InternalServerErrorException(
        errorCode: e.response!.data['error_code'],
        statusCode: internalServerErrorStatusCode,
        errorMessage: e.response!.data['error_description'],
      );
    }
    if (e.response!.statusCode == conflictStatusCode) {
      throw ConflictException(
        errorCode: e.response!.data['error_code'],
        statusCode: conflictStatusCode,
        errorMessage: e.response!.data['error_description'],
      );
    }
    if (e.response!.statusCode == unAuthorizedStatusCode) {
      throw UnAuthorizedException(
        errorCode: e.response!.data['error_code'],
        statusCode: unAuthorizedStatusCode,
        errorMessage: e.response!.data['error_description'],
      );
    }
  }
}