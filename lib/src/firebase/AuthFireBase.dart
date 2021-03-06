import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthFireBase{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  signIn(String email, String pass, Function onSuccess, Function(String) onSignInError){
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass)
        .then((user){
      print("On sign-In success");
      onSuccess();
    })
    .catchError((onError){
      onSignInError("Sign-In fail. Please try again");
    });
  }
  signUp(String name, String email, String pass, String phone, Function onSuccess, Function(String) onRegisterError){
     _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass).then((user){
       print(user);
       _createUser(phone,phone, name, pass, email, onSuccess, onRegisterError );
     }
     ).catchError((onError){
            _onSignUpError(onError.code, onRegisterError);
     });

  }
  _createUser(String userId, String phone, String name, String pass, String email, Function onSuccess, Function(String) onRegisterError){
    var user = {"name" : name, "phone": phone, "password": pass, "email": email};
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user){// success
      onSuccess();
    }).catchError((error){
      onRegisterError("Sign Up fail, please try again");
    });
  }

  _onSignUpError(String code, Function(String) onRegisterError){
    switch(code){
      case "email-already-in-use":// email da use
        onRegisterError("Email already in use");
        break;
      case "invalid-email": // email khong hop le
        onRegisterError("Invalid email");
        break;
      case "operation-not-allowed": // email khong duoc phep
        onRegisterError("Operation not allowed");
        break;
      case "weak-password":// pass yeu
        onRegisterError("Weak password");
        break;
    }
  }
}