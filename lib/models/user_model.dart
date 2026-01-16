/// User model representing authenticated user data.
/// Contains profile information displayed in the app drawer.
class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final int age;
  final double weight; // in kg
  final double height; // in cm
  final String fitnessGoal;
  final bool isAdmin;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.age = 25,
    this.weight = 70.0,
    this.height = 175.0,
    this.fitnessGoal = 'Stay Fit',
    this.isAdmin = false,
  });

  /// Creates a mock user for demonstration purposes.
  factory UserModel.mock() {
    return const UserModel(
      id: '1',
      name: 'Ahmed Hassan',
      email: 'ahmed.hassan@email.com',
      age: 28,
      weight: 75.0,
      height: 180.0,
      fitnessGoal: 'Build Muscle',
    );
  }

  /// Copy with method for immutable updates.
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatarUrl,
    int? age,
    double? weight,
    double? height,
    String? fitnessGoal,
    bool? isAdmin,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      fitnessGoal: fitnessGoal ?? this.fitnessGoal,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
