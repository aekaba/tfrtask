import 'package:equatable/equatable.dart';
import 'package:tfr/Product/Model/token_model.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final TokenModel? tokenModel;
  final bool isCompleted;
  final bool isWrong;

  const LoginState(
      {this.tokenModel,
      this.isCompleted = false,
      this.isLoading = false,
      this.isWrong = false});

  List<Object?> get props => [isLoading];
}
