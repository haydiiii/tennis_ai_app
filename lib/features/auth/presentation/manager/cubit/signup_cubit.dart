import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/states/signup_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(InitialSignUpState());

  //SignUpMethod
  signUp(String name, String emailAddress, String password) async {
    emit(SignUpLoadingState());
try {
  final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
  // User user = credential.user!;
  // user.updateDisplayName(name);
  // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
  //   'name': name,
  //   'email': emailAddress,
  //   'uid': user.uid,
  //   'image': '',
  // }, SetOptions(merge: true));
  emit(SignUpSuccessState());
} on FirebaseAuthException catch (e) {
  log('FirebaseAuthException: ${e.code} - ${e.message}');
  if (e.code == 'weak-password') {
    emit(SignUpErrorState('The password provided is too weak.'));
  } else if (e.code == 'email-already-in-use') {
    emit(SignUpErrorState('The account already exists for that email.'));
  } else {
    emit(SignUpErrorState('Error: ${e.message}'));
  }
} catch (e) {
  log('An unexpected error occurred: ${e.toString()}');
  emit(SignUpErrorState('An unexpected error occurred: ${e.toString()}'));
}

  }
}
