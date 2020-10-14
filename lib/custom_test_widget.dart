
import 'package:flutter/cupertino.dart';

class CustomTestWidget extends StatefulWidget{
  @override
  _CustomTestWidget createState() => _CustomTestWidget();
}

class _CustomTestWidget extends State<CustomTestWidget>{
  @override
  Widget build(BuildContext context) {
    print('其他widget执行了build方法。。。。。。。。。。 ');

   return Text(" 其他 widget");
  }

}