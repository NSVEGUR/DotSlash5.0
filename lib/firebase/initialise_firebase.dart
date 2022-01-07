import 'package:firebase_core/firebase_core.dart';

initialiseFirebase () async{
 await Firebase.initializeApp()
     .whenComplete(() => {
       print('Intialised Firebase Successfully')
     })
     .catchError( (err) => {
      print(err)
     });
}