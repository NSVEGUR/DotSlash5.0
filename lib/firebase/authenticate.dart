import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authenticate {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late UserCredential user;
  late User newUser;
  String email;
  String password;
  String type;
  static const types = ['farmer', 'middleMan', 'retailer'];
  Authenticate({required this.email, required this.password, required this.type});

  signUp()async{
    String result;
    try{
      user = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password));
      await _getCurrentUser();

      //Storing the user details in the firebase
      if(types.contains(type)) {
          await newUser.updateDisplayName(newUser.email!.split('@')[0]);
          await _firestore.collection(type).doc(newUser.uid).set({
            'email': newUser.email,
            'uid': newUser.uid,
            'userName': newUser.displayName,
            'balance': 0,
            'transactions': 0,
            'royaltyPercentage': 0,
            'royaltySlab': 0,
          });
      }
      result = 'success';
    }catch(signUpError){
      if(signUpError.toString() == '[firebase_auth/email-already-in-use] The email address is already in use by another account.')
        {
          result = 'emailInUse';
        }
      else{
        result = signUpError.toString();
        print(result);
      }
    }
    return result;
  }

  signIn()async{
    String result;
    try{
      user = (await _auth.signInWithEmailAndPassword(email: email, password: password));
      result = 'success';
    }catch(signInError){
      if(signInError.toString() == '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.'){
        result = 'noUser';
      }
      else if(signInError.toString() == '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.'){
        result = 'wrongPassword';
      }else{
        print(signInError);
        result = signInError.toString();
      }
    }
    return result;
  }

  _getCurrentUser()async{
    try{
      final tempUser = _auth.currentUser;
      if(tempUser != null) {
        newUser = tempUser;
      }
    }catch(err){
      print(err);
    }
  }
}