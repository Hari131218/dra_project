import 'dart:convert';
import 'package:dra_project/basic_screen.dart';
import 'package:dra_project/common/no_result.dart';
import 'package:dra_project/screens/assessor_provider.dart';
import 'package:dra_project/screens/screens.dart';
import 'package:dra_project/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/app_constants.dart';
import 'models/assessment_list_model.dart';
import 'models/homeowner_api.dart';

class FirstScreen1 extends StatefulWidget {
  const FirstScreen1({Key? key}) : super(key: key);

  @override
  State<FirstScreen1> createState() => _FirstScreen1State();
}

class _FirstScreen1State extends State<FirstScreen1> {
  Widget appBarTitle = new Text("House Owner Information",style: TextStyle(fontSize: 17),);
  Icon actionIcon = new Icon(Icons.search);
  late ScrollController controller;
  late FocusNode focusNode1;
  late Future<List<AssessmentListModel>> futureData;
  late SharedPreferences localStorage;
  bool isLoading = false;
  bool defaultdate = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<homeownerlist> dataList = [];
  final TextEditingController _searchQueryController =
      new TextEditingController();
  List<String> items = List.generate(10, (index) => 'Hello $index');

  fetchData(accessToken) async {
    final response = await get(
        Uri.parse(
            '${BASE_URL}house_owner_list'),
        headers: {'Authorization': 'Bearer ${accessToken}'});
    if (response.statusCode == 200) {
      dataList = (json.decode(response.body)['assessorNameList'] as List)
          .map((e) => new homeownerlist.fromJson(e))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  void initState() {
    super.initState();
    var accessToken = "";
    focusNode1 = FocusNode();
    Provider.of<AssessorProvider>(context, listen: false).getHouseOwnerList("");
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    focusNode1.dispose();
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  Icon actionIcon1 = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    AssessorProvider _provider = Provider.of<AssessorProvider>(context);

    //  return Text('data');
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Color(0xffff16698C),
          centerTitle: true,
          title: appBarTitle,
          actions: <Widget>[
            new IconButton(
              icon: actionIcon,
              onPressed: () {
                setState(() {
                  if (this.actionIcon.icon == Icons.search) {
                    this.actionIcon = new Icon(Icons.close);
                 /*   this.actionIcon = new IconButton(onPressed: (){
                      Provider.of<AssessorProvider>(context, listen: false).getHouseOwnerList("");

                    }, icon: Icon(Icons.close)) as Icon;*/
                    this.appBarTitle = new TextField(
                      autofocus: true,
                      focusNode: focusNode1,
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                          prefixIcon:
                              new Icon(Icons.search, color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)),
                      onChanged: (content) {
                        if (content.length > 1) {
                          Provider.of<AssessorProvider>(context, listen: false).getHouseOwnerList("$content");
                          // Provider.of<AssessorProvider>(context, listen: false)
                          //     .getAssessmentBasedOnDate("search", "$content");
                          // defaultdate = false;
                          print("svsdvsdvdsvdsv $content");
                        } else if (content.length == 0) {
                          Provider.of<AssessorProvider>(context, listen: false).getHouseOwnerList("");
                          // Provider.of<AssessorProvider>(context, listen: false)
                          //     .getAssessmentBasedOnDate("search", "");
                          // defaultdate = false;
                        }
                      },
                    );
                  } else {
                    this.actionIcon = new Icon(Icons.search);
                    Provider.of<AssessorProvider>(context, listen: false).getHouseOwnerList("");
                    this.appBarTitle = new Text("House Owner Information",style: TextStyle(fontSize: 17));
                  }
                });
              },
            ),
          ]),
      key: _formKey,
      body: _provider.isLoading
          ?  Center(
                child: CircularProgressIndicator(),
              )

          : Container(child:_provider.houseOwnerList.isEmpty ? Center(child: EmptyData(),) :  ListView.builder(
              itemCount: _provider.houseOwnerList.length,
              itemBuilder: (BuildContext context, int index) {
                final assimentList = _provider.houseOwnerList[index];
                print(assimentList);
                Text('${assimentList.createdAt}');
                return InkWell(
                  child: NewWidget(assimentList: assimentList),
                  onTap: () {
                    print(assimentList.id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Basic(
                                  ids: '${assimentList.id}',
                                )));
                  },
                );
              })),
    );
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

  final AssessorNameList assimentList;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              children: [
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
                  '229-200-3671-229-200-3671',
                  style: TextStyle(
                      fontFamily: 'San Francisco',
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 8),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}

class SearchAppBar extends StatefulWidget {
  @override
  _SearchAppBarState createState() => new _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  Widget appBarTitle = new Text("AppBar Title");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
        new IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)),
                );
              } else {
                this.actionIcon = new Icon(Icons.search);
                this.appBarTitle = new Text("AppBar Title");
              }
            });
          },
        ),
      ]),
    );
  }
}
