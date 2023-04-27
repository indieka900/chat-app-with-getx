import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/frame/sign_in/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  Widget _buidLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        'Chatty .',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 34.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildThirPartyLogin(String loginType, String logo) {
    return GestureDetector(
      onTap: () {
        controller.handleSignIng('google');
      },
      child: Container(
        width: 295.w,
        height: 44.h,
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
              logo == '' ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: <Widget>[
            logo != ''
                ? Container(
                    padding: EdgeInsets.only(left: 40.w, right: 30.w),
                    child: Image.asset(
                        'assets/icons/${loginType.toLowerCase()}.png'),
                  )
                : Container(),
            Text(
              'Sign in with ${loginType.capitalizeFirst}',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _builOrWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              indent: 40,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Text(' or '),
          Expanded(
            child: Divider(
              endIndent: 40,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buidSignUpWidget() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Text(
            'Already have an Account',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          GestureDetector(
            child: Text(
              'Sign up here',
              style: TextStyle(
                color: AppColors.primaryElement,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: <Widget>[
            _buidLogo(),
            _buildThirPartyLogin('Google', 'google'),
            _buildThirPartyLogin('Facebook', 'facebook'),
            _buildThirPartyLogin('apple', 'apple'),
            _builOrWidget(),
            _buildThirPartyLogin('phone number', ''),
            SizedBox(
              height: 32.h,
            ),
            _buidSignUpWidget(),
          ],
        ),
      ),
    );
  }
}
