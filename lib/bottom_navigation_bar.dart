import 'package:bottom_navigate_lottie/Home.dart';
import 'package:bottom_navigate_lottie/Locate.dart';
import 'package:bottom_navigate_lottie/Shop.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  AnimationController idleAnimation;
  AnimationController onSelectedAnimation;
  AnimationController onChangedAnimation;
  List<Widget> _children;

  var _selectedIndex = 0;
  var previousIndex;
  bool showBottomBar;


  Duration animationDuration = Duration(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    idleAnimation = AnimationController(vsync: this);
    _children= [
      Home((bool status) {
        getBottomBarStatus(status);
      }
    ),
      Locate(),
      Shop(),
    ];
    showBottomBar = true;
    onSelectedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
    onChangedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    super.dispose();
    idleAnimation.dispose();
    onSelectedAnimation.dispose();
    onChangedAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AnimatedContainer(
          height: showBottomBar ? 70: 0,
          duration: const Duration(milliseconds: 400),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: (index) {
              onSelectedAnimation.reset();
              onSelectedAnimation.forward();

              onChangedAnimation.value = 1;
              //onChangedAnimation.reverse();

              setState(() {
                // previousIndex = _selectedIndex;
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Lottie.asset("assets/lottie/home.json",
                    height: 30,
                    controller: _selectedIndex == 0
                        ? onSelectedAnimation
                        : previousIndex == 0
                        ? onChangedAnimation
                        : idleAnimation),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Lottie.asset("assets/lottie/locate.json",
                    height: 35,
                    controller: _selectedIndex == 1
                        ? onSelectedAnimation
                        : previousIndex == 1
                        ? onChangedAnimation
                        : idleAnimation),
                label: "Locate",
              ),
              BottomNavigationBarItem(
                icon: Lottie.asset("assets/lottie/shop.json",
                    height: 30,
                    controller: _selectedIndex == 2
                        ? onSelectedAnimation
                        : previousIndex == 2
                        ? onChangedAnimation
                        : idleAnimation),
                label: "Shop",
              ),
            ],
          ),
        ),

        body: _children[_selectedIndex]
    );
  }


  /// get State of bottom navigation
  void getBottomBarStatus(bool status){
    if(showBottomBar!=status){
      setState(() {
        showBottomBar = status;
      });
    }
  }
}
