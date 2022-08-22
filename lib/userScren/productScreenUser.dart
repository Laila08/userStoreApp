import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userecommerce/appRouter.dart';
import 'package:userecommerce/fireStoreProvider.dart';
import 'package:userecommerce/userScren/descriptionScreen.dart';
import 'package:userecommerce/userScren/productWidgetUser.dart';

class ProductScreenUser extends StatelessWidget {
  String catId;
  ProductScreenUser(this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 30,top: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.teal,size: 30,),
            onPressed: (){
              AppRouter.popRouter();
            },
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading:false,
        elevation: 0.0,
      ),
      body: Consumer<FireStoreProvider>(
          builder: (context, provider, x) {
            return provider.products.isEmpty ?
            Center(
              child: const Text('No Product'),
            )
                :
            ListView.builder(
              itemCount: provider.products!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      AppRouter.NavigateToWidget(DescProduct(provider.products![index],catId));
                    },
                    child: ProductWidgetUser(provider.products![index],catId));
              },
            );
          }
      ),
    );
  }
}