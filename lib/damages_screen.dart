import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dra_project/assesment_page.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'assesment_page.dart';
import 'common/app_constants.dart';
import 'models/login_page_api/api_login.dart';
import 'models/sumitted_form_model.dart';

class Damages extends StatefulWidget {
  Damages({Key? key, required this.tabController, required this.ids, required this.tabonTab,})
      : super(key: key);

  final TabController tabController;
  final String ids;
  final Function? tabonTab;


  @override
  State<Damages> createState() => _DamagesState();
}

class _DamagesState extends State<Damages> with SingleTickerProviderStateMixin {
  late SharedPreferences localStorage;
  bool isLoading = false;
  late AssessmentDetailsList dataList;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool typeNonImpact = false;
  bool typeHurImpact = false;

  bool windowAwing = false;
  bool windowSlider = false;
  bool windowcolonial = false;
  bool windowpush = false;

  bool typeNonImpact1 = false;
  bool typeHurImpact1 = false;

  bool windowAwing1 = false;
  bool windowSlider1 = false;
  bool windowcolonial1 = false;
  bool windowpush1 = false;

  bool typeNonImpact2 = false;
  bool typeHurImpact2 = false;

  bool windowAwing2 = false;
  bool windowSlider2 = false;
  bool windowcolonial2 = false;
  bool windowpush2 = false;

  bool locationInterior = false;
  bool locationExterrior = false;
  bool locationSolidCore = false;
  bool locationHollow = false;

  bool orientation_LH_Rverse = false;
  bool orientation_LH_Out = false;
  bool orientation_RH_Rverse = false;
  bool orientation_RH_Out = false;

  bool locationInterior1 = false;
  bool locationExterrior1 = false;
  bool locationSolidCore1 = false;
  bool locationHollow1 = false;

  bool orientation_LH_Rverse1 = false;
  bool orientation_LH_Out1 = false;
  bool orientation_RH_Rverse1 = false;
  bool orientation_RH_Out1 = false;

  bool locationInterior2 = false;
  bool locationExterrior2 = false;
  bool locationSolidCore2 = false;
  bool locationHollow2 = false;

  bool orientation_LH_Rverse2 = false;
  bool orientation_LH_Out2 = false;
  bool orientation_RH_Rverse2 = false;
  bool orientation_RH_Out2 = false;

  bool serviceRepair = false;
  bool serviceReplacement = false;
  bool servicePoleRepair = false;
  bool servicePoleReplacement = false;

  bool eleInteriorYes = false;
  bool eleInteriorNo = false;

  bool eleGroundRod = false;
  bool eleGroundClamp = false;
  bool eleGroundwire = false;

  bool plumingwater = false;
  bool plumingwaterclosetRepair = false;
  bool plumingwaterclosetReplacment = false;

  bool plumingservicePipe1 = false;
  bool plumingservicePipe2 = false;
  bool plumingservicePipe3 = false;

  late TextEditingController evenFeetController;
  final TextEditingController evenInchController = TextEditingController();
  final TextEditingController fasciaFeetController = TextEditingController();
  final TextEditingController fasciaInchController = TextEditingController();

  final TextEditingController soffitBoardFeetController =
      TextEditingController();
  final TextEditingController soffitBoardInchController =
      TextEditingController();
  final TextEditingController soffitHeightFeetController =
      TextEditingController();
  final TextEditingController soffitHeightInchController =
      TextEditingController();

  final TextEditingController shinglesHeightFeetController =
      TextEditingController();
  final TextEditingController shinglesHeightInchController =
      TextEditingController();
  final TextEditingController shinglesWidthFeetController =
      TextEditingController();
  final TextEditingController shinglesWidthInchController =
      TextEditingController();

  final TextEditingController plywoodHeightFeetController =
      TextEditingController();
  final TextEditingController plywoodHeightInchController =
      TextEditingController();
  final TextEditingController plywoodWidthFeetController =
      TextEditingController();
  final TextEditingController plywoodWidthInchController =
      TextEditingController();

  final TextEditingController iceHeightFeetController = TextEditingController();
  final TextEditingController iceHeightInchController = TextEditingController();
  final TextEditingController iceWidthFeetController = TextEditingController();
  final TextEditingController iceWidthInchController = TextEditingController();

  final TextEditingController torchHeightFeetController =
      TextEditingController();
  final TextEditingController torchHeightInchController =
      TextEditingController();
  final TextEditingController torchWidthFeetController =
      TextEditingController();
  final TextEditingController torchWidthInchController =
      TextEditingController();

  final TextEditingController toughHeightFeetController =
      TextEditingController();
  final TextEditingController toughHeightInchController =
      TextEditingController();
  final TextEditingController toughWidthFeetController =
      TextEditingController();
  final TextEditingController toughWidthInchController =
      TextEditingController();

  final TextEditingController windowQuantityController =
      TextEditingController();
  final TextEditingController windowQuantity1Controller =
      TextEditingController();
  final TextEditingController windowQuantity2Controller =
      TextEditingController();

  final TextEditingController windowSizeHeightFeetController =
      TextEditingController();
  final TextEditingController windowSizeHeightInchController =
      TextEditingController();
  final TextEditingController windowSizeWidthFeetController =
      TextEditingController();
  final TextEditingController windowSizeWidthInchController =
      TextEditingController();

  final TextEditingController windowSize1HeightFeetController =
      TextEditingController();
  final TextEditingController windowSize1HeightInchController =
      TextEditingController();
  final TextEditingController windowSize1WidthFeetController =
      TextEditingController();
  final TextEditingController windowSize1WidthInchController =
      TextEditingController();

  final TextEditingController windowSize2HeightFeetController =
      TextEditingController();
  final TextEditingController windowSize2HeightInchController =
      TextEditingController();
  final TextEditingController windowSize2WidthFeetController =
      TextEditingController();
  final TextEditingController windowSize2WidthInchController =
      TextEditingController();

  final TextEditingController doorMaterialController = TextEditingController();
  final TextEditingController doorMaterial1Controller = TextEditingController();
  final TextEditingController doorMaterial2Controller = TextEditingController();

  final TextEditingController doorQuantityController = TextEditingController();
  final TextEditingController doorQuantity1Controller = TextEditingController();
  final TextEditingController doorQuantity2Controller = TextEditingController();

  final TextEditingController doorSizeHeightFeetController =
      TextEditingController();
  final TextEditingController doorSizeHeightInchController =
      TextEditingController();
  final TextEditingController doorSizeWidthFeetController =
      TextEditingController();
  final TextEditingController doorSizeWidthInchController =
      TextEditingController();

  final TextEditingController doorSize1HeightFeetController =
      TextEditingController();
  final TextEditingController doorSize1HeightInchController =
      TextEditingController();
  final TextEditingController doorSize1WidthFeetController =
      TextEditingController();
  final TextEditingController doorSize1WidthInchController =
      TextEditingController();

  final TextEditingController doorSize2HeightFeetController =
      TextEditingController();
  final TextEditingController doorSize2HeightInchController =
      TextEditingController();
  final TextEditingController doorSize2WidthFeetController =
      TextEditingController();
  final TextEditingController doorSize2WidthInchController =
      TextEditingController();

  final TextEditingController eleMeterSizeController = TextEditingController();
  final TextEditingController elaMeterSwitchController =
      TextEditingController();
  final TextEditingController elaFloadingFeetController =
      TextEditingController();
  final TextEditingController elaFloadingInchController =
      TextEditingController();

  final TextEditingController plumingLengthFeetController =
      TextEditingController();
  final TextEditingController plumingLengthInchController =
      TextEditingController();

  final TextEditingController plumingServiceFeetController =
      TextEditingController();
  final TextEditingController plumingServiceInchController =
      TextEditingController();

  final TextEditingController plumingService1FeetController =
      TextEditingController();
  final TextEditingController plumingService1InchController =
      TextEditingController();

  Map<String, dynamic>? data = Map();

  List<String> typeList = [];
  List<String> type1List = [];
  List<String> type2List = [];
  List<String> windowList = [];
  List<String> window1List = [];
  List<String> window2List = [];
  List<String> locationList = [];
  List<String> location1List = [];
  List<String> location2List = [];
  List<String> doorTypeList = [];
  List<String> doorType1List = [];
  List<String> doorType2List = [];
  List<String> orientationList = [];
  List<String> orientation1List = [];
  List<String> orientation2List = [];
  List<String> serviceEntList = [];
  List<String> servicePoleList = [];
  List<String> yerornoList = [];
  List<String> groundRodList = [];
  List<String> groundClampList = [];
  List<String> groundWireList = [];
  List<String> groundWatersupplyList = [];
  List<String> groundWaterClosestList = [];
  List<String> servicePipeList = [];
  List<String> servicePipe1List = [];
  List<String> servicePipe2List = [];

  late AssesmentPage assesment;

  final ApiClient _apiClient = ApiClient();

  String? gender;

  List<DropListModel> firstDropDownList = [
    DropListModel("Plywood", "1"),
    DropListModel("Vinyl", "2"),
    DropListModel("Tounge & Groove T&G", "3"),
    //BankListDataModel("Canara","https://bankforms.org/wp-content/uploads/2019/10/Canara-Bank.png")
  ];

  List<DropListModel> secondDropDownList = [
    DropListModel("Architectural", "1"),
    DropListModel("Asphalt", "2"),
    DropListModel("Metal", "3"),
    DropListModel("Other", "4"),
  ];

  List<DropListModel> materialFirst = [
    DropListModel("Wood", "1"),
    DropListModel("Metal", "2"),
  ];

  List<DropListModel> materialSecond = [
    DropListModel("Wood", "1"),
    DropListModel("Metal", "2"),
  ];

  List<DropListModel> materialThird = [
    DropListModel("Wood", "1"),
    DropListModel("Metal", "2"),
  ];

  dynamic _currentSelectedValue;
  dynamic _currentSecondSelectedValue;
  dynamic _currentMeterial1SelectedValue;
  dynamic _currentMeterial2SelectedValue;
  dynamic _currentMeterial3SelectedValue;

  String _sofiTypeID = "";
  String _shinglesTypeID = "";
  String _materialId = "";
  String _materialId1 = "";
  String _materialId2 = "";

  // final List<String> shinglesDropDown = [
  //   "Architectural",
  //   "Asphalt",
  //   "Metal",
  //   "Other",
  // ];
  int _radioValue = 0;
  DropListModel? _bankChoose;

  String dropdownvalue = '';
  var items =  ['Apple','Banana','Grapes','Orange','watermelon','Pineapple'];

  @override
  void initState() {
    super.initState();
    evenFeetController = TextEditingController();
    fetchData();



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView(children: [
              Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            color: Color(0xff16698C),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Roof Damage',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Eave Flashing',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: evenFeetController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    label: Text('Feet'),
                                    //      hintText: 'Feet',
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff808B9E),
                                        fontFamily: 'San Francisco'),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffF2F2F2),
                                            width: 344)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: evenInchController,
                                  decoration: InputDecoration(
                                    //  hintText: 'Inches',
                                    label: Text('Inches'),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff808B9E),
                                        fontFamily: 'San Francisco'),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffF2F2F2),
                                            width: 344)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              )),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Fascia Board',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: fasciaFeetController,
                                  decoration: InputDecoration(
                                    //  hintText: 'Feet',
                                    label: Text('Feet'),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff808B9E),
                                        fontFamily: 'San Francisco'),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffF2F2F2),
                                            width: 344)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: fasciaInchController,
                                  decoration: InputDecoration(
                                    // hintText: 'Inches',
                                    label: Text('Inches'),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff808B9E),
                                        fontFamily: 'San Francisco'),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffF2F2F2),
                                            width: 344)),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              )),
                            ],
                          )),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Soffit type',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38)),
                        child: DropdownButtonFormField<DropListModel>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          value: _currentSelectedValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),

                          items: firstDropDownList
                              .map<DropdownMenuItem<DropListModel>>(
                                  (DropListModel value) {
                            return DropdownMenuItem<DropListModel>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          hint: Text(
                            "Choose",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          onChanged: (DropListModel? value) {
                            setState(() {
                              _sofiTypeID = value!.id;
                              _currentSelectedValue = value;
                              print("SSSSSSSSSS ${_currentSelectedValue}");
                            });
                          },
                          isExpanded: true,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Soffit',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: soffitBoardFeetController,
                                decoration: InputDecoration(
                                  //  hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: soffitBoardInchController,
                                    decoration: InputDecoration(
                                      //  hintText: 'Height-Inches',
                                      label: Text('Height-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: soffitHeightFeetController,
                                decoration: InputDecoration(
                                  //  hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: soffitHeightInchController,
                                    decoration: InputDecoration(
                                      //  hintText: 'Width-Inches',
                                      label: Text('Width-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Shingles type',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, top: 10, right: 15),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38)),
                        child: DropdownButtonFormField<DropListModel>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          value: _currentSecondSelectedValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),

                          items: secondDropDownList
                              .map<DropdownMenuItem<DropListModel>>(
                                  (DropListModel value) {
                            return DropdownMenuItem<DropListModel>(
                              value: value,
                              child: Text(value.name),
                            );
                          }).toList(),
                          hint: Text(
                            "Choose",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          onChanged: (DropListModel? value) {
                            setState(() {
                              _shinglesTypeID = value!.id;
                              _currentSecondSelectedValue = value;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Shingles',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: shinglesHeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: shinglesHeightInchController,
                                    decoration: InputDecoration(
                                      //  hintText: 'Height-Inches',
                                      label: Text('Height-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: shinglesWidthFeetController,
                                decoration: InputDecoration(
                                  //  hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: shinglesWidthInchController,
                                    decoration: InputDecoration(
                                      //  hintText: 'Width-Inches',
                                      label: Text('Width-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Plywood',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plywoodHeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: plywoodHeightInchController,
                                    decoration: InputDecoration(
                                      //  hintText: 'Height-Inches',
                                      label: Text('Height-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plywoodWidthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: plywoodWidthInchController,
                                    decoration: InputDecoration(
                                      // hintText: 'Width-Inches',
                                      label: Text('Width-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Ice & Water Shield',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: iceHeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: iceHeightInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Inches',
                                  label: Text('Height-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: iceWidthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: iceWidthInchController,
                                decoration: InputDecoration(
                                  //  hintText: 'Width-Inches',
                                  label: Text('Width-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffF2F2F2),
                                  )),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Tough Guard',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: toughHeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: toughHeightInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Inches',
                                  label: Text('Height-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: toughWidthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: toughWidthInchController,
                                    decoration: InputDecoration(
                                      // hintText: 'Width-Inches',
                                      label: Text('Width-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Torch On',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: torchHeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: torchHeightInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Inches',
                                  label: Text('Height-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: torchWidthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffF2F2F2),
                                  )),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: torchWidthInchController,
                                decoration: InputDecoration(
                                  //  hintText: 'Width-Inches',
                                  label: Text('Width-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 5),
                            child: Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                                color: Color(0xff16698C),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Windows',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, bottom: 5),
                            child: Text(
                              'Type',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff16698C),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'San Francisco'),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: this.typeNonImpact,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.typeNonImpact = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'NON-IMPACT',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Checkbox(
                                    value: this.typeHurImpact,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.typeHurImpact = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'HURRICANE IMPACT',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              )),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, bottom: 5),
                            child: Text(
                              'Window Style',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff16698C),
                                  fontFamily: 'San Francisco'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowAwing,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowAwing = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Awining',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowSlider,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowSlider = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Slider',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowcolonial,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowcolonial = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Colonial',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowpush,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowpush = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Push up',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 16, bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: windowQuantityController,
                          decoration: InputDecoration(
                            // hintText: 'Quantity',
                            label: Text('Quantity'),
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xff808B9E),
                                fontFamily: 'San Francisco'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffF2F2F2), width: 344)),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                        child: Text(
                          'Size',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSizeHeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSizeHeightInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Inches',
                                  label: Text('Height-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffF2F2F2),
                                  )),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSizeWidthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: windowSizeWidthInchController,
                                    decoration: InputDecoration(
                                      // hintText: 'Width-Inches',
                                      label: Text('Width-Inches'),
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff808B9E),
                                          fontFamily: 'San Francisco'),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffF2F2F2),
                                              width: 344)),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'This field is required';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),

                      ///------------------  second same form ---------------------------

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, bottom: 1, top: 10),
                            child: Text(
                              'Type',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff16698C),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'San Francisco'),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: typeNonImpact1,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.typeNonImpact1 = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'NON-IMPACT',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Checkbox(
                                    value: this.typeHurImpact1,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.typeHurImpact1 = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'HURRICANE IMPACT',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, bottom: 10, top: 5),
                            child: Text(
                              'Window Style',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff16698C),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'San Francisco'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Checkbox(
                                        value: windowAwing1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowAwing1 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Awining',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowSlider1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowSlider1 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Slider',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowcolonial1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowcolonial1 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Colonial',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowpush1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowpush1 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Push up',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 16, bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: windowQuantity1Controller,
                          decoration: InputDecoration(
                            // hintText: 'Quantity',
                            label: Text('Quantity'),
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xff808B9E),
                                fontFamily: 'San Francisco'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffF2F2F2), width: 344)),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Size',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize1HeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffF2F2F2),
                                  )),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize1HeightInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Inches',
                                  label: Text('Height-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffF2F2F2),
                                  )),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize1WidthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize1WidthInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Inches',
                                  label: Text('Width-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      // ---------------------- same third form -----------------------------

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, bottom: 1, top: 10),
                            child: Text(
                              'Type',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff16698C),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'San Francisco'),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 9),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: typeNonImpact2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.typeNonImpact2 = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'NON-IMPACT',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                  Checkbox(
                                    value: this.typeHurImpact2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        this.typeHurImpact2 = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'HURRICANE IMPACT',
                                    style: TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, bottom: 1, top: 5),
                            child: Text(
                              'Window Style',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff16698C),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'San Francisco'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Checkbox(
                                        value: windowAwing2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowAwing2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Awining',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowSlider2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowSlider2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Slider',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowcolonial2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowcolonial2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Colonial',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.windowpush2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.windowpush2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Push up',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 16, bottom: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: windowQuantity2Controller,
                          decoration: InputDecoration(
                            // hintText: 'Quantity',
                            label: Text('Quantity'),
                            labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xff808B9E),
                                fontFamily: 'San Francisco'),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffF2F2F2), width: 344)),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Size',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize2HeightFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Feet',
                                  label: Text('Height-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize2HeightInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Height-Inches',
                                  label: Text('Height-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      SizedBox(
                        height: 10,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize2WidthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Width-Feet',
                                  label: Text('Width-Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: windowSize2WidthInchController,
                                decoration: InputDecoration(
                                  //  hintText: 'Width-Inches',
                                  label: Text('Width-Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      // -------------------------------- end --------------------

                      SizedBox(
                        height: 20,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  color: Color(0xff16698C),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Doors',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'San Francisco',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, bottom: 1, top: 5),
                              child: Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff16698C),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'San Francisco'),
                              ),
                            ),

                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      value: this.locationInterior,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.locationInterior = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'INTERIOR',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                    Checkbox(
                                      value: this.locationExterrior,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.locationExterrior = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'EXTERIOR',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ],
                                )),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, bottom: 1, top: 5),
                              child: Text(
                                'Type',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff16698C),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'San Francisco'),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: this.locationSolidCore,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationSolidCore = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'SOLID CORE',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Checkbox(
                                        value: this.locationHollow,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationHollow = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'HOLLOW CORE',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 5),
                              child: Text(
                                'Material',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),

                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38)),
                              child: DropdownButtonFormField<DropListModel>(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                value: _currentMeterial1SelectedValue,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black),

                                items: materialFirst
                                    .map<DropdownMenuItem<DropListModel>>(
                                        (DropListModel value) {
                                  return DropdownMenuItem<DropListModel>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                hint: Text(
                                  "Choose",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                onChanged: (DropListModel? value) {
                                  setState(() {
                                    _materialId = value!.id;
                                    _currentMeterial1SelectedValue = value;
                                  });
                                },
                                isExpanded: true,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 10),
                              child: Text(
                                'Orientation ',
                                style: TextStyle(
                                    fontFamily: 'San Francisco',
                                    color: Color(0xff16698C),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: this.orientation_LH_Rverse,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_LH_Rverse = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'LH - REVERSE SWING',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Checkbox(
                                        value: this.orientation_LH_Out,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_LH_Out = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'LH - OUT SWING',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: this.orientation_RH_Rverse,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_RH_Rverse = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'RH - REVERSE SWING',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Checkbox(
                                        value: this.orientation_RH_Out,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_RH_Out = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'RH - OUT SWING',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 10),
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 16, bottom: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: doorQuantityController,
                                decoration: InputDecoration(
                                  // hintText: 'Quantity',
                                  label: Text('Quantity'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, top: 5, bottom: 10),
                              child: Text(
                                'Size',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSizeHeightFeetController,
                                      decoration: InputDecoration(
                                        // hintText: 'Height-Feet',
                                        label: Text('Height-Feet'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSizeHeightInchController,
                                      decoration: InputDecoration(
                                        //  hintText: 'Height-Inches',
                                        label: Text('Height-Inches'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ))
                                ])),

                            SizedBox(
                              height: 10,
                            ),

                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSizeWidthFeetController,
                                      decoration: InputDecoration(
                                        // hintText: 'Width-Feet',
                                        label: Text('Width-Feet'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSizeWidthInchController,
                                      decoration: InputDecoration(
                                        // hintText: 'Width-Inches',
                                        label: Text('Width-Inches'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ))
                                ])),

                            // -------------------- 2nd dublicate ----------------------

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                top: 10,
                              ),
                              child: Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff16698C),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'San Francisco'),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: this.locationInterior1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationInterior1 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'INTERIOR',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Checkbox(
                                        value: this.locationExterrior1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationExterrior1 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'EXTERIOR',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 5),
                              child: Text(
                                'Type',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff16698C),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'San Francisco'),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: this.locationSolidCore1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationSolidCore1 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'SOLID CORE',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Checkbox(
                                        value: this.locationHollow1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationHollow1 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'HOLLOW CORE',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Material',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38)),
                              child: DropdownButtonFormField<DropListModel>(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                value: _currentMeterial2SelectedValue,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black),

                                items: materialSecond
                                    .map<DropdownMenuItem<DropListModel>>(
                                        (DropListModel value) {
                                  return DropdownMenuItem<DropListModel>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                hint: Text(
                                  "Choose",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                onChanged: (DropListModel? value) {
                                  setState(() {
                                    _materialId1 = value!.id;
                                    _currentMeterial2SelectedValue = value;
                                  });
                                },
                                isExpanded: true,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Text(
                                'Orientation ',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),

                            Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_LH_Rverse1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_LH_Rverse1 =
                                                value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'LH-IN',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_LH_Out1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_LH_Out1 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'LH-OUT',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_RH_Rverse1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_RH_Rverse1 =
                                                value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'RH-IN',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_RH_Out1,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_RH_Out1 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'RH-OUT',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 16, bottom: 10, top: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: doorQuantity1Controller,
                                decoration: InputDecoration(
                                  // hintText: 'Quantity',
                                  label: Text('Quantity'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 10),
                              child: Text(
                                'Size',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize1HeightFeetController,
                                      decoration: InputDecoration(
                                        //  hintText: 'size-height-feet',
                                        label: Text('size-height-feet'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize1HeightInchController,
                                      decoration: InputDecoration(
                                        // hintText: 'size-height-inches',
                                        label: Text('size-height-inches'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ))
                                ])),

                            SizedBox(height: 10),

                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize1WidthFeetController,
                                      decoration: InputDecoration(
                                        // hintText: 'size-width-feet',
                                        label: Text('size-width-feet'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize1WidthInchController,
                                      decoration: InputDecoration(
                                        //  hintText: 'size-width-inches',
                                        label: Text('size-width-inches'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ))
                                ])),

                            // ------------------------- dublicate 3rd -----------------------------

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, bottom: 0, top: 10),
                              child: Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff16698C),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'San Francisco'),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: this.locationInterior2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationInterior2 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'INTERIOR',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Checkbox(
                                        value: this.locationExterrior2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationExterrior2 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'EXTERIOR',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 0),
                              child: Text(
                                'Type',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff16698C),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'San Francisco'),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        value: this.locationSolidCore2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationSolidCore2 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'SOLID CORE',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      Checkbox(
                                        value: this.locationHollow2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.locationHollow2 = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        'HOLLOW CORE',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                'Material',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 10, right: 15),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38)),
                              child: DropdownButtonFormField<DropListModel>(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                value: _currentMeterial3SelectedValue,
                                //elevation: 5,
                                style: TextStyle(color: Colors.black),

                                items: materialThird
                                    .map<DropdownMenuItem<DropListModel>>(
                                        (DropListModel value) {
                                  return DropdownMenuItem<DropListModel>(
                                    value: value,
                                    child: Text(value.name),
                                  );
                                }).toList(),
                                hint: Text(
                                  "Choose",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                onChanged: (DropListModel? value) {
                                  setState(() {
                                    _materialId2 = value!.id;

                                    _currentMeterial3SelectedValue = value;
                                  });
                                },
                                isExpanded: true,
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 5),
                              child: Text(
                                'Orientation ',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),

                            Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_LH_Rverse2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_LH_Rverse2 =
                                                value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'LH-IN',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_LH_Out2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_LH_Out2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'LH-OUT',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_RH_Rverse2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_RH_Rverse2 =
                                                value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'RH-IN',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Checkbox(
                                        value: this.orientation_RH_Out2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            this.orientation_RH_Out2 = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'RH-OUT',
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                )),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 10),
                              child: Text(
                                'Quantity',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 10),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: doorQuantity2Controller,
                                decoration: InputDecoration(
                                  // hintText: 'Quantity',
                                  label: Text('Quantity'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 5),
                              child: Text(
                                'Size',
                                style: TextStyle(
                                    color: Color(0xff16698C),
                                    fontFamily: 'San Francisco',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize2HeightFeetController,
                                      decoration: InputDecoration(
                                        //  hintText: 'Height-Feet',
                                        label: Text('Height-Feet'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize2HeightInchController,
                                      decoration: InputDecoration(
                                        // hintText: 'Height-Inches',
                                        label: Text('Height-Inches'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ))
                                ])),

                            SizedBox(
                              height: 10,
                            ),

                            Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(children: [
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize2WidthFeetController,
                                      decoration: InputDecoration(
                                        // hintText: 'Width-Feet',
                                        label: Text('Width-Feet'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: doorSize2WidthInchController,
                                      decoration: InputDecoration(
                                        // hintText: 'Width-Inches',
                                        label: Text('Width-Inches'),
                                        labelStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff808B9E),
                                            fontFamily: 'San Francisco'),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xffF2F2F2),
                                                width: 344)),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                    ),
                                  ))
                                ])),

                            // -------------------------- duplicate finish --------------------
                          ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            color: Color(0xff16698C),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Electrical',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 5),
                        child: Text(
                          'Service Entrance',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff16698C),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'San Francisco'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: this.serviceRepair,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.serviceRepair = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Needs Repair',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Checkbox(
                                  value: this.serviceReplacement,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.serviceReplacement = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Needs Replacement',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 0),
                        child: Text(
                          'Service Pole',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff16698C),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'San Francisco'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: this.servicePoleRepair,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.servicePoleRepair = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Needs Repair',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Checkbox(
                                  value: this.servicePoleReplacement,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.servicePoleReplacement = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Needs Replacement',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Meter Can Size',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff16698C),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'San Francisco'),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text(
                                        'Meter Switch Size',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff16698C),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'San Francisco'),
                                      ))),
                            ],
                          )),

                      SizedBox(
                        height: 7,
                      ),

                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: eleMeterSizeController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    // hintText: 'Watts',
                                    label: Text('Watts'),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff808B9E),
                                        fontFamily: 'San Francisco'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: elaMeterSwitchController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    //hintText: 'Amps',
                                    label: Text('Amps'),
                                    labelStyle: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff808B9E),
                                        fontFamily: 'San Francisco'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              )),
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 10),
                        child: Text(
                          'Interior Flooding',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff16698C),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'San Francisco'),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                              value: this.eleInteriorYes,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.eleInteriorYes = value!;
                                });
                              },
                            ),
                            Text(
                              'YES',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            Checkbox(
                              value: this.eleInteriorNo,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.eleInteriorNo = value!;
                                });
                              },
                            ),
                            Text(
                              'NO',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 10),
                        child: Text(
                          'Flooding Height',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff16698C),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'San Francisco'),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: elaFloadingFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'Feet',
                                  label: Text('Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: elaFloadingInchController,
                                decoration: InputDecoration(
                                  // hintText: 'Inches',
                                  label: Text('Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),

                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            color: Color(0xff16698C),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Grounding System',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Ground Rod',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Checkbox(
                              value: this.eleGroundRod,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.eleGroundRod = value!;
                                });
                              },
                            ),
                            Text(
                              'Needs Replacement',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Ground Clamp',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Checkbox(
                              value: this.eleGroundClamp,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.eleGroundClamp = value!;
                                });
                              },
                            ),
                            Text(
                              'Needs Replacement',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Ground Wire',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Checkbox(
                              value: this.eleGroundwire,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.eleGroundwire = value!;
                                });
                              },
                            ),
                            Text(
                              'Needs Replacement',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            color: Color(0xff16698C),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Pluming',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'San Francisco',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Water Supply',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              value: this.plumingwater,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.plumingwater = value!;
                                });
                              },
                            ),
                            Text(
                              'Needs Repair',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          'Water Closet(Toilet Only)',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff16698C),
                              fontWeight: FontWeight.w500,
                              fontFamily: 'San Francisco'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: this.plumingwaterclosetRepair,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.plumingwaterclosetRepair = value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Needs Repair',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                Checkbox(
                                  value: this.plumingwaterclosetReplacment,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.plumingwaterclosetReplacment =
                                          value!;
                                    });
                                  },
                                ),
                                Text(
                                  'Needs Replacement',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: Text(
                          '1/2"Service Pipe',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Checkbox(
                              value: this.plumingservicePipe1,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.plumingservicePipe1 = value!;
                                });
                              },
                            ),
                            Text(
                              'Needs Repair',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, bottom: 20),
                        child: Text(
                          'Length of damage',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plumingLengthFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'length-of-damage-feet',
                                  label: Text('Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plumingLengthInchController,
                                decoration: InputDecoration(
                                  // hintText: 'length-of-damage-inches',
                                  label: Text('Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, bottom: 20),
                        child: Text(
                          '3/4 Service Pipe',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Checkbox(
                              value: this.plumingservicePipe2,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.plumingservicePipe2 = value!;
                                });
                              },
                            ),
                            Text(
                              'Needs Repair',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plumingServiceFeetController,
                                decoration: InputDecoration(
                                  // hintText: 'length-of-damage-feet-one',
                                  label: Text('Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plumingServiceInchController,
                                decoration: InputDecoration(
                                  // hintText: 'length-of-damage-inches-one',
                                  label: Text('Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 15),
                        child: Text(
                          '1-service-pipe',
                          style: TextStyle(
                              color: Color(0xff16698C),
                              fontFamily: 'San Francisco',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Checkbox(
                              value: this.plumingservicePipe3,
                              onChanged: (bool? value) {
                                setState(() {
                                  this.plumingservicePipe3 = value!;
                                });
                              },
                            ),
                            Text(
                              'Needs Repair',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plumingService1FeetController,
                                decoration: InputDecoration(
                                  //  hintText: 'length-of-damage-feet-two',
                                  label: Text('Feet'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffF2F2F2),
                                          width: 344)),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: plumingService1InchController,
                                decoration: InputDecoration(
                                  //  hintText: 'length-of-damage-inches-two',
                                  label: Text('Inches'),
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff808B9E),
                                      fontFamily: 'San Francisco'),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color(0xffF2F2F2),
                                  )),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                              ),
                            ))
                          ])),
                      SizedBox(
                        height: 20,
                      )
                    ]),
              ),
            ]),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // widget.tabController.animateTo(1);

                  valiationPage();
                },
                child: Text('NEXT',
                    style: TextStyle(
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff12AFC0), fixedSize: Size(100, 46)),
              ),
            ),
          ],
        ),
      ),
    );
  }




  void valiationPage() {
    print("eave-flashing-feet : ${evenFeetController.text}");
    print("eave-flashing-inches : ${evenInchController.text}");
    print("fascia-board-feet : ${fasciaFeetController.text}");
    print("fascia-board-inch : ${fasciaInchController.text}");

    if (typeNonImpact == true) {
      this.typeList.add("NON-IMPACT");
    }
    if (typeHurImpact == true) {
      this.typeList.add("HURRICANE IMPACT");
    }

    if (typeNonImpact1 == true) {
      this.type1List.add("NON-IMPACT");
    }
    if (typeHurImpact1 == true) {
      this.type1List.add("HURRICANE IMPACT");
    }

    if (typeNonImpact2 == true) {
      this.type2List.add("NON-IMPACT");
    }
    if (typeHurImpact2 == true) {
      this.type2List.add("HURRICANE IMPACT");
    }

    /*---------------------- Window Style All --------------------*/

    if (windowAwing == true) {
      this.windowList.add("AWNING");
    }
    if (windowSlider == true) {
      this.windowList.add("SLIDER");
    }

    if (windowcolonial == true) {
      this.windowList.add("COLONIAL");
    }

    if (windowpush) {
      this.windowList.add("PUSH UP");
    }

    if (windowAwing1 == true) {
      this.window1List.add("AWNING");
    }
    if (windowSlider1 == true) {
      this.window1List.add("SLIDER");
    }

    if (windowcolonial1 == true) {
      this.window1List.add("COLONIAL");
    }
    if (windowpush1) {
      this.window1List.add("PUSH UP");
    }

    if (windowAwing2 == true) {
      this.window2List.add("AWNING");
    }
    if (windowSlider2 == true) {
      this.window2List.add("SLIDER");
    }

    if (windowcolonial2 == true) {
      this.window2List.add("COLONIAL");
    }

    if (windowpush2) {
      this.window2List.add("PUSH UP");
    }

    /*----------------- Doors Location ------------------------     */

    if (locationInterior == true) {
      this.locationList.add("INTERIOR");
    }

    if (locationExterrior == true) {
      this.locationList.add("EXTERIOR");
    }

    if (locationInterior1 == true) {
      this.location1List.add("INTERIOR");
    }

    if (locationExterrior1 == true) {
      this.location1List.add("EXTERIOR");
    }

    if (locationInterior2 == true) {
      this.location2List.add("INTERIOR");
    }

    if (locationExterrior2 == true) {
      this.location2List.add("EXTERIOR");
    }

    if (locationSolidCore == true) {
      this.doorTypeList.add("SOLID CORE");
    }

    if (locationHollow == true) {
      this.doorTypeList.add("HOLLOW CORE");
    }

    if (locationSolidCore1 == true) {
      this.doorType1List.add("SOLID CORE");
    }

    if (locationHollow1 == true) {
      this.doorType1List.add("HOLLOW CORE");
    }

    if (locationSolidCore2 == true) {
      this.doorType2List.add("SOLID CORE");
    }

    if (locationHollow2 == true) {
      this.doorType2List.add("HOLLOW CORE");
    }

    /*-------------- Doors Orientation ----------------- */

    if (orientation_LH_Rverse == true) {
      this.orientationList.add("LH - REVERSE SWING");
    }

    if (orientation_LH_Out == true) {
      this.orientationList.add("LH - OUT SWING");
    }

    if (orientation_RH_Rverse == true) {
      this.orientationList.add("RH - REVERSE SWING");
    }

    if (orientation_RH_Out == true) {
      this.orientationList.add("RH - OUT SWING");
    }

    if (orientation_LH_Rverse1 == true) {
      this.orientation1List.add("LH - IN");
    }

    if (orientation_LH_Out1 == true) {
      this.orientation1List.add("LH - OUT");
    }

    if (orientation_RH_Rverse1 == true) {
      this.orientation1List.add("RH - IN");
    }

    if (orientation_RH_Out1 == true) {
      this.orientation1List.add("RH - OUT");
    }

    if (orientation_LH_Rverse2 == true) {
      this.orientation2List.add("LH - IN");
    }

    if (orientation_LH_Out2 == true) {
      this.orientation2List.add("LH - OUT");
    }

    if (orientation_RH_Rverse2 == true) {
      this.orientation2List.add("RH - IN");
    }

    if (orientation_RH_Out2 == true) {
      this.orientation2List.add("RH - OUT");
    }

    /*---------------------- Electriacal -----------------*/

    if (serviceRepair == true) {
      this.serviceEntList.add("Needs Repair");
    }

    if (serviceReplacement == true) {
      this.serviceEntList.add("Needs Replacement");
    }

    if (servicePoleRepair == true) {
      this.servicePoleList.add("Needs Repair");
    }

    if (servicePoleReplacement == true) {
      this.servicePoleList.add("Needs Replacement");
    }

    if (eleInteriorYes == true) {
      this.yerornoList.add("Yes");
    }
    if (eleInteriorNo == true) {
      this.yerornoList.add("No");
    }

    if (eleGroundRod == true) {
      this.groundRodList.add("Needs Replacement");
    }
    if (eleGroundClamp == true) {
      this.groundClampList.add("Needs Replacement");
    }

    if (eleGroundwire == true) {
      this.groundWireList.add("Needs Replacement");
    }

    if (plumingwater == true) {
      this.groundWatersupplyList.add("Needs Repair");
    }

    if (plumingwaterclosetRepair == true) {
      this.groundWaterClosestList.add("Needs Repair");
    }

    if (plumingwaterclosetReplacment == true) {
      this.groundWaterClosestList.add("Needs Replacement");
    }

    if (plumingservicePipe1 == true) {
      this.servicePipeList.add("Needs Repair");
    }

    if (plumingservicePipe2 == true) {
      this.servicePipe1List.add("Needs Repair");
    }

    if (plumingservicePipe3 == true) {
      this.servicePipe2List.add("Needs Repair");
    }

    data = {
      'step': '2',
      'eave-flashing-inches': evenInchController.text,
      'eave-flashing-feet': evenFeetController.text,
      'fascia-board-feet': fasciaFeetController.text,
      'fascia-board-inches': fasciaInchController.text,
      'soffit-height-feet': soffitBoardFeetController.text,
      'soffit-height-inches': soffitBoardInchController.text,
      'soffit-width-feet': soffitHeightFeetController.text,
      'soffit-width-inches': soffitHeightInchController.text,
      'soffit-type': '$_sofiTypeID',
      'shingles-height-feet': shinglesHeightFeetController.text,
      'shingles-height-inches': shinglesHeightInchController.text,
      'shingles-width-feet': shinglesWidthFeetController.text,
      'shingles-width-inches': shinglesWidthInchController.text,
      'shingle-style': '$_shinglesTypeID',
      'plywood-height-feet': plywoodHeightFeetController.text,
      'plywood-height-inches': plywoodHeightInchController.text,
      'plywood-width-feet': plywoodWidthFeetController.text,
      'plywood-width-inches': plywoodWidthInchController.text,
      'ice-and-water-shield-height-feet': iceHeightFeetController.text,
      'ice-and-water-shield-width-feet': iceWidthFeetController.text,
      'ice-and-water-shield-width-inches': iceWidthInchController.text,
      'ice-and-water-shield-height-inches': iceHeightInchController.text,
      'torch-on-height-feet': torchHeightFeetController.text,
      'torch-on-height-inches': torchHeightInchController.text,
      'torch-on-width-feet': torchWidthFeetController.text,
      'torch-on-width-inches': torchWidthInchController.text,
      'tough-guard-height-feet': toughHeightFeetController.text,
      'tough-guard-height-inches': toughHeightInchController.text,
      'tough-guard-width-feet': toughWidthFeetController.text,
      'tough-guard-width-inches': toughWidthInchController.text,
      'type': typeList,
      'window-style': windowList,
      'quantity': windowQuantityController.text,
      'size-height-feet': windowSizeHeightFeetController.text,
      'size-height-inches': windowSizeHeightInchController.text,
      'size-width-feet': windowSizeWidthFeetController.text,
      'size-width-inches': windowSizeWidthInchController.text,
      'type-one': type1List,
      'window-style-one': window1List,
      'quantity-one': windowQuantity1Controller.text,
      'size-height-feet-one': windowSize1HeightFeetController.text,
      'size-height-inches-one': windowSize1HeightInchController.text,
      'size-width-feet-one': windowSize1WidthFeetController.text,
      'size-width-inches-one': windowSize1WidthInchController.text,
      'type-two': type2List,
      'window-style-two': window2List,
      'quantity-two': windowQuantity2Controller.text,
      'size-height-feet-two': windowSize2HeightFeetController.text,
      'size-height-inches-two': windowSize2HeightInchController.text,
      'size-width-feet-two': windowSize2WidthFeetController.text,
      'size-width-inches-two': windowSize2WidthInchController.text,
      'location': locationList,
      'door-type': doorTypeList,
      'metirial': _materialId,
      'orientation': orientationList,
      'door-quantity': doorQuantityController.text,
      'door-size-height-feet': doorSizeHeightFeetController.text,
      'door-size-height-inches': doorSizeHeightInchController.text,
      'door-size-width-feet': doorSizeWidthFeetController.text,
      'door-size-width-inches': doorSizeWidthInchController.text,
      'location-one': location1List,
      'door-type-one': doorTypeList,
      'meterial-one': _materialId1,
      'orientation-one': orientation1List,
      'door-quantity-one': doorQuantity1Controller.text,
      'door-size-height-feet-one': doorSize1HeightFeetController.text,
      'door-size-height-inches-one': doorSize1HeightInchController.text,
      'door-size-width-feet-one': doorSize1WidthFeetController.text,
      'door-size-width-inches-one': doorSize1WidthInchController.text,
      'location-two': location2List,
      'door-type-two': doorType2List,
      'meterial-two': _materialId2,
      'orientation-two': orientation2List,
      'door-quantity-two': doorQuantity2Controller.text,
      'door-size-height-feet-two': doorSize2HeightFeetController.text,
      'door-size-height-inches-two': doorSize2HeightInchController.text,
      'door-size-width-feet-two': doorSize2WidthFeetController.text,
      'door-size-width-inches-two': doorSize2WidthInchController.text,
      'service-entrance': serviceEntList,
      'service-pole': servicePoleList,
      'meter-can-size': eleMeterSizeController.text,
      'meter-switch-size': eleMeterSizeController.text,
      'interior-flooding': yerornoList,
      'flooding-height-feet': elaFloadingFeetController.text,
      'flooding-height-inches': elaFloadingInchController.text,
      'ground-rod': groundRodList,
      'ground-clamp': groundClampList,
      'ground-wire': groundWireList,
      'water-supply': groundWatersupplyList,
      'water-closet': groundWaterClosestList,
      '1/2-service-pipe': servicePipeList,
      'length-of-damage-feet': plumingLengthFeetController.text,
      'length-of-damage-inches': plumingLengthInchController.text,
      '3/2-service-pipe': servicePipe1List,
      'length-of-damage-feet-one': plumingServiceFeetController.text,
      'length-of-damage-inches-one': plumingServiceInchController.text,
      '1-service-pipe': servicePipe2List,
      'length-of-damage-feet-two': plumingService1FeetController.text,
      'length-of-damage-inches-two': plumingService1InchController.text,
      'form_type': 'create',
      'request_id': '${widget.ids}'
    };

    _updateDetail(data);

    print('CHEKKKKKKKKKK VALUESSSSSSS 1111 ${data}');
  }

  void _updateDetail(_datas) async {
    setState(() {
      isLoading = true;
    });

    dynamic res = await _apiClient.damagesApi(_datas, widget.ids);
    setState(() {
      isLoading = false;
    });
    if (res?.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Assessment Form Store Successfully'),
        backgroundColor: Colors.green.shade300,
      ));
      widget.tabonTab!(list:[true,false,true]);
      widget.tabController.animateTo(1);
    } else {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res.data['error']),
          backgroundColor: Colors.red.shade300,
        ),
      );
    }
  }

  save(String accessToken) async {
    localStorage.setString('access_token', accessToken);
  }

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
    }
  }

  void prefildata() {



    if(dataList.soffitType != "NA") {
      for (int ii = 0; ii < firstDropDownList.length; ii++) {
        if (firstDropDownList[ii].id == dataList.soffitType!) {
          setState(() {

            _sofiTypeID = dataList.soffitType!;
            _currentSelectedValue = firstDropDownList[ii];
          });
        }
      }
    }

    if(dataList.shingleStyle != "NA") {
      for (int ii = 0; ii < secondDropDownList.length; ii++) {
        if (secondDropDownList[ii].id == dataList.shingleStyle!) {
          setState(() {

            _shinglesTypeID = dataList.shingleStyle!;
            _currentSecondSelectedValue = secondDropDownList[ii];
          });
        }
      }
    }


    if(dataList.type != "NA") {
      String _types = dataList.type!;
      List<String> tList = _types.split(",");

      for (int ci = 0; ci < tList.length; ci++) {
        if (tList[ci] == "NON-IMPACT") {
          setState(() {
            typeNonImpact = true;
          });
        }


        if (tList[ci] == "HURRICANE IMPACT") {
          setState(() {
            typeHurImpact = true;
          });
        }


        print(tList);
      }
    }


    if(dataList.typeOne != "NA") {
      String _firsttypes = dataList.typeOne!;
      List<String> tOneList = _firsttypes.split(",");

      for (int ci = 0; ci < tOneList.length; ci++) {
        if (tOneList[ci] == "NON-IMPACT") {
          setState(() {
            typeNonImpact = true;
          });
        }


        if (tOneList[ci] == "HURRICANE IMPACT") {
          setState(() {
            typeHurImpact = true;
          });
        }


        print(tOneList);
      }
    }

    if(dataList.typeTwo != "NA") {
      String _secondTypes = dataList.typeOne!;
      List<String> tTwoList = _secondTypes.split(",");

      for (int ci = 0; ci < tTwoList.length; ci++) {
        if (tTwoList[ci] == "NON-IMPACT") {
          setState(() {
            typeNonImpact = true;
          });
        }


        if (tTwoList[ci] == "HURRICANE IMPACT") {
          setState(() {
            typeHurImpact = true;
          });
        }


        print(tTwoList);
      }
    }

    if(dataList.windowStyle != "NA"){

    String _windowStyles = dataList.windowStyle!;
    List<String> clist = _windowStyles.split(",");

    for(int ci = 0; ci<clist.length; ci++){

      if(clist[ci] == "AWNING"){

        setState(() {
          windowAwing = true;
        });

      }


      if(clist[ci] == "SLIDER"){

        setState(() {
          windowSlider = true;
        });

      }


      if(clist[ci] == "COLONIAL"){

        setState(() {
          windowcolonial = true;
        });

      }

      if(clist[ci] == "PUSH UP"){

        setState(() {
          windowpush = true;
        });

      }
    }

    print(clist);
    }

    if(dataList.windowStyleOne != "NA"){

      String _windowStylesOne = dataList.windowStyleOne!;
      List<String> windowOnelist = _windowStylesOne.split(",");

      for(int ci = 0; ci<windowOnelist.length; ci++){

        if(windowOnelist[ci] == "AWNING"){

          setState(() {
            windowAwing1 = true;
          });

        }


        if(windowOnelist[ci] == "SLIDER"){

          setState(() {
            windowSlider1 = true;
          });

        }


        if(windowOnelist[ci] == "COLONIAL"){

          setState(() {
            windowcolonial1 = true;
          });

        }

        if(windowOnelist[ci] == "PUSH UP"){

          setState(() {
            windowpush1 = true;
          });

        }
      }

      print(windowOnelist);
    }


    if(dataList.windowStyleTwo != "NA"){

      String _windowStylesTwo = dataList.windowStyleTwo!;
      List<String> windowTwolist = _windowStylesTwo.split(",");

      for(int ci = 0; ci<windowTwolist.length; ci++){

        if(windowTwolist[ci] == "AWNING"){

          setState(() {
            windowAwing1 = true;
          });

        }


        if(windowTwolist[ci] == "SLIDER"){

          setState(() {
            windowSlider1 = true;
          });

        }


        if(windowTwolist[ci] == "COLONIAL"){

          setState(() {
            windowcolonial1 = true;
          });

        }

        if(windowTwolist[ci] == "PUSH UP"){

          setState(() {
            windowpush1 = true;
          });

        }
      }

      print(windowTwolist);
    }


    if(dataList.location != "NA") {
      String _locations = dataList.location!;
      List<String> lList = _locations.split(",");

      for (int ci = 0; ci < lList.length; ci++) {
        if (lList[ci] == "INTERIOR") {
          setState(() {
            locationInterior = true;
          });
        }


        if (lList[ci] == "EXTERIOR") {
          setState(() {
            locationExterrior = true;
          });
        }


        print(lList);
      }
    }


    if(dataList.locationOne != "NA") {
      String _locationOne = dataList.locationOne!;
      List<String> lOneList = _locationOne.split(",");

      for (int ci = 0; ci < lOneList.length; ci++) {
        if (lOneList[ci] == "INTERIOR") {
          setState(() {
            locationInterior1 = true;
          });
        }


        if (lOneList[ci] == "EXTERIOR") {
          setState(() {
            locationExterrior1 = true;
          });
        }


        print(lOneList);
      }
    }

    if(dataList.locationTwo != "NA") {
      String _locationTwo = dataList.locationTwo!;
      List<String> lTwoList = _locationTwo.split(",");

      for (int ci = 0; ci < lTwoList.length; ci++) {
        if (lTwoList[ci] == "INTERIOR") {
          setState(() {
            locationInterior2 = true;
          });
        }


        if (lTwoList[ci] == "EXTERIOR") {
          setState(() {
            locationExterrior2 = true;
          });
        }


        print(lTwoList);
      }
    }



    if(dataList.doorType != "NA") {
      String _doorType = dataList.doorType!;
      List<String> _doorTypeList = _doorType.split(",");

      for (int ci = 0; ci < doorTypeList.length; ci++) {
        if (_doorTypeList[ci] == "SOLID CORE") {
          setState(() {
            locationSolidCore = true;
          });
        }


        if (_doorTypeList[ci] == "HOLLOW CORE") {
          setState(() {
            locationHollow = true;
          });
        }


        print(doorTypeList);
      }
    }


    if(dataList.doorTypeOne != "NA") {
      String _doorTypeOne = dataList.doorTypeOne!;
      List<String> _doorTypeOneList = _doorTypeOne.split(",");

      for (int ci = 0; ci < _doorTypeOneList.length; ci++) {
        if (_doorTypeOneList[ci] == "SOLID CORE") {
          setState(() {
            locationSolidCore1 = true;
          });
        }


        if (_doorTypeOneList[ci] == "HOLLOW CORE") {
          setState(() {
            locationHollow1 = true;
          });
        }


        print(_doorTypeOneList);
      }
    }


    if(dataList.doorTypeTwo != "NA") {
      String _doorTypeTwo = dataList.doorTypeTwo!;
      List<String> _doorTypeTwoList = _doorTypeTwo.split(",");

      for (int ci = 0; ci < _doorTypeTwoList.length; ci++) {
        if (_doorTypeTwoList[ci] == "SOLID CORE") {
          setState(() {
            locationSolidCore2 = true;
          });
        }


        if (_doorTypeTwoList[ci] == "HOLLOW CORE") {
          setState(() {
            locationHollow2 = true;
          });
        }


        print(_doorTypeTwoList);
      }
    }

    if(dataList.orientation != "NA") {
      String _orientation = dataList.orientation!;
      List<String> _orientationList = _orientation.split(",");

      for (int ci = 0; ci < _orientationList.length; ci++) {
        if (_orientationList[ci] == "LH - REVERSE SWING") {
          setState(() {
            orientation_LH_Rverse = true;
          });
        }


        if (_orientationList[ci] == "LH - OUT SWING") {
          setState(() {
            orientation_LH_Out = true;
          });
        }

        if (_orientationList[ci] == "RH - REVERSE SWING") {
          setState(() {
            orientation_RH_Rverse = true;
          });
        }


        if (_orientationList[ci] == "RH - OUT SWING") {
          setState(() {
            orientation_RH_Out = true;
          });
        }



        print(_orientationList);
      }
    }

    if(dataList.orientationOne != "NA") {
      String _orientationOne = dataList.orientationOne!;
      List<String> _orientationOneList = _orientationOne.split(",");

      for (int ci = 0; ci < _orientationOneList.length; ci++) {
        if (_orientationOneList[ci] == "LH - IN") {
          setState(() {
            orientation_LH_Rverse1 = true;
          });
        }


        if (_orientationOneList[ci] == "LH - OUT") {
          setState(() {
            orientation_LH_Out1 = true;
          });
        }

        if (_orientationOneList[ci] == "RH - IN") {
          setState(() {
            orientation_RH_Rverse1 = true;
          });
        }


        if (_orientationOneList[ci] == "RH - OUT") {
          setState(() {
            orientation_RH_Out1 = true;
          });
        }



        print(_orientationOneList);
      }
    }

    if(dataList.orientationTwo != "NA") {
      String _orientationTwo = dataList.orientationTwo!;
      List<String> _orientationTwoList = _orientationTwo.split(",");

      for (int ci = 0; ci < _orientationTwoList.length; ci++) {
        if (_orientationTwoList[ci] == "LH - IN") {
          setState(() {
            orientation_LH_Rverse2 = true;
          });
        }


        if (_orientationTwoList[ci] == "LH - OUT") {
          setState(() {
            orientation_LH_Out2 = true;
          });
        }

        if (_orientationTwoList[ci] == "RH - IN") {
          setState(() {
            orientation_RH_Rverse2 = true;
          });
        }


        if (_orientationTwoList[ci] == "RH - OUT") {
          setState(() {
            orientation_RH_Out2 = true;
          });
        }



        print(_orientationTwoList);
      }
    }


    if(dataList.serviceEntrance != "NA") {
      String _serviceEntrance = dataList.serviceEntrance!;
      List<String> _serviceEntranceList = _serviceEntrance.split(",");

      for (int ci = 0; ci < _serviceEntranceList.length; ci++) {
        if (_serviceEntranceList[ci] == "Needs Repair") {
          setState(() {
            serviceRepair = true;
          });
        }


        if (_serviceEntranceList[ci] == "Needs Replacement") {
          setState(() {
            serviceReplacement = true;
          });
        }
        print(_serviceEntranceList);
      }
    }
    if(dataList.servicePole != "NA") {
      String _servicePole = dataList.servicePole!;
      List<String> _servicePoleList = _servicePole.split(",");

      for (int ci = 0; ci < _servicePoleList.length; ci++) {
        if (_servicePoleList[ci] == "Needs Repair") {
          setState(() {
            servicePoleRepair = true;
          });
        }


        if (_servicePoleList[ci] == "Needs Replacement") {
          setState(() {
            servicePoleReplacement = true;
          });
        }





        print(_servicePoleList);
      }
    }



    if(dataList.groundRod != "NA") {
      String _groundRod = dataList.groundRod!;

      if(_groundRod == "Needs Replacement"){

        eleGroundRod = true;
      }


    }

    if(dataList.groundClamp != "NA") {
      String _groundClamp = dataList.groundClamp!;

      if(_groundClamp == "Needs Replacement"){

        eleGroundClamp = true;
      }


    }

    if(dataList.groundWire != "NA") {
      String _groundWire = dataList.groundWire!;

      if(_groundWire == "Needs Replacement"){

        eleGroundwire = true;
      }


    }

    if(dataList.waterSupply != "NA") {
      String _waterSupply = dataList.waterSupply!;

      if(_waterSupply == "Needs Repair"){

        plumingwater = true;
      }


    }


    if(dataList.waterCloset != "NA") {
      String _waterCloset = dataList.waterCloset!;
      List<String> _waterClosetList = _waterCloset.split(",");

      for (int ci = 0; ci < _waterClosetList.length; ci++) {
        if (_waterClosetList[ci] == "Needs Repair") {
          setState(() {
            plumingwaterclosetRepair = true;
          });
        }


        if (_waterClosetList[ci] == "Needs Replacement") {
          setState(() {
            plumingwaterclosetReplacment = true;
          });
        }





        print(_waterClosetList);
      }
    }


    if(dataList.s12ServicePipe != "NA") {
      String _s12ServicePipe = dataList.s12ServicePipe!;

      if(_s12ServicePipe == "Needs Repair"){

        plumingservicePipe1 = true;
      }


    }

    if( dataList.s34ServicePipe != null) {
      if (dataList.s34ServicePipe != "NA") {
        String _s34ServicePipe = dataList.s34ServicePipe!;

        if (_s34ServicePipe == "Needs Repair") {
          plumingservicePipe2 = true;
        }
      }
    }

    if(dataList.s1ServicePipe != "NA") {
      String _s1ServicePipe = dataList.s1ServicePipe!;

      if(_s1ServicePipe == "Needs Repair"){

        plumingservicePipe3 = true;
      }


    }

    evenFeetController.text = dataList.eaveFlashingFeet ?? '';
    evenInchController.text = dataList.eaveFlashingInches ?? '';
    fasciaFeetController.text = dataList.fasciaBoardFeet ?? '';
    fasciaInchController.text = dataList.fasciaBoardInches ?? '';
    soffitHeightInchController.text = dataList.soffitHeightInches ?? '';

    soffitBoardFeetController.text = dataList.soffitHeightFeet ?? '';
    soffitBoardInchController.text = dataList.soffitHeightInches ?? '';
    soffitHeightFeetController.text = dataList.soffitWidthFeet ?? '';
    soffitHeightInchController.text = dataList.soffitWidthInches ?? '';

    shinglesHeightFeetController.text = dataList.shinglesHeightFeet ?? '';
    shinglesHeightInchController.text = dataList.shinglesHeightInches ?? '';
    shinglesWidthFeetController.text = dataList.shinglesWidthFeet ?? '';
    shinglesWidthInchController.text = dataList.shinglesWidthInches ?? '';

    plywoodHeightFeetController.text = dataList.plywoodHeightFeet ?? '';
    plywoodHeightInchController.text = dataList.plywoodHeightInches ?? '';
    plywoodWidthFeetController.text = dataList.plywoodWidthFeet ?? '';
    plywoodWidthInchController.text = dataList.plywoodWidthInches ?? '';
    iceHeightFeetController.text = dataList.iceAndWaterShieldHeightFeet ?? '';
    iceWidthFeetController.text = dataList.iceAndWaterShieldWidthFeet ?? '';
    iceWidthInchController.text = dataList.iceAndWaterShieldWidthInches ?? '';
    iceHeightInchController.text = dataList.iceAndWaterShieldHeightInches ?? '';
    torchHeightFeetController.text = dataList.torchOnHeightFeet ?? '';
    torchHeightInchController.text = dataList.torchOnHeightInches ?? '';
    torchWidthFeetController.text = dataList.torchOnWidthFeet ?? '';
    torchWidthInchController.text = dataList.torchOnWidthInches ?? '';
    toughHeightFeetController.text = dataList.toughGuardHeightFeet ?? '';
    toughHeightInchController.text = dataList.toughGuardHeightInches ?? '';
    toughWidthFeetController.text = dataList.toughGuardWidthFeet ?? '';
    toughWidthInchController.text = dataList.toughGuardWidthInches ?? '';

    windowQuantityController.text = dataList.quantity ?? '';
    windowSizeHeightFeetController.text = dataList.sizeHeightFeet ?? '';
    windowSizeHeightInchController.text = dataList.sizeHeightInches ?? '';
    windowSizeWidthFeetController.text = dataList.sizeWidthFeet ?? '';
    windowSizeWidthInchController.text = dataList.sizeWidthInches ?? '';

    windowQuantity1Controller.text = dataList.quantityOne ?? '';
    windowSize1HeightFeetController.text = dataList.sizeHeightFeetOne ?? '';
    windowSize1HeightInchController.text = dataList.sizeHeightInchesOne ?? '';
    windowSize1WidthFeetController.text = dataList.sizeWidthFeetOne ?? '';
    windowSize1WidthInchController.text = dataList.sizeWidthInchesOne ?? '';
    windowQuantity2Controller.text = dataList.quantityTwo ?? '';
    windowSize2HeightFeetController.text = dataList.sizeHeightFeetTwo ?? '';
    windowSize2HeightInchController.text = dataList.sizeHeightInchesTwo ?? '';
    windowSize2WidthFeetController.text = dataList.sizeWidthFeetTwo ?? '';
    windowSize2WidthInchController.text = dataList.sizeWidthInchesTwo ?? '';

    doorQuantityController.text = dataList.doorQuantity ?? '';
    doorSizeHeightFeetController.text = dataList.doorSizeHeightFeet ?? '';
    doorSizeHeightInchController.text = dataList.doorSizeHeightInches ?? '';
    doorSizeWidthFeetController.text = dataList.doorSizeWidthFeet ?? '';
    doorSizeWidthInchController.text = dataList.doorSizeWidthInches ?? '';

    doorQuantity1Controller.text = dataList.doorQuantityOne ?? '';
    doorSize1HeightFeetController.text = dataList.doorSizeHeightFeetOne ?? '';
    doorSize1HeightInchController.text = dataList.doorSizeHeightInchesOne ?? '';
    doorSize1WidthFeetController.text = dataList.doorSizeWidthInchesOne ?? '';
    doorSize1WidthInchController.text = dataList.doorSizeWidthInchesOne ?? '';

    doorQuantity2Controller.text = dataList.doorQuantityTwo ?? '';
    doorSize2HeightFeetController.text = dataList.doorSizeHeightFeetTwo ?? '';
    doorSize2HeightInchController.text = dataList.doorSizeHeightInchesTwo ?? '';
    doorSize2WidthFeetController.text = dataList.doorSizeWidthFeetTwo ?? '';
    doorSize2WidthInchController.text = dataList.doorSizeWidthInchesTwo ?? '';

    eleMeterSizeController.text = dataList.meterCanSize ?? '';
    eleMeterSizeController.text = dataList.meterSwitchSize ?? '';
    elaFloadingFeetController.text = dataList.floodingHeightFeet ?? '';
    elaFloadingInchController.text = dataList.floodingHeightInches ?? '';
    plumingLengthFeetController.text = dataList.lengthOfDamageFeet ?? '';
    plumingLengthInchController.text = dataList.lengthOfDamageInches ?? '';
    plumingServiceFeetController.text = dataList.lengthOfDamageFeetOne ?? '';
    plumingServiceInchController.text = dataList.lengthOfDamageInchesOne ?? '';
    plumingService1FeetController.text = dataList.lengthOfDamageFeetTwo ?? '';
    plumingService1InchController.text = dataList.lengthOfDamageInchesTwo ?? '';

  }

  fetchData() async {
    setState(() {
      isLoading = true;
    });

    var accessToken = '';
    await SharedPreferences.getInstance().then((token) {
      accessToken = token.getString("accessToken")!;
    });

    print('tok${widget.ids}');

    final response = await get(
        Uri.parse(
            '${BASE_URL}assessments/assessment_detail/${widget.ids}'),
        headers: {'Authorization': 'Bearer ${accessToken}'});
    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      print(response.body);
      dataList = AssessmentDetailsList.fromJson(
          json.decode(response.body)['assessmentDetailsList']);

      prefildata();

      print("IMAGESSSSSSSSSSS${dataList.damageSnaps}");

    } else {
      setState(() {
        isLoading = false;
      });

      throw Exception('Unexpected error occured!');
    }
  }
}

class DropListModel {
  String name;
  String id;
  DropListModel(this.name, this.id);
}
