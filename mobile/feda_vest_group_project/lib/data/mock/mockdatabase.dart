class MockDatabase {
  static List<Map<String, dynamic>> users = [
    {
      "id": 1,
      "name": "Test User",
      "email": "test@mail.com",
      "password": "123456",
      "role": "user",
      "token": "mock_token_user_123"
    },
    {
      "id": 2,
      "name": "Admin User",
      "email": "admin@mail.com",
      "password": "admin123",
      "role": "admin",
      "token": "mock_token_admin_456"
    },
  ];
}