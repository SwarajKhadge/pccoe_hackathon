import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pccoe_hackathon/screens/auth/email_verification_screen.dart';
import 'package:pccoe_hackathon/screens/home/home_screen.dart';

class AuthProvider with ChangeNotifier {
  String? _userId;
  String? _emailValue;

  String? get emailValue => _emailValue;
  String? get userId => _userId;

  setEmailValue(String value) {
    _emailValue = value;
    notifyListeners();
  }

  // API endpoint URLss
  static const String _baseUrl = 'http://localhost:8000';
  static const String _signInUrl = '$_baseUrl/auth/sign-in/';
  static const String _signUpUrl = '$_baseUrl/auth/sign-up';
  static const String _verifyOtpUrl = '$_baseUrl/auth/verify';

  // Method to sign in
  Future<void> signIn(String email, String password) async {
    try {
      final response = await http.post(Uri.parse(_signInUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
      } else {
        // Handle errors based on response status code
        throw Exception('Failed to sign in: ${response.statusCode}');
      }
    } catch (e) {
      print('Error signing in: $e');
      throw Exception('Failed to sign in');
    }
  }

  // Method to sign up
  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(_signUpUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        _userId = responseData['userId'];
        notifyListeners();

        // Sign up successful
        // You may handle additional logic here, such as automatically signing in the user after sign up
      } else {
        // Handle errors based on response status code
        throw Exception('Failed to sign up: ${response.statusCode}');
      }
    } catch (e) {
      print('Error signing up: $e');
      throw Exception('Failed to sign up');
    }
  }

  // Method to verify OTP
  Future<void> verifyOTP(String otp, String email, BuildContext context) async {
    try {
      final response = await http.post(Uri.parse(_verifyOtpUrl), body: {
        'email': email,
        'otp': otp,
      });

      if (response.statusCode == 200) {
        // OTP verification successful
        // You may handle additional logic here, such as updating user authentication status
        final responseData = json.decode(response.body);
        if (responseData['code'].toString() == otp.toString()) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      } else {
        // Handle errors based on response status code
        throw Exception('Failed to verify OTP: ${response.statusCode}');
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      throw Exception('Failed to verify OTP');
    }
  }
}
