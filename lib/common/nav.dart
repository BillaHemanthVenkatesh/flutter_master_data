import 'package:bus/common/constants.dart';
import 'package:flutter/material.dart';
import 'classs.dart';
import 'course.dart';
import 'constants.dart';

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
     backgroundColor: Constants.navbar,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          // groupAlignment: 0,
          destinations: const [
            NavigationRailDestination(
              label: Text(
                'Classes',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.grid_view_outlined,
                color: Colors.grey,
              ),
              selectedIcon: Icon(
                Icons.grid_view_rounded,
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
                Icons.library_books_rounded,
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