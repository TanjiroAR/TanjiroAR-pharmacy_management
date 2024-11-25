import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  final String name;
  final String role;

  const MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.role,
  });

  static const empty = MyUser(
    userId: '',
    email: '',
    name: '',
    role: '',
  );

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    String? role,
  }) {
    return MyUser(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      role: role,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      role: entity.role,
    );
  }

  @override
  List<Object?> get props => [userId, email, name, role];
}
