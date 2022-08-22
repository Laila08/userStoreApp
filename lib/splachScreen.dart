import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userecommerce/authProvider.dart';
class SplachScreen extends StatelessWidget{
  navigateFun(BuildContext context)async{
    await Future.delayed(Duration(seconds: 2));
    Provider.of<AuthProvider>(context,listen: false).checkUser();
  }
  @override
  Widget build(BuildContext context) {
    navigateFun(context);
   return Scaffold(
     backgroundColor: Colors.white,
     body: Center(child: Image.asset('assets/images/lawhate.jpeg'),),
   );
  }
}