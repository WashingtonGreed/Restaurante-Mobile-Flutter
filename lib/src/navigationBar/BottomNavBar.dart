import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:restaurantemobileflutter/src/02.home/home-bloc.dart';
import 'package:restaurantemobileflutter/src/03.profile/profile-bloc.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  final Home _homePage = new Home();

  Widget _showPage = new Home();

  void changePage(int index) {
    setState(() {
      currentIndex = index;
      _showPage = _pageChoose(currentIndex);
    });
  }

  Widget _pageChoose(int page) {
    switch (page) {
      case 0:
        return _homePage;
        break;
      case 1:
        return Scaffold(
            appBar: AppBar(
          title: Text("Agendados"),
        ));
        break;
      case 2:
        return Scaffold(
            appBar: AppBar(
          title: Text("Favoritos"),
        ));
        break;
      case 3:
        return Scaffold(
            appBar: AppBar(
          title: Text("Favoritos"),
        ));
        break;
      default:
        return _homePage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profilebloc()),
            );
          },
          child: Icon(Icons.menu),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor:
              Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.deepPurple,
                icon: Icon(
                  Icons.access_time,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.access_time,
                  color: Colors.deepPurple,
                ),
                title: Text("Agendar")),
            BubbleBottomBarItem(
                backgroundColor: Colors.blueAccent,
                icon: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                activeIcon: Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                ),
                title: Text("Favoritos")),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.chat,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.chat,
                  color: Colors.green,
                ),
                title: Text("Chat"))
          ],
        ),
        body: Container(
          color: Colors.grey[900],
          child: Center(
            child: _showPage,
          ),
        ));
  }
}
