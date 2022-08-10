import 'package:flutter/material.dart';
import 'basic_screen.dart';
import 'camera_access.dart';
import 'comments_screen.dart';
import 'damages_screen.dart';
import 'ui/login_ui/login_page.dart';

class AssesmentPage extends StatefulWidget {
  const AssesmentPage({Key? key, required this.str_id}) : super(key: key);

  final String str_id;

  @override
  State<AssesmentPage> createState() => _AssesmentPageState();
}

class _AssesmentPageState extends State<AssesmentPage> with TickerProviderStateMixin{
  late TabController myTabController;
  int _currentTab=0;

  List<bool> _isDisabled = [false, true,true];
  final List<Widget> _tabs = <Tab>[
    Tab(text: "Damages"),
    Tab(text: "Comments"),
    Tab(text: "Add Photo"),
  ];
  @override
  void initState() {

    super.initState();
   myTabController=TabController(initialIndex: 0,length: _tabs.length,vsync: this);
    myTabController.addListener(onTaps);

  }

  @override
  void dispose() {
    myTabController.dispose();
    super.dispose();
  }
  onTaps() {
    if (_isDisabled[myTabController.index]) {
      int index = myTabController.previousIndex;
      setState(() {
        myTabController.index = index;
      });
    }
  }

  enableTabs({required List<bool> list} ){

    print("vcxvxvsvdsvdsv");

    _isDisabled=list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Assesment Form',
              style:
              TextStyle(fontSize: 16, fontFamily: 'San Francisco'),
            ),
            // Text('#12AAG3GDG4DFS643',
            //     style: TextStyle(
            //         fontSize: 14, fontFamily: 'San Francisco'))
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Basic(ids: '${widget.str_id}',)));
            },
            icon: Icon(Icons.arrow_back_outlined)),
        backgroundColor: Color(0xff16698c),
        centerTitle: true,
        bottom: TabBar(
          controller: myTabController,
          // controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          // controller: controller,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 4,
              color: Color(0xff00b3bf),
            ),
          ),
          tabs: [
            Tab(text: "Damages"),
            Tab(text: "Comments"),
            Tab(text: "Add Photo"),
          ],
        ),
      ),

      body: TabBarView(
        controller: myTabController,
        physics: NeverScrollableScrollPhysics(),
        //  controller: controller,
        children: [
          Damages(tabController: this.myTabController, ids: '${widget.str_id}', tabonTab: enableTabs,),
          Comments(tabController: this.myTabController, str_id: '${widget.str_id}',tabonTab: enableTabs),
          AddPhoto(tabController: this.myTabController, strIds: '${widget.str_id}',tabonTab: enableTabs),
        ],
      ),
    );
  }
}
