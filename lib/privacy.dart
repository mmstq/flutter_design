import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ap/group_finished.dart';

class Privacy extends StatelessWidget {
  final list = <String>['Private', 'Public'];

  final ts = TextStyle(fontFamily: 'Quicksand');
  var screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 197,
              floating: false,
              pinned: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: Container(
                  height: 300,
                  decoration: BoxDecoration(color: Colors.teal.shade800),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[
                      Image.asset(
                        'assets/island.jpg',
                        filterQuality: FilterQuality.low,
                      ),
                      Container(
                        height: 300,
                        color: Colors.grey.withOpacity(.3),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: ()async{
                            File file = await FilePicker.getFile();
                          },
                          child: Text(
                            'Upload Cover Photo',
                            style: ts.copyWith(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Text(
                          'Privacy',
                          style: ts.copyWith(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.lightGreenAccent.shade700,
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) => getItem(index),
            )),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          color: Colors.lightGreenAccent.shade700,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>FinishedScreen()));
          },
          child: Container(
              height: 40,
              width: 310,
              child: Center(
                child: Text(
                  'Next',
                  style: ts.copyWith(fontSize: 22, color: Colors.white),
                ),
              )),
        ),
      ),
    );
  }

  Widget getItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    list[index],
                    style:
                        ts.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: screen.width * 0.72,
                    child: Text(
                      "Make sure that the parent widget limits your text's width, and then use overflow and maxlines",
                      style: ts.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      softWrap: true,
                      maxLines: 6,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              (list[index] == 'Private')
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.green.shade700,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}