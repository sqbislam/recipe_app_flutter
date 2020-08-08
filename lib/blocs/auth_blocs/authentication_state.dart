part of 'authentication_bloc.dart';

// The equatable package is used in order to be able to compare two instances of AuthenticationState. By default, == returns true only if the two objects are the same instance.
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final String displayName;

  const AuthenticationSuccess(this.displayName);

  @override
  List<Object> get props => [displayName];

  // toString is overridden to make it easier to read an AuthenticationState when printing it to the console or in Transitions.
  @override
  String toString() => 'AuthenticationSuccess { displayName: $displayName }';
}

class AuthenticationFailure extends AuthenticationState {}
