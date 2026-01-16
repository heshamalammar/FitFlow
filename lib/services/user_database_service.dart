import '../models/user_model.dart';

/// UserDatabaseService provides a simple in-memory database for user management.
/// Pre-seeded with an admin account. Persists users during app session.
class UserDatabaseService {
  // Singleton pattern
  static final UserDatabaseService _instance = UserDatabaseService._internal();
  factory UserDatabaseService() => _instance;
  UserDatabaseService._internal() {
    _seedAdminUser();
  }

  // In-memory user storage (email -> UserModel with password)
  final Map<String, _StoredUser> _users = {};

  /// Seeds the admin user on initialization.
  void _seedAdminUser() {
    _users['admin@gmail.com'] = _StoredUser(
      user: UserModel(
        id: 'admin-001',
        name: 'Administrator',
        email: 'admin@gmail.com',
        age: 30,
        isAdmin: true,
      ),
      password: 'admin123',
    );
  }

  /// Registers a new user. Returns true if successful, false if email exists.
  bool registerUser({
    required String name,
    required String email,
    required String password,
    int? age,
  }) {
    // Check if email already exists
    if (_users.containsKey(email.toLowerCase())) {
      return false;
    }

    // Create and store new user
    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email.toLowerCase(),
      age: age ?? 25,
      isAdmin: false,
    );

    _users[email.toLowerCase()] = _StoredUser(
      user: newUser,
      password: password,
    );

    return true;
  }

  /// Validates user credentials and returns the user if valid.
  UserModel? validateLogin(String email, String password) {
    final storedUser = _users[email.toLowerCase()];
    if (storedUser != null && storedUser.password == password) {
      return storedUser.user;
    }
    return null;
  }

  /// Checks if an email is already registered.
  bool isEmailRegistered(String email) {
    return _users.containsKey(email.toLowerCase());
  }

  /// Gets the total number of registered users.
  int get userCount => _users.length;
}

/// Internal class to store user with password.
class _StoredUser {
  final UserModel user;
  final String password;

  _StoredUser({required this.user, required this.password});
}
