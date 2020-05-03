import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/packageLib.dart';
import 'package:philanthroctor/ui/appDrawer.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;
  List<Tab> _tabs = <Tab>[];
  List<Widget> _tabViews = [];
  int fabIndex = 0;
  List<FloatingActionButton> _fabs;
  // = [
  //   FloatingActionButton(
  //       child: Icon(
  //         Icons.add,
  //         size: 35,
  //         // color: Theme.of(context).primaryColor,
  //       ),
  //       onPressed: () {}),
  //   null,
  //   null
  // ];

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 3, vsync: this);
    _tabs = [
      Tab(
        icon: Icon(
          Icons.home,
        ),
        child: Text(
          'Home',
        ),
      ),
      Tab(
        icon: Icon(Icons.pie_chart),
        text: 'Dashboard',
      ),
      Tab(
        icon: Icon(Icons.chat),
        text: 'Chat',
      )
    ];
    _tabViews = [
      UserHome(),
      DashBoard(),
      AppMessage(),
    ];

    _tabcontroller.addListener(_getFab);
    fabIndex = _tabcontroller.index;
  }

  void _getFab() {
    setState(() {
      fabIndex = _tabcontroller.index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fabs = [
      FloatingActionButton(
          //  clipBehavior:,
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.add,
            size: 45,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/newCase');
          }),
      null,
      null
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Philanthroctor',
          style: GoogleFonts.dancingScript(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: TabBarView(
        children: _tabViews,
        controller: _tabcontroller,
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        notchMargin: 8,
        color: Theme.of(context).accentColor,
        shape: CircularNotchedRectangle(),
        child: buildBottomBar(context),
      ),
      drawer: AppDrawer(),
      floatingActionButton: _fabs[fabIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Material buildBottomBar(BuildContext context) {
    return Material(
        color: Theme.of(context).primaryColor,
        elevation: 10.0,
        child: Container(
          height: 65.0,
          child: TabBar(
            tabs: _tabs,
            controller: _tabcontroller,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 10.0,
            indicatorColor: Theme.of(context).accentColor,
          ),
        ));
  }
}
