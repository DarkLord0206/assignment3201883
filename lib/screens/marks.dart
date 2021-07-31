import 'package:flutter/material.dart';
import '/utilities/styling.dart';

class MarksScreen extends StatefulWidget {
  final counter;
  final marks;
  MarksScreen(this.marks, this.counter);
  @override
  State<StatefulWidget> createState() {
    return MarksScreenState(this.marks, this.counter);
  }
}

class MarksScreenState extends State<MarksScreen> {
  var counter;
  var marks;
  MarksScreenState(this.marks, this.counter);
  String dropdownValue1 = 'Assignment 1';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final marksController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColors.primaryColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenSize.width * 0.90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Container(
                              height: screenSize.height * 0.04,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Assignment Number',
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: DropdownButton<String>(
                            value: dropdownValue1,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_downward_sharp),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue1 = newValue!;
                              });
                            },
                            items: <String>[
                              'Assignment 1',
                              'Assignment 2',
                              'Assignment 3',
                              'Assignment 4',
                              'Assignment 5',
                              'Assignment 6'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenSize.width * 0.90,
                      height: screenSize.width * 0.06,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenSize.height * 0.04,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Marks',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        TextFormField(
                            controller: marksController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              labelText: 'Marks',
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width * 0.3,
                child: Card(
                    color: ThemeColors.primaryColor,
                    child: TextButton(
                      onPressed: () {
                        if (marks.containsKey(dropdownValue1)) {
                          marks[dropdownValue1] =
                              int.parse(marksController.text);
                        } else {
                          marks[dropdownValue1] =
                              int.parse(marksController.text);
                          counter++;
                        }
                        Navigator.pop(context, marks);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
