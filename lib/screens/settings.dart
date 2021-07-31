import "package:flutter/material.dart";
import "/utilities/globals.dart" as globals;
import "/utilities/styling.dart";

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsScreenState();
  }
}

enum GreetingChoice { Name, Id }

class SettingsScreenState extends State<SettingsScreen> {
  GreetingChoice? _character = GreetingChoice.Name;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryColor,
      ),
      body: Container(
        width: screenSize.width * 0.9,
        height: screenSize.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Text(
                  "Your Bio Home",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
            Row(
              children: <Widget>[
                Expanded(
                  child: RadioListTile<GreetingChoice>(
                    title: const Text('Name'),
                    value: GreetingChoice.Name,
                    groupValue: _character,
                    onChanged: (GreetingChoice? value) {
                      setState(() {
                        globals.greetings = globals.name;
                        _character = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<GreetingChoice>(
                    dense: true,
                    title: const Text('Id'),
                    value: GreetingChoice.Id,
                    groupValue: _character,
                    onChanged: (GreetingChoice? value) {
                      setState(
                        () {
                          globals.greetings = globals.id;
                          _character = value;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
