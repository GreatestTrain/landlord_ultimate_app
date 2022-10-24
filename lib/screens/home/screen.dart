import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:landlord_ultimate_app/screens/home/buttons.dart';

class BodyApp extends StatelessWidget {
  const BodyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(theme: CupertinoThemeData(), home: BodyWidget());
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});
  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_dash),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house_alt),
            label: 'Departamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.group),
            label: 'Madres solteras',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tickets),
            label: 'Facturación',
          )
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text('Home (Dashboard likely)'),
              ),
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  evictSingleMotherButton,
                  CupertinoButton(
                    child: const Text('Next page'),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute<void>(
                          builder: (BuildContext context) {
                            return CupertinoPageScaffold(
                              navigationBar: CupertinoNavigationBar(
                                middle: Text('Page 2 of tab $index'),
                              ),
                              child: Center(
                                child: CupertinoButton(
                                  child: const Text('Back'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              )),
            );
          },
        );
      },
    );
  }
}
