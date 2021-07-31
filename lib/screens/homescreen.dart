import "package:flutter/material.dart";
import "/utilities/styling.dart";
import "marks.dart";
import "/utilities/globals.dart" as globals;

class HomeScreen extends StatefulWidget {
  var marks;
  var counter;
  var greetings;
  HomeScreen(this.marks, this.counter);
  HomeScreen.newIns() {
    this.marks = {};
    this.counter = 0;
  }
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState(this.marks, this.counter);
  }
}

class HomeScreenState extends State<HomeScreen> {
  var marks;
  var counter;
  double perc = 0.0;
  int summer = 0;
  HomeScreenState(this.marks, this.counter) {
    perc = counter / 6;
  }
  void dataReturn(BuildContext context) async {
    var data = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => MarksScreen(marks, counter)));
    setState(() {
      marks = data;
      counter = marks.length;
      perc = counter / 6;
      summer = 0;
      summer = marks.values.reduce((sum, element) => sum + element);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(counter);
    print(counter);
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.1,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text("Hi " + globals.greetings,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ))),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromRGBO(215, 255, 250, 1)),
            height: screenSize.height * 0.25,
            width: screenSize.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 30, left: 10, right: 10),
                        child: Text(
                          "Your Progress",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "$counter/ 6",
                          style: TextStyle(fontSize: 25),
                        )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "assignments done",
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Center(
                          child: Text(
                        perc.toStringAsFixed(3),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                      decoration: BoxDecoration(
                          color: ThemeColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(150))),
                    ))
              ],
            ),
          ),
          Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.15,
            child: Padding(
                padding:
                    EdgeInsets.only(top: 50, bottom: 30, left: 10, right: 10),
                child: Text(
                  "Your Score",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
          ),
          Container(
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Center(
                            child: Text(
                          summer.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: ThemeColors.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(150))),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                          width: 150,
                          height: 70,
                          child: ElevatedButton(
                              child: Text("TRACK"),
                              onPressed: () => {dataReturn(context)},
                              style: ElevatedButton.styleFrom(
                                  primary: ThemeColors.primaryColor))))
                ],
              ))
        ],
      ),
    ));
  }
}
