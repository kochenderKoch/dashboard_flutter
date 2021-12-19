import 'package:dashboard_flutter/provider/role_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dashboard_flutter/model/notification_model.dart';
import 'package:dashboard_flutter/provider/theme_provider.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel model;
  NotificationCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeProvider>(context);
    final roleProvieder = Provider.of<RoleProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0),
      child: Card(
        color: themeProvider.getTheme().dialogBackgroundColor,
        shape: Border(
          left: BorderSide(
              color: model.status == "1" ? Colors.yellow : Colors.red,
              width: 7),
        ),
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
              model.status == "1"
                  ? const Icon(Icons.info)
                  : const Icon(Icons.warning),
              SizedBox(
                width: _width / 64,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.title,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        roleProvieder.roleModel.isAdmin()
                            ? OutlinedButton(
                                onPressed: () {},
                                child: Icon(Icons.delete_outlined))
                            : Container()
                      ],
                    ),
                    const Divider(),
                    Text(model.subtitile),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Von Caesar",
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w100),
                        ),
                        Text(
                          model.date,
                          style: const TextStyle(
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
    );
  }
}
