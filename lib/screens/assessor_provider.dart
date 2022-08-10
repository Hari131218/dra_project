import 'dart:convert';
import 'package:dra_project/models/assessment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

import '../common/app_constants.dart';
import '../models/homeowner_api.dart';

class AssessorProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  AssessmentListModel? _assessmentListModel;
  List<AssessmentList>? _assessmentList;
  List<AssessmentList>? _assessmentSubmittedList;
  List<AssessorNameList>? _houseOwnerList;

  List<AssessorNameList> get houseOwnerList => _houseOwnerList??[];

  List<AssessmentList> get assessmentSubmittedList =>
      _assessmentSubmittedList ?? [];

  AssessmentListModel? get assessmentListModel => _assessmentListModel;

  getAssessmentBasedOnDate(String _params , String _value) async {
    SharedPreferences.getInstance().then((token) async {
      String accessToken = token.getString("accessToken")!;
      _isLoading = true;
      notifyListeners();
      // assign_date
      final response = await get(
          Uri.parse(
              '${BASE_URL}assessment_requests/index?$_params=$_value'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        _assessmentList = (json.decode(response.body)['assessmentList'] as List)
            .map((e) => AssessmentList.fromJson(e))
            .toList();
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();

        throw Exception('Unexpected error occured!');
      }
    });
  }
  getAssessment() async {
    SharedPreferences.getInstance().then((token) async {
      String accessToken = token.getString("accessToken") ?? "";
      _isLoading = true;
      notifyListeners();

      final response = await get(
          Uri.parse(
              '${BASE_URL}assessment_requests/index'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        _assessmentList = (json.decode(response.body)['assessmentList'] as List)
            .map((e) => AssessmentList.fromJson(e))
            .toList();

        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Unexpected error occured!');
      }
    });
  }

  getSubmittedAssessment() async {
    SharedPreferences.getInstance().then((token) async {
      String accessToken = token.getString("accessToken") ?? "";
      _isLoading = true;
      notifyListeners();

      final response = await get(
          Uri.parse(
              '${BASE_URL}assessment_requests/submited_form'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        _assessmentSubmittedList =
            (json.decode(response.body)['assessmentList'] as List)
                .map((e) => AssessmentList.fromJson(e))
                .toList();
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Unexpected error occured!');
      }
    });
  }

  getHouseOwnerList(String _search)
  {
    SharedPreferences.getInstance().then((token) async {
      String accessToken = token.getString("accessToken") ?? "";
      _isLoading = true;
      notifyListeners();

      final response = await get(
          Uri.parse(
              '${BASE_URL}house_owner_list?search=$_search'),
          headers: {'Authorization': 'Bearer ${accessToken}'});
      if (response.statusCode == 200) {
        _houseOwnerList = (json.decode(response.body)['assessmentList'] as List)
            .map((e) =>  AssessorNameList.fromJson(e))
            .toList();

        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Unexpected error occured!');
      }
    });
  }


  getSubmitedBasedOnDate(String params , String value) async {
    SharedPreferences.getInstance().then((token) async {
      String accessToken = token.getString("accessToken")!;
      _isLoading = true;
      notifyListeners();
      // assign_date
      final response = await get(
          Uri.parse(
              '${BASE_URL}assessment_requests/submited_form?$params=$value'),
          headers: {'Authorization': 'Bearer $accessToken'});
      if (response.statusCode == 200) {
        _assessmentSubmittedList = (json.decode(response.body)['assessmentList'] as List)
            .map((e) => AssessmentList.fromJson(e))
            .toList();
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Unexpected error occured!');
      }
    });
  }


  List<AssessmentList> get assessmentList => _assessmentList ?? [];
}