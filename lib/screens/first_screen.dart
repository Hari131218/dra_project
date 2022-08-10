import 'dart:convert';
import 'package:dra_project/screens/assessor_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../basic_screen.dart';
import '../common/app_constants.dart';
import '../common/no_result.dart';
import '../models/assessment_list_model.dart';
import '../models/login_page_api/api_login.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late ScrollController controller;
  late Future<List<AssessmentListModel>> futureData;
  late SharedPreferences localStorage;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiClient _apiClient = ApiClient();

  List<AssessmentList> dataList = [];

  List<String> items = List.generate(10, (index) => 'Hello $index');
  fetchData(accessToken) async {
    final response = await get(
        Uri.parse(
            '${BASE_URL}assessment_requests/index'),
        headers: {'Authorization': 'Bearer ${accessToken}'});
    if (response.statusCode == 200) {
      dataList = (json.decode(response.body)['assessorNameList'] as List)
          .map((e) => new AssessmentList.fromJson(e))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  void initState() {
    super.initState();
    var accessToken = "";
    Provider.of<AssessorProvider>(context, listen: false).getAssessment();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AssessorProvider _provider = Provider.of<AssessorProvider>(context);
    return Scaffold(
      key: _formKey,
      body: _provider.isLoading
          ? const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          :Container(padding: EdgeInsets.only(top: 10), child: _provider.assessmentList.isNotEmpty ? ListView.builder(
              itemCount: _provider.assessmentList.length,
              itemBuilder: (BuildContext context, int index) {
                final assimentList = _provider.assessmentList[index];
                Text('${assimentList.assignedDate}');
                return InkWell(
                  child: NewWidget(assimentList: assimentList),
                  onTap: () {
                    print("========================");
                    print(assimentList.id);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Basic(ids: '${assimentList.assessmentRequestId}',)));
                  },
                );
                //  NewWidget(assimentList: assimentList);
              }):Center(child: EmptyData()),
    ));

  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 5) {
      setState(() {
        items.addAll(List.generate(10, (index) => 'Inserted $index'));
      });
    }
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.assimentList,
  }) : super(key: key);

  final AssessmentList assimentList;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 5,right: 5,top: 5),child:Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      color: Colors.white,
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${assimentList.firstName}',
                  style: const TextStyle(
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xff000000)),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0, top: 5),
            child: Text(
              '${assimentList.address}',
              style: TextStyle(
                  color: Color(0xffA5A5A5),
                  fontSize: 10,
                  fontFamily: 'San Francisco'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.mail,
                        color: Colors.white,
                        size: 8,
                      ),
                      backgroundColor: Color(0xff00b3bf),
                    ),
                  ),
                  Text(
                    '${assimentList.email}',
                    style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000)),
                  ),
                ],),

                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 20),
                    child: CircleAvatar(
                      radius: 10,
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 8,
                      ),
                      backgroundColor: Color(0xff00b3bf),
                    ),
                  ),
                  Text(
                    '${assimentList.phoneNumber}',
                    style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000)),
                  ),

                  SizedBox(width: 10,)

                ],)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 8),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    Padding(
                       padding: const EdgeInsets.only(bottom: 6.0, right: 2),
                        child:Text(
                  'Assigned Date :',
                  style: TextStyle(
                      fontFamily: 'San Francisco',
                      color: Color(0xff16698C),
                      fontSize: 10,
                      fontWeight: FontWeight.w700),
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0, right: 10),
                  child: Row(
                    children: [
                      Text(
                        '${assimentList.assignedDate}',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

