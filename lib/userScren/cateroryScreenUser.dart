

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userecommerce/appRouter.dart';
import 'package:userecommerce/fireStoreProvider.dart';
import 'package:userecommerce/userScren/cateroryWidgetUser.dart';
import 'package:userecommerce/userScren/productScreenUser.dart';

class CategoryScreenUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return  provider.categories==null?
          Center(
            child:const CircularProgressIndicator(),
          )
              :
          GridView.builder(
            itemCount: provider.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder:(context,index){
              return InkWell(
                  onTap: (){
                    provider.getAllProduct(provider.categories[index].catId!);
                    //AppRouter.NavigateToWidget(NewProduct(provider.categories![index].catId));
                    AppRouter.NavigateToWidget(ProductScreenUser(provider.categories![index].catId!));

                  },
                  child: CategoryWidgetUser(provider.categories![index]));
            },
          );
        }
    );
  }
}