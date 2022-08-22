import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:string_validator/string_validator.dart';
import 'package:userecommerce/appRouter.dart';
import 'package:userecommerce/authHelper.dart';
import 'package:userecommerce/firestore_helper.dart';
import 'package:userecommerce/model/appUser.dart';
import 'package:userecommerce/userScren/mainPageScreen.dart';
class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> signupKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  nullValidation(String v){
    if(v==null|| v.isEmpty){
      return "هذا الحقل مطلوب";
    }
  }
  emailValidation(String value){
    if(!isEmail(value)){
      return "صيغة ايميل خاطئة";
    }
  }
  passwordValidation(String value){
    if(value.length<6){
      return "يجب ان تتكون كلمة المرور من 6 خانات على الاقل";
    }
  }
  signIn()async{
    if(loginKey.currentState!.validate()){
      UserCredential? credential = await AuthHelper.authHelper.signIn(emailController.text, passwordController.text);
      if(credential!=null){
        AppRouter.NavigateWithReplacemtnToWidget(MainPageUser());
      }
    }
  }
  signUp()async{
    if(signupKey.currentState!.validate()){
      UserCredential? credential = await AuthHelper.authHelper.signUp(emailController.text, passwordController.text);
      AppUser appUser = AppUser(
          email: emailController.text,
          userNmae: userNameController.text,
          phone: phoneController.text,
          id:credential!.user!.uid
      );
      FireStoreHelper.fireStoreHelper.addUserToFireStore(appUser);
      if(credential!=null){
        AppRouter.NavigateWithReplacemtnToWidget(MainPageUser());
      }
    }
  }
  checkUser(){
    AuthHelper.authHelper.checkUser();
  }
  SignOut(){
    AuthHelper.authHelper.signOut();
  }
  forgetPassword(){
    AuthHelper.authHelper.forgetPassword('lailaanouar1808@gmail.com');
  }
}