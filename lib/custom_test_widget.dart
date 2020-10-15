import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'counter_model.dart';

class CustomTestWidget extends StatefulWidget {
  final CounterModel data;

  CustomTestWidget({
    Key key,
    this.data,
  });

  @override
  _CustomTestWidget createState() => _CustomTestWidget();
}

class _CustomTestWidget extends State<CustomTestWidget> {
  @override
  Widget build(BuildContext context) {
    print('缓存widget执行了build方法。。。。。。。。。。 ${widget.data.counter.value} ');
    return Text(
      '  cache widget ${widget.data.counter.value}',
      style: TextStyle(color: Colors.blue, fontSize: 30),
    );
  }
}
