import 'package:flutter/material.dart';
import 'classs.dart';
import 'course.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;
  bool showNavigationBar = false;

  var list = [
    const ClassPage(),
    const CoursePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail(
     backgroundColor: Color.fromARGB(255, 4, 55, 97),
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: const [
            NavigationRailDestination(
              label: Text(
                'Classes',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            NavigationRailDestination(
              label: Text('Courses', style: TextStyle(color: Colors.white)),
              icon: Icon(
                Icons.library_books,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                Icons.library_books,
                color: Colors.white,
              ),
            ),
          ],
          selectedIndex: _selectedIndex,
        ),
        Expanded(
          child: Center(child: list[_selectedIndex]),
        )
      ],
    ));
  }
}