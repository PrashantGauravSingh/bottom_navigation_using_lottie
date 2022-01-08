import 'package:bottom_navigate_lottie/scroll_to_hide.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  Home(this.onScroll);
  final ValueChanged<bool> onScroll;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ScrollController _scrollController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  HideToScrollTab(
      controller: _scrollController,
      onScroll: widget.onScroll,
      child: Container(color: Colors.white,
          child: ListView.builder(
            itemCount: 40,
            controller: _scrollController,
            itemBuilder: (context, position) {
              return Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(position.toString(), style: TextStyle(fontSize: 22.0),),
                ),
              );
            },
          ),
      ),
    );
  }


}
