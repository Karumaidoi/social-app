// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:amerixapp/model/userModel.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

import 'followersModel.dart';

class UserServive {
  // static Dio dio = Dio();
  //LOG IN user to Amerix App
  static Future<http.Response> logIn(
      String email, String password, bool isSubmitting) async {
    try {
      var url = "http://159.89.16.24/api/v2/auth/login";
      var res = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
            'password': password,
          }));
      return res;
    } catch (err) {
      throw Exception(err);
    }
  }

  //SIGN UP user to Amerix App
  static Future<http.Response> createUser(
      String email, DateTime date, String firstName, String lastName) async {
    try {
      var info =
          await http.post(Uri.parse("http://159.89.16.24/api/v2/auth/register"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                'email': email,
                'firstname': firstName,
                'surname': firstName.split(' ')[0],
                'dob': date.toString().split(' ')[0],
              }));

      return info;
    } catch (err) {
      throw Exception(err);
    }
  }

  //FORGOT PASSWORD user to Amerix App
  static Future<http.Response> forgotPassword(String email) async {
    try {
      var info = await http.post(
          Uri.parse("http://159.89.16.24/api/v2/auth/forgot-password"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'email': email,
          }));

      return info;
    } catch (err) {
      throw Exception(err);
    }
  }

  //VERIFY OTP (For Password)
  static verifyOTP(String pin) async {
    var res = await http.post(
        Uri.parse("http://159.89.16.24/api/v2/auth/verify-reset-token"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'otpcode': int.parse(pin),
        }));

    return res;
  }

  //UPLAOD USER INFO
  static Future<http.Response> uploadInfo(
      String phoneNumber, String sex, String token) async {
    var info = await http.post(
        Uri.parse("http://159.89.16.24/api/v2/users/account-setup"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, String>{
          'phonenumber': phoneNumber,
          'sex': sex,
        }));

    return info;
  }

  //UPLAOD USER INFO
  static Future<http.Response> updateUserInfo(
      String phoneNumber,
      String sex,
      String token,
      String firstName,
      String websiteUrl,
      String bio,
      DateTime date) async {
    var info =
        await http.post(Uri.parse("http://159.89.16.24/api/v2/users/update"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': 'application/json',
              'Authorization': "Bearer $token",
            },
            body: jsonEncode(<String, String>{
              "firstname": firstName,
              "phonenumber": phoneNumber,
              "bio": bio,
              "link": websiteUrl,
              "sex": sex,
              "dob": date.toString().split(' ')[0],
            }));
    return info;
  }

  //UPLOAD an image (User)
  static Future uploadImage(File image, String token) async {
    try {
      String filename = image.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'profile_img': await dio.MultipartFile.fromFile(
          image.path,
          filename: filename,
        ),
        "type": "image/png"
      });

      dio.Response response = await dio.Dio()
          .post("http://159.89.16.24/api/v2/users/upload-profile-photo",
              data: formData,
              options: dio.Options(headers: {
                'Content-Type': 'multipart/form-data',
                'accept': '*/*',
                'Authorization': "Bearer $token",
              }, method: 'POST', responseType: dio.ResponseType.json));

      return response;
    } catch (err) {
      throw Exception(err);
    }
  }

//UPLOAD an POST (User)
  static Future uploadPost(File image, String token, String content) async {
    try {
      String filename = image.path.split('/').last;
      var fileImage = await dio.MultipartFile.fromFile(
        image.path,
        filename: filename,
      );

      dio.FormData formData = dio.FormData.fromMap({
        'files': fileImage,
        'post_content': content,
      });

      dio.Response response =
          await dio.Dio().post("http://159.89.16.24/api/v2/posts/add",
              data: formData,
              options: dio.Options(headers: {
                'Content-Type': 'multipart/form-data',
                'accept': '*/*',
                'Authorization': 'Bearer $token',
              }, method: 'POST', responseType: dio.ResponseType.json));
      return response;
    } catch (err) {
      throw Exception(err);
    }
  }

  //UPLOAD an image (User)
  static Future uploadImageBack(File image, String token) async {
    try {
      String filename = image.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'background_img': await dio.MultipartFile.fromFile(
          image.path,
          filename: filename,
        ),
        "type": "image/png"
      });

      dio.Response response = await dio.Dio()
          .post("http://159.89.16.24/api/v2/users/upload-background-photo",
              data: formData,
              options: dio.Options(headers: {
                'Content-Type': 'multipart/form-data',
                'accept': '*/*',
                'Authorization': "Bearer $token",
              }, method: 'POST', responseType: dio.ResponseType.json));
      return response;
    } catch (err) {
      throw Exception(err);
    }
  }

  static Future<http.Response> verifyOTPSignUp(
    String otpCode,
  ) async {
    var info =
        await http.post(Uri.parse("http://159.89.16.24/api/v2/auth/verify"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, int>{
              'otpcode': int.parse(otpCode),
            }));

    return info;
  }

  //RESENDING A TOKEN
  static Future<http.Response> resendOTP(
    String email,
  ) async {
    var info =
        await http.post(Uri.parse("http://159.89.16.24/api/v2/auth/resend"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'email': email,
            }));

    return info;
  }

//GET PEOPLE TO FOLLOW
  static Future<List<FollowerModel>> getData(String token) async {
    try {
      var response = await http.get(
        Uri.parse("http://159.89.16.24/api/v2/users/to-follow"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body)["data"]["users"]["data"];
        return jsonResponse
            .map((data) => FollowerModel.fromJson(data))
            .toList();
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

 
  //FOLLOW USER
  static Future<http.Response> followUser(String token, int id) async {
    try {
      var response = await http.post(
          Uri.parse("http://159.89.16.24/api/v2/followings/follow"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': "Bearer $token",
          },
          body: jsonEncode(<String, int>{
            'user_id': id,
          }));

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Choose Interests
  static Future<int> ChooseInterests(
    String token,
    int id,
  ) async {
    var info = await http.post(
        Uri.parse("http://159.89.16.24/api/v2/auth/set-user-interest"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(<String, int>{
          'topic_id': id,
        }));
    var res = info.body.split('message":')[1].split(',')[0];
    var response = [];
    if (res == "success") {
      response.add(res);
    }

    return res.length >= 2 ? res.length : 0;
  }

  //show user profile
  static Future<UserModel> getUser(String token, String userName) async {
    try {
      var response = await http.get(
        Uri.parse("http://159.89.16.24/api/v2/users/$userName"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body)["data"];
        print(jsonResponse);
        return jsonResponse;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
