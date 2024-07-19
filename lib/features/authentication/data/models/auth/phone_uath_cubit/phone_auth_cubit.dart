import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submmitedPhoneNumber({required String phoneNumber}) async {
    emit(PhoneAuthLoading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verifcationComplete,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeOut,
    );
  }

  void verifcationComplete(PhoneAuthCredential phoneAuthCredential) async {
    await signIn(phoneAuthCredential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print(error.toString());
    emit(PhoneAuthError(error: error.toString()));
  }

  void codeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    emit(PhoneAuthSubmitted());
  }

  void codeAutoRetrievalTimeOut(String verificationId) {}
  Future<void> submitOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneAuthVerified());
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    return FirebaseAuth.instance.currentUser!;
    
  }
}
