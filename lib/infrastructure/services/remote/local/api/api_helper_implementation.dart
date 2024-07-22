import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'api_helper.dart';

class ApiHelperImplementation extends ApiHelper {
  final Dio dio = Dio();

  @override
  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    dynamic options,
    String? token,
    CancelToken? cancelToken,
    bool isMultipart = false,


  }) async {
    dio.options.headers = _setHeaders(isMultipart, token);
    _debugPrintData(endPoint, data, query);

    return await requestData(
      call: () async => await dio.get(
        endPoint,
        queryParameters: query,
        options: options,
      ),
    );
  }

  @override
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
    bool isAddStripeVersion = false,

  }) async {
    dio.options.headers = _setHeaders(isMultipart, token,isAddStripeVersion: isAddStripeVersion,);
    _debugPrintData(endPoint, data, query);

    return await requestData(
      call: () async => await dio.post(
        endPoint,
        data: data,
        queryParameters: query,
        onSendProgress: _setProgressCallBackWhenUploadingFile(progressCallback),
      ),
    );
  }

  @override
  Future put({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
    dynamic options,

  }) async {
    dio.options.headers = _setHeaders(isMultipart, token);
    _debugPrintData(endPoint, data, query);

    return await requestData(
      call: () async => await dio.put(
        endPoint,
        data: data,
        queryParameters: query,
        options: options,
        onSendProgress: _setProgressCallBackWhenUploadingFile(progressCallback),
      ),
    );
  }

  @override
  Future patch({
    String? base,
    required String endPoint,
    data,
    query,
    String? token,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
    dynamic options,

  }) async {
    dio.options.headers = _setHeaders(isMultipart, token);
    _debugPrintData(endPoint, data, query);

    return await requestData(
      call: () async => await dio.patch(
        endPoint,
        data: data,
        queryParameters: query,
        options:    options,

        onSendProgress: _setProgressCallBackWhenUploadingFile(progressCallback),
      ),
    );
  }

  @override
  Future<dynamic> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    dynamic options,
    Function? progressCallback,
    CancelToken? cancelToken,
    bool isMultipart = false,
  }) async {
    dio.options.headers = _setHeaders(isMultipart, token);
    _debugPrintData(endPoint, data, query);

    return await requestData(
      call: () async => await dio.delete(endPoint,
          data: data,
          queryParameters: query,
          options: options,
          cancelToken: cancelToken),
    );
  }

  _setProgressCallBackWhenUploadingFile(progressCallback) {
    if (progressCallback != null) {
      return (count, total) {
        double percentage = (count / total) * 100;
        debugPrint("${percentage.toStringAsFixed(2)} % Sending File");
        progressCallback(percentage);
      };
    }
    return null;
  }

  _setHeaders(bool isMultipart, String? token, {bool isAddStripeVersion=false}) {
    return {
      if (isMultipart) Headers.contentTypeHeader: Headers.formUrlEncodedContentType,
      if (!isMultipart) Headers.contentTypeHeader:Headers.jsonContentType,
      if (!isMultipart) Headers.acceptHeader: Headers.jsonContentType,
      if (isAddStripeVersion)  'Stripe-Version': '2024-06-20',
      if (token != null) 'Authorization': "Bearer $token",
    };
  }

  _debugPrintData(String endPoint, data, query) {
    dev.log('URL => ${dio.options.baseUrl + endPoint}');
    dev.log('Header => ${dio.options.headers.toString()}');
    dev.log('Body => $data');
    dev.log('Query => $query');
  }
}