import 'package:flutter/material.dart';

class MyRouter {
  MyRouter({
    this.name,
    this.widget,
    this.routeName,
  });
  final String name;
  final String routeName;
  final Widget widget;
}

class MyRouterList {
  MyRouterList({this.lists, this.name});

  final List<dynamic> lists;
  final String name;
}

class RouterPage extends StatelessWidget {
  final MyRouterList routerList;
  RouterPage({this.routerList});

  @override
  Widget build(BuildContext context) {
    assert(routerList != null, '---->\nRouterPage paras routerList should not null , Please set it valid.. ');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${routerList.name}'),
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView.builder(
            itemCount: routerList.lists.length,
            shrinkWrap: true,
            itemExtent: 80.0,
            itemBuilder: (context, index) {
              var item = routerList.lists[index];
              Widget cell = new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: new Border(
                      bottom: const BorderSide(
                    color: Color(0x3f000000),
                    width: 1.0,
                  )),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(item.name),
                  ],
                ),
              );
              return GestureDetector(
                onTap: () {
                  if (item is MyRouterList){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (_) {
                        return RouterPage(
                          routerList: item,
                        );
                      },
                    ));
                  } else if (item is MyRouter){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (_) {
                        return item.widget;
                      },
                    ));
                  }

                },
                child: cell,
              );
            }),
      ),
    );
  }
}
