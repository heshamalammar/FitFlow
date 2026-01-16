import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_database_service.dart';

/// AuthProvider manages authentication state across the app.
/// Uses ChangeNotifier for reactive state updates with Provider.
/// Integrates with UserDatabaseService for persistent user storage.
class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;
  
  // Database service instance
  final UserDatabaseService _db = UserDatabaseService();

  // Getters
  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  bool get isAdmin => _user?.isAdmin ?? false;
  String? get error => _error;

  /// Authenticates user with email and password.
  /// Validates against the internal database.
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate network delay for better UX
      await Future.delayed(const Duration(milliseconds: 800));

      // Validate against database
      final validatedUser = _db.validateLogin(email, password);
      
      if (validatedUser != null) {
        _user = validatedUser;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = 'Invalid email or password';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'An error occurred. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Registers a new user with the provided details.
  /// Stores user in the internal database.
  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
    int? age,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      // Check if email already exists
      if (_db.isEmailRegistered(email)) {
        _error = 'This email is already registered';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      // Register user in database
      final success = _db.registerUser(
        name: name,
        email: email,
        password: password,
        age: age,
      );

      if (success) {
        // Auto-login after registration
        _user = _db.validateLogin(email, password);
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = 'Registration failed. Please try again.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = 'Registration failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  /// Logs out the current user.
  void logout() {
    _user = null;
    _error = null;
    notifyListeners();
  }

  /// Clears any existing error messages.
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
