import 'package:flutter/material.dart';

enum BottomIcons {
  Home,
  Store,
  Add,
  Explore,
  Profile,
}

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  BottomIcons bottomIcons;
  double position = 0;
  double width;
  bool first;

  _onTap1(pos, wid) {
    setState(() {
      bottomIcons = BottomIcons.Home;
      position = pos;
      this.width = wid;
      this.first = false;
    });
  }

  _onTap2(pos, wid) {
    setState(() {
      bottomIcons = BottomIcons.Store;
      position = pos;
      this.width = wid;
      this.first = false;
    });
  }

  _onTap3(pos, wid) {
    setState(() {
      bottomIcons = BottomIcons.Add;
      position = pos;
      this.width = wid;
      this.first = false;
    });
  }

  _onTap4(pos, wid) {
    setState(() {
      bottomIcons = BottomIcons.Explore;
      position = pos;
      this.width = wid;
      this.first = false;
    });
  }

  _onTap5(pos, wid) {
    setState(() {
      bottomIcons = BottomIcons.Profile;
      position = pos;
      this.width = wid;
      this.first = false;
    });
  }

  @override
  void initState() {
    super.initState();
    bottomIcons = BottomIcons.Home;
    first = true;
  }

  @override
  Widget build(BuildContext context) {
    // full Screen Width
    final screenWidth = MediaQuery.of(context).size.width;

    // Divide full screen width by 5
    double width = screenWidth * 0.2;

    // Cover Box
    double boxWidth = width + (width * 0.25);
    double boxHeight = 50.0;
    double bottomMargin = 5;

// Starting Positions of NavigationBarItems
    double icon1Pos = 0;
    double icon2Pos = width;
    double icon3Pos = width * 2 + (width * .2);
    double icon4Pos = (width * 3) - (width * .2);
    double icon5Pos = (width * 4) - (width * .1);

    TextStyle style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white);

    return Container(
      color: Colors.white,
      width: screenWidth,
      height: 60,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
// Black Animated Box Cover
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: bottomMargin,
            left: position + (width * 0.1),
            height: boxHeight,
            width: (first == true) ? boxWidth - (width * 0.1) : this.width,
            child: Container(
              width: this.width,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
            ),
          ),

// Home Navigation Bar
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            left: icon1Pos,
            bottom: bottomMargin,
            width: (bottomIcons == BottomIcons.Home) ? boxWidth : width,
            height: boxHeight,
            child: Container(
              child: GestureDetector(
                onTap: () {
                  _onTap1(icon1Pos, (boxWidth - (width * 0.1)));
                },
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: (bottomIcons == BottomIcons.Home)
                      ? EdgeInsets.only(left: 10)
                      : EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: (bottomIcons == BottomIcons.Home)
                            ? Colors.white
                            : Colors.black,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      (bottomIcons == BottomIcons.Home)
                          ? Text(
                              "Home",
                              style: style,
                            )
                          : Text(""),
                    ],
                  ),
                ),
              ),
            ),
          ),
// Store Navigation Bar
          AnimatedPositioned(
            left: icon2Pos,
            bottom: bottomMargin,
            width: (bottomIcons == BottomIcons.Store) ? boxWidth : width,
            height: boxHeight,
            duration: Duration(seconds: 1),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  _onTap2(icon2Pos, boxWidth - ((width * 0.1)));
                },
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: (bottomIcons == BottomIcons.Store)
                      ? EdgeInsets.only(left: 10)
                      : EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.store,
                        color: (bottomIcons == BottomIcons.Store)
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(width: 4),
                      (bottomIcons == BottomIcons.Store)
                          ? Text(
                              "Store",
                              style: style,
                            )
                          : Text(""),
                    ],
                  ),
                ),
              ),
            ),
          ),
// Add Navigation Bar
          AnimatedPositioned(
            left: icon3Pos,
            bottom: bottomMargin,
            width: boxWidth / 2,
            height: boxHeight,
            duration: Duration(seconds: 1),
            child: Container(
              // color: Colors.grey,
              child: GestureDetector(
                onTap: () {
                  _onTap3(
                    (icon3Pos - (width * 0.1)),
                    (boxWidth / 2) ,
                  );
                  showBottomSheet(
                      context: context,
                      builder: (BuildContext context) => Container(
                            child: Wrap(
                              children: <Widget>[
                                ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text('camera'),
                                    onTap: () => {}),
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Choose from Gallery'),
                                  onTap: () => {},
                                ),
                                ListTile(
                                  leading: Icon(Icons.edit),
                                  title: Text("Write a Story"),
                                  onTap: () {},
                                )
                              ],
                            ),
                          ));
                },
                child: Container(
                  child: Icon(
                    Icons.add,
                    color: (bottomIcons == BottomIcons.Add)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),

// Explore Navigation Bar
          AnimatedPositioned(
            left: icon4Pos,
            bottom: bottomMargin,
            width: (bottomIcons == BottomIcons.Explore) ? boxWidth : width + 10,
            height: boxHeight,
            duration: Duration(seconds: 1),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  _onTap4(icon4Pos, boxWidth);
                },
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: (bottomIcons == BottomIcons.Explore)
                      ? EdgeInsets.only(left: 10)
                      : EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.explore,
                        color: (bottomIcons == BottomIcons.Explore)
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(width: 4),
                      (bottomIcons == BottomIcons.Explore)
                          ? Text(
                              "Explore",
                              style: style,
                            )
                          : Text(""),
                    ],
                  ),
                ),
              ),
            ),
          ),

// Profile Navigation Bar
          AnimatedPositioned(
            left: icon5Pos,
            bottom: bottomMargin,
            width: boxWidth,
            height: boxHeight,
            duration: Duration(seconds: 1),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  _onTap5(
                      (icon5Pos - (width * 0.1)), (boxWidth - (width * 0.23)));
                },
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  padding: (bottomIcons == BottomIcons.Profile)
                      ? EdgeInsets.only(right: 15)
                      : EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: (bottomIcons == BottomIcons.Profile)
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(width: 2),
                      (bottomIcons == BottomIcons.Profile)
                          ? Text(
                              "Profile",
                              style: style,
                            )
                          : Text(""),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
