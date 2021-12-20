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

  Duration animationDuration = Duration(milliseconds: 700);
  @override
  void initState() {
    super.initState();
    idleAnimation = AnimationController(vsync: this);
    _children= [
      Container(color: Colors.yellow),
      Container(color: Colors.greenAccent),
      Container(color: Colors.orange),
      Container(color: Colors.red),
      Container(color: Colors.brown),
    ];
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
        bottomNavigationBar: BottomNavigationBar(
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
                  height: 40,
                  controller: _selectedIndex == 0
                      ? onSelectedAnimation
                      : previousIndex == 0
                      ? onChangedAnimation
                      : idleAnimation),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Lottie.asset("assets/lottie/locate.json",
                  height: 40,
                  controller: _selectedIndex == 1
                      ? onSelectedAnimation
                      : previousIndex == 1
                      ? onChangedAnimation
                      : idleAnimation),
              label: "My Products",
            ),
            BottomNavigationBarItem(
              icon: Lottie.asset("assets/lottie/shop.json",
                  height: 40,
                  controller: _selectedIndex == 2
                      ? onSelectedAnimation
                      : previousIndex == 2
                      ? onChangedAnimation
                      : idleAnimation),
              label: "EStore",
            ),
            BottomNavigationBarItem(
              icon: Lottie.asset("assets/lottie/profile.json",
                  height: 40,
                  controller: _selectedIndex == 3
                      ? onSelectedAnimation
                      : previousIndex == 3
                      ? onChangedAnimation
                      : idleAnimation),
              label: "EStore",
            ),
            BottomNavigationBarItem(
              icon: Lottie.asset("assets/lottie/More.json",
                  height: 40,
                  controller: _selectedIndex == 4
                      ? onSelectedAnimation
                      : previousIndex == 4
                      ? onChangedAnimation
                      : idleAnimation),
              label: "More",
            ),
          ],
        ),

        body: _children[_selectedIndex]
    );
  }
}
