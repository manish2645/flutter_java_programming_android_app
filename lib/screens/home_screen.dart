import 'package:flutter/material.dart';
import 'package:learn_java_program/widgets/compilerWidgets.dart';
import 'package:learn_java_program/widgets/homeWidgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // Navigation functionality start
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    NavHomeScreen(),
    Text(
      'Wishlist',
      style: optionStyle,
    ),
    Text(
      'Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  // end



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: const Text("Learn Java Programming"),
        actions: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.notifications),
              ),
              Padding(padding: EdgeInsets.only(right: 10),
                child: PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  color: Colors.white,
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Logout",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                  onSelected: ((value) => {print(value)}),
                ), 
              ),
            ]),
          ],
        ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: Color.fromARGB(255, 56, 142, 60)),
            accountName: Text(
              "Manish Kumar Singh",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "21mca3210@cuchd.in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
            ),
            title: const Text('Dashboard'),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
            ),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.code,
            ),
            title: const Text('Java Compiler'),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompilerScreen()));
            },
          ),
          AboutListTile(
            // <-- SEE HERE
            icon: Icon(
              Icons.info,
            ),
            child: Text('About app'),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'Learn Java Programming',
            applicationVersion: '1.0.0',
            applicationLegalese: '© 2023 Insane Coder',
            aboutBoxChildren: [
              ///Content goes here...
            ],
          ),
        ],
      )),
     body:Center(child: 
         _widgetOptions.elementAt(_selectedIndex),
     ),

      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: Colors.green[700],
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

