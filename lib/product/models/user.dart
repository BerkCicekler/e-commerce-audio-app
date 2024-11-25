import 'package:equatable/equatable.dart';

final class User extends Equatable {
  User({required this.name, required this.email});

  final String name;
  final String email;

  factory User.empty() => User(name: '', email: '');

  @override
  List<Object?> get props => [name, email];
}
