import 'package:book_nook_user/services/storage/store.dart';
import 'package:book_nook_user/ui/Screens/changePassword/sates.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordStates> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  void cancleChanging(
      passwordController, newPasswordController, confirmController) {
    passwordController.clear();
    newPasswordController.clear();
    confirmController.clear();
    emit(ChangePasswordShow());
  }

  bool canSeepassword = true;
  bool canSeeNewpassword = true;
  bool canSeeConfirm = true;
  void isPressedPassWord() {
    canSeepassword = !canSeepassword;
    emit(Password());
  }

  void isPressedNewPassWord() {
    canSeeNewpassword = !canSeeNewpassword;
    emit(NewPassword());
  }

  void isPressedConfirm() {
    canSeeConfirm = !canSeeConfirm;
    emit(Confirm());
  }

  Future chabgeApi(
      {required String oldPassword,
      required String newPassword,
      required String confirm}) async {
    try {
      log('inside');
      var response = await http
          .post(Uri.parse("${Store.baseURL}/api/password/change"), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Store.token}'
      }, body: {
        "old_password": oldPassword,
        "new_password": newPassword,
        "new_password_confirmation": confirm
      });

      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        log('Request success with status: ${response.statusCode}.');
        log('${jsonResponse['data']}');
      } else {
        log('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
