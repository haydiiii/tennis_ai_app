class SignUpStates {}

class InitialSignUpState extends SignUpStates {}

// SignUp

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final String error;

  SignUpErrorState(this.error);
}