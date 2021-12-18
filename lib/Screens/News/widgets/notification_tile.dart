import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, required NotificationModel model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0),
        child: Card(
          color: themeProvider.getTheme().dialogBackgroundColor,
          shape: const Border(left: BorderSide(color: Colors.red, width: 7)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: _width / 128,
                ),
                Icon(Icons.info),
                SizedBox(
                  width: _width / 64,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Titel",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text("Beschreibung"),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Von %AUTHOR%",
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w100),
                          ),
                          Text(
                            "%Timesstamp%",
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
