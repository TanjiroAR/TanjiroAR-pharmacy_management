part of 'auth_bloc.dart';

enum AuthStatus { auth, unAuth, unknown }

class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user,
  });

  const AuthState.unknown() : this._();

  const AuthState.auth(User user) :
      this._(status: AuthStatus.auth, user: user);

  const AuthState.unAuth() :
      this._(status: AuthStatus.unAuth);

  @override
  List<Object?> get props => [status, user];
}
