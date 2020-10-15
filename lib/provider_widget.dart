import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'counter_model.dart';

class ProviderWidget extends StatefulWidget {
  final Widget child;
  final CounterModel data;

  ProviderWidget({
    Key key,
    this.child,
    this.data,
  });

  @override
  _ProviderWidget createState() => _ProviderWidget();
}

class _ProviderWidget extends State<ProviderWidget> {
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    widget.data.counter.addListener(update);
    print('  注册监听。。。。。。。。。。 ');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: double.infinity,
      child: Column(
        children: [
          Builder(
            builder: (context) {
              print(
                  '  无缓存 widget build。。。。。。。。。。 ${widget.data.counter.value}');

              return Text(
                ' no cache widget ${widget.data.counter.value}',
                style: TextStyle(color: Colors.red, fontSize: 30),
              );
            },
          ),
          widget.child
        ],
      ),
    );
  }
}
