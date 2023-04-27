// ignore_for_file: unused_local_variable

import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/pages/frame/sign_in/index.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  void handleSignIng(String type) async {
    //1: google //2: facebook //3: apple //4: phone number
    try {
      if (type == 'phone number') {
        if (kDebugMode) {
          print('Logged in with phone number');
        }
      } else if (type == 'google') {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';
          LoginRequestEntity loginPanelListEntity = LoginRequestEntity();
          loginPanelListEntity.avatar = photoUrl;
          loginPanelListEntity.name = displayName;
          loginPanelListEntity.email = email;
          loginPanelListEntity.open_id = id;
          loginPanelListEntity.type = 1;
        }
      } else {}
    } catch (e) {
      if (kDebugMode) {
        print('....Error $e occured');
      }
    }
  }
}
