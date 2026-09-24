import 'dart:convert';
import 'package:feda_vest_group_project/data/mock/mock_respose.dart';
import 'package:feda_vest_group_project/data/mock/mockdatabase.dart';
import 'package:http/http.dart' as http;

import 'auth_repo.dart';

class MockAuthRepo extends AuthRepo {
  @override
  Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final user = MockDatabase.users.firstWhere(
      (u) => u['email'] == email && u['password'] == password,
      orElse: () => {},
    );

    if (user.isEmpty) {
      return mockResponse({"message": "Invalid credentials"}, 401);
    }

    return mockResponse({
      "message": "Login successful",
      "token": user["token"],
      "user": user
    }, 200);
  }

  @override
  Future<http.Response> register({
    required String email,
    required String name,
    required String role,
    required String password,
    required String confirmPassword,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final exists = MockDatabase.users.any((u) => u['email'] == email);

    if (exists) {
      return mockResponse({"message": "User already exists"}, 400);
    }

    final newUser = {
      "id": MockDatabase.users.length + 1,
      "name": name,
      "email": email,
      "password": password,
      "role": role,
      "token": "mock_token_$email"
    };

    MockDatabase.users.add(newUser);

    return mockResponse({
      "message": "Registration successful",
      "token": newUser["token"],
      "user": newUser
    }, 201);
  }
}