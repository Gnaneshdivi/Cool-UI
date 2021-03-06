import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Screen1 extends StatefulWidget {
  @override
  State createState() {
    return Screen1State();
  }
}

class Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Group 1",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Dropdown(),
            Dropdown(),
            Dropdown(),
            Divider(
              color: Colors.black,
              thickness: 3,
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Group 2",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Dropdown(),
            Dropdown(),
            Dropdown(),
            Divider(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  bool pump = false;

  @override
  Widget build(BuildContext context) {
    buildCollapsed2() {
      return Container(
        color: Colors.lightGreen,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Row(children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: Text(
                                "I",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "AGI",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Text(
                    "Field1 - Zone 1",
                    style: TextStyle(fontSize: 30),
                  )
                ]),
              ),
              Builder(
                builder: (context) {
                  var controller = ExpandableController.of(context);
                  return IconButton(
                    icon: controller.expanded
                        ? Icon(Icons.arrow_drop_up)
                        : Icon(Icons.arrow_drop_down),
                    iconSize: 50,
                    onPressed: () {
                      controller.toggle();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    buildCollapsed3() {
      return Container();
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 40),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '32',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'ml/sec',
                                style: TextStyle(fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "FLOW",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 40),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (pump) {
                              pump = false;
                            } else {
                              pump = true;
                            }
                          });
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              !pump ? "ON" : "OFF",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          height: 100,
                          width: 100,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        "PUMP",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 80),
              child: Row(
                children: [
                  Container(
                      height: 50,
                      width: 100,
                      color: pump ? Colors.blue : Colors.grey,
                      child: Center(
                        child: Text(
                          "ON",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )),
                  Container(
                      height: 50,
                      width: 100,
                      color: pump ? Colors.grey : Colors.blue,
                      child: Center(
                        child: Text(
                          "OFF",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      );
    }

    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildCollapsed2(),
              Expandable(
                collapsed: buildCollapsed3(),
                expanded: buildExpanded3(),
              ),
              Divider(
                height: 1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
