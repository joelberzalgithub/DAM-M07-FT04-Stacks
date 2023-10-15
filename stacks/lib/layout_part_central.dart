import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({super.key});

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

class LayoutPartCentralState extends State<LayoutPartCentral> {
  Color textColor = CupertinoColors.black; // Color per defecte

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: appData.toggleSidebarLeft,
              child: Icon(
                CupertinoIcons.sidebar_left,
                color: appData.isSidebarLeftVisible
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ],
        ),
        
        middle: Row(
          children: [
            Spacer(),
            CupertinoButton(
              onPressed: () {
                showOptionsPopover(context, appData);
              },
              child: Icon(CupertinoIcons.settings),
            ),
            Spacer(),
          ],
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: appData.toggleSidebarRight,
          child: Icon(
            CupertinoIcons.sidebar_right,
            color: appData.isSidebarRightVisible
                ? CupertinoColors.activeBlue
                : CupertinoColors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Central", style: TextStyle(color: textColor))],
        ),
      ),
    );
  }

  void showOptionsPopover(BuildContext context, AppData appData) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('Canviar color de text'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            onPressed: () {
              // Canviar el color a negre
              setState(() {
                textColor = CupertinoColors.black;
              });
              Navigator.pop(context);
            },
            child: Text('Negre'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // Canviar el color a vermell
              setState(() {
                textColor = CupertinoColors.systemRed;
              });
              Navigator.pop(context);
            },
            child: Text('Vermell'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // Canviar el color a verd
              setState(() {
                textColor = CupertinoColors.systemGreen;
              });
              Navigator.pop(context);
            },
            child: Text('Verd'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              // Canviar el color a blau
              setState(() {
                textColor = CupertinoColors.activeBlue;
              });
              Navigator.pop(context);
            },
            child: Text('Blau'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel·la'),
        ),
      ),
    );
  }
}