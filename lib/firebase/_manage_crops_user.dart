import 'package:cloud_firestore/cloud_firestore.dart';

addCropsToUser({required type, required id, required cropId, required cropName, required quantity, required ratePerKg})async{
  final _firestore = FirebaseFirestore.instance;
  await _firestore.collection(type).doc(id).collection('crops').doc(cropId).set({
    "cropName": cropName,
    "cropId": cropId,
    "quantity": quantity,
    "ratePerKg": ratePerKg
  });
}

getCropsFromUser({required type, required id})async{
  final _firestore = FirebaseFirestore.instance;
  var crops = [];
  await _firestore
      .collection(type).doc(id)
      .collection('crops')
      .get().then((data)=>{
    for(int i = 0; i < data.docs.length; i++)
      {
        crops.add(
            {
              "cropId": data.docs[i].data()['cropId'],
              "cropName": data.docs[i].data()['cropName'],
              "quantity": data.docs[i].data()['quantity'],
              "ratePerKg": data.docs[i].data()['ratePerKg'],
            })
      }
  });
  return crops;
}