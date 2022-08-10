import 'dart:convert';
import 'package:dra_project/models/assessment_list_model.dart';
import 'package:dra_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'change_password.dart';
import 'common/app_constants.dart';
import 'edit_profile.dart';
import 'models/profilescreen_api.dart';


class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileHomeState();
}

class _profileHomeState extends State<profile> {
  late Future<List<ProfilescreenApi>> futureData;
  late SharedPreferences localStorage;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late UserProfile userObjcet;

  List<String> items = List.generate(10, (index) => 'Hello $index');
  fetchData() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences.getInstance().then((token) async {
      var accessToken = token.getString("accessToken")!;
      final response = await post(
          Uri.parse('${BASE_URL}user'),
          headers: {'Authorization': 'Bearer ${accessToken}'});
      if (response.statusCode == 200) {
        userObjcet =
            UserProfile.fromJson((json.decode(response.body)['userProfile']));
        print(userObjcet.toJson());
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Unexpected error occured!');
      }
    });
  }

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var assessmentList = UserProfile();
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),centerTitle: true,
      leading: IconButton(onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(

              )),
        );

      },icon: Icon(Icons.arrow_back_ios_rounded),),
      actions: [IconButton(onPressed: (){

        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) =>
         profscreen()));
      }, icon: Icon(Icons.edit))],
      backgroundColor: Color(0xff16698C),
      ),

        body: !isLoading
            ? SingleChildScrollView(child: Container(
            padding: EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

          Padding(
                  padding: const EdgeInsets.all(5),
                  child: userObjcet.userPhoto!.isNotEmpty ? CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage: NetworkImage(userObjcet.userPhoto!),
                  ): Image.asset('assets/images/img_2.png'),
                ),


                 InkWell(onTap: (){
                   Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                         builder: (context) => Change_Password(email: '',

                         )),
                   );
                 }, child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Change Password",

                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600),
                      ))),

                  SizedBox(height: 30,),

                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                               // margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black38,width: 2)
                                ),
                                child: Text(userObjcet.firstName.toString()),
                              )
                            ],
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              Container(
                                width: double.infinity,
                                // margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black38,width: 2)
                                ),
                                child: Text(userObjcet.lastName.toString()),
                              )

                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    // margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: Text(userObjcet.email.toString()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    // margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: Text(userObjcet.mobileNo.toString()),
                  ),


                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    // margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: Text(userObjcet.address.toString()),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "State",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    // margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: Text(userObjcet.state.toString()),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "City",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    // margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: Text(userObjcet.city.toString()),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Zip code",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    // margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black38,width: 2)
                    ),
                    child: Text(userObjcet.pincode.toString()),
                  ),

                ],
              )))
            : Center(child: CircularProgressIndicator()));
  }
}
