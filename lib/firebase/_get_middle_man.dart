import 'package:cloud_firestore/cloud_firestore.dart';


getMiddleMan()async{
  final _firestore = FirebaseFirestore.instance;
  var arr = [];
  await _firestore
      .collection('middleMan')
      .get()
      .then((data) => {
    for(int i = 0; i < data.docs.length; i++)
      {
        arr.add(
            {
              "uid": data.docs[i].data()['uid'],
              "email": data.docs[i].data()['email'],
              "userName": data.docs[i].data()['userName'],
              "royaltySlab": data.docs[i].data()['royaltySlab']
            })
      }
  });
  return arr;
}