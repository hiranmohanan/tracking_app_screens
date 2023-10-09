import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileLoginScreen extends StatefulWidget {
  const ProfileLoginScreen({super.key});

  @override
  State<ProfileLoginScreen> createState() => _ProfileLoginScreenState();
}

class _ProfileLoginScreenState extends State<ProfileLoginScreen> {
  double _position = 100;
  bool _unlocked = false;
  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry containermargin = const EdgeInsets.fromLTRB(0, 10, 0, 0);
    EdgeInsetsGeometry containerpadding =
        const EdgeInsets.fromLTRB(0, 20, 0, 20);
    BoxDecoration containerdecoration = const BoxDecoration(
      color: Colors.white,
    );
    TextStyle titlestyle =
        const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    TextStyle listtitlestyle = TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey[800]);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 5,
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            MaterialButton(
                onPressed: () {},
                child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.blue[600]),
                ))
          ]),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          // shrinkWrap: true,

          children: [
            Container(
              margin: containermargin,
              padding: containerpadding,
              decoration: containerdecoration,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Saved places",
                        style: titlestyle,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(CupertinoIcons.home),
                    title: Text(
                      "Home",
                      style: listtitlestyle,
                    ),
                    subtitle: const Text("Your living home"),
                  ),
                  const Divider(
                    indent: 20,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.bag),
                    title: Text("Enter work loction", style: listtitlestyle),
                  ),
                  const Divider(
                    indent: 20,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add a place", style: listtitlestyle),
                  ),
                ],
              ),
            ),
            Container(
              decoration: containerdecoration,
              padding: containerpadding,
              margin: containermargin,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Language", style: listtitlestyle),
                    subtitle: Text("English-GB"),
                  ),
                  const Divider(
                    indent: 20,
                    thickness: 1,
                  ),
                  ListTile(
                    title: Text("Communication Preferences",
                        style: listtitlestyle),
                  ),
                ],
              ),
            ),
            Container(
              decoration: containerdecoration,
              padding: containerpadding,
              margin: containermargin,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.logout_outlined),
                    title: Text("Log out", style: listtitlestyle),
                  ),
                  const Divider(
                    indent: 20,
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Icon(CupertinoIcons.delete),
                    title: Text("Delete account", style: listtitlestyle),
                  ),
                ],
              ),
            ),
            // SizedBox(),
            // GestureDetector(
            //   onHorizontalDragStart: (details) {

            //   },
            //   child: Container(
            //     width: 300,
            //     decoration:BoxDecoration(
            //       color: Colors.red,
            //       borderRadius: BorderRadius.circular(10)

            //     ),
            //     child: SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Icon(Icons.logout_outlined,color: Colors.white,),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text("Log out",style: TextStyle(color: Colors.white,fontSize: 16),),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _position += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                if (_position >= MediaQuery.of(context).size.width - 100) {
                  setState(() {
                    _unlocked = true;
                  });
                } else {
                  setState(() {
                    _position = 0;
                  });
                }
              },
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        _unlocked == false ? Colors.green : Colors.transparent,
                    border: Border.all(
                      color: _unlocked == false
                          ? Colors.green
                          : Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      _unlocked == false
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                child: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.check,
                                color: Colors.transparent,
                              ),
                            ),
                      _unlocked == false
                          ? Center(child: Text("Unlocak Your trip"))
                          : Card(
                              color: Colors.green,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(child: Text("Trip Booked")))
                    ],
                  )),
            ),
            MaterialButton(
                child: Text("reset"),
                onPressed: () {
                  setState(() {
                    _unlocked = !_unlocked;
                    _position = 500;
                  });
                })
          ],
        ),
      ),
    );
  }
}
