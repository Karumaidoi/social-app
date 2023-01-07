// ignore_for_file: use_build_context_synchronously

import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';
import 'package:amerixapp/pages/Auth/verify_pass.dart';
import 'package:flutter/material.dart';

import '../../model/userService.dart';
import '../../utils/app_colors.dart';
import '../../widgets/amerix_icon.dart';
import '../../widgets/rich_text.dart';
import '../../widgets/rich_text_terms.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String firstName = '';
  String lastName = '';
  bool isSubmitting = false;
  bool errorEmail = false;
  bool errorDate = false;
  final inputFormat = DateFormat('dd/MM/yyyy');
  DateTime selectedDate = DateTime.now();
  String? newDate;
  String? error;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              color: AppColors.grey,
              size: 19,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AmerixIcon(),
                ],
              ),
              const SizedBox(
                height: 18,
              ),

              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create account',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RichTextWidget(label: 'Name'),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: AppColors.grey.withOpacity(.2))),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          firstName = value;
                        },
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 13, color: AppColors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RichTextWidget(label: 'Email Address'),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: errorEmail == false
                            ? Border.all(
                                width: 1, color: AppColors.grey.withOpacity(.2))
                            : Border.all(
                                width: 2,
                                color: AppColors.red.withOpacity(.6))),
                    child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (!value!.contains('@')) {
                            return 'Please enter a valid Email Address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                          setState(() {
                            errorEmail = false;
                          });
                        },
                        style: const TextStyle(fontSize: 13),
                        decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 13),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  errorEmail == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              error!,
                              style: TextStyle(
                                  fontSize: 9,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),

              const SizedBox(
                height: 15,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RichTextWidget(label: 'Date of Birth'),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: errorDate == false
                            ? Border.all(
                                width: 1, color: AppColors.grey.withOpacity(.2))
                            : Border.all(
                                width: 2,
                                color: AppColors.red.withOpacity(.6))),
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            errorDate = false;
                          });
                        },
                        style: const TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  var datePicked =
                                      await DatePicker.showSimpleDatePicker(
                                    context,
                                    confirmText: 'Ok',
                                    textColor: AppColors.AppTheme,
                                    itemTextStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                    titleText: '',
                                    initialDate: DateTime(2022),
                                    firstDate: DateTime(1960),
                                    lastDate: DateTime(2022, 8),
                                    dateFormat: "dd-MMMM-yyyy",
                                    locale: DateTimePickerLocale.en_us,
                                    looping: true,
                                  );
                                  setState(() {
                                    selectedDate = datePicked!;
                                    errorDate = false;
                                  });

                                  //
                                  changeDate(selectedDate);
                                },
                                child: Icon(Icons.date_range,
                                    color: AppColors.AppTheme)),
                            hintStyle: const TextStyle(fontSize: 13),
                            hintText: newDate == null
                                ? ''
                                : newDate.toString().split(' ')[0],
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  errorDate == true
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              'You must be at least 13 years old',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),

              const SizedBox(
                height: 15,
              ),
              const RichTextWidgetTerms(
                  label: 'By signing up, you agree to our ',
                  span: 'Terms of service',
                  span2: 'Privacy Policy.',
                  label2: ' and acknowledge that you have read our '),

              const SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () async {
                  setState(() {
                    isSubmitting = true;
                  });
                  if (firstName == '' || email == '' || newDate == null) {
                    setState(() {
                      isSubmitting = false;
                    });
                  }
                  var res = await UserServive.createUser(
                      email, selectedDate, firstName, lastName);
                  if (res.statusCode == 201) {
                    Toast.show("Verification code sent",
                        duration: 3,
                        gravity: Toast.bottom,
                        textStyle:
                            const TextStyle(fontSize: 14, color: Colors.white));
                    setState(() {
                      isSubmitting = false;
                    });
                    Get.to(
                        () => VerifyPassword(
                              email: email,
                            ),
                        transition: Transition.cupertino);
                  } else {
                    setState(() {
                      isSubmitting = false;
                    });

                    var err = res.body.split('message":"')[1];
                    // ignore: non_constant_identifier_names
                    var AppError = err.split('"}')[0];
                    if (AppError.contains('13 years old')) {
                      setState(() {
                        errorDate = true;
                      });
                    } else if (AppError.contains(
                        'Email must be a valid email address')) {
                      setState(() {
                        error = 'Email must be a valid email address';
                        errorEmail = true;
                      });
                    } else if (AppError.contains(
                        'The email has already been taken')) {
                      error = 'The email has already been taken';
                      errorEmail = true;
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 45,
                  decoration: BoxDecoration(
                      color: newDate == null ? AppColors.grey.withOpacity(.4) : Colors.black,
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                          width: 1, color: AppColors.grey.withOpacity(.2))),
                  child: Center(
                    child: isSubmitting == true
                        ? const SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ))
                        : Text(
                            'Continue',
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13),
                          ),
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
  changeDate(DateTime date) {
    String formattedDate = DateFormat('dd-MM-yyyy - kk:mm').format(date);
    setState(() {
      newDate = formattedDate;
    });
  }
}
