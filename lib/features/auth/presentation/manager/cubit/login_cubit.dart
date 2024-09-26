import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/states/login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(InitialLoginState());

   static LoginCubit get(context) => BlocProvider.of(context);  

  //loginMethod
   login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState('user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState('wrong-password'));
      } else {
        emit(LoginErrorState(' something went wrong'));
      }
    }
  }

   
}