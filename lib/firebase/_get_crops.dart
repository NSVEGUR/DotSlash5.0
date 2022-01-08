import 'package:cloud_firestore/cloud_firestore.dart';


getCrops()async{
  final _firestore = FirebaseFirestore.instance;
  var arr = [];
  await _firestore
      .collection('crops')
      .get()
      .then((data) => {
    for(int i = 0; i < data.docs.length; i++)
      {
        arr.add(
            {
              "cropId": data.docs[i].data()['cropId'],
              "cropName": data.docs[i].data()['cropName'],
              "farmerId": data.docs[i].data()['farmerId'],
              "royaltyPercentage": data.docs[i].data()['royaltyPercentage'],
              "quantity": data.docs[i].data()['quantity'],
              "ratePerKg": data.docs[i].data()['ratePerKg']
            })
      }
  });
  return arr;
}

getRatePerKg({required cropId})async{
  final _firestore = FirebaseFirestore.instance;
  var ratePerKg;
  await _firestore
      .collection('crops')
      .get().then((data)=>{
    for(int i = 0; i < data.docs.length; i++)
      {
        if(data.docs[i].data()['uid'] == cropId)
          ratePerKg = data.docs[i].data()['ratePerKg']
      }
  });
  return ratePerKg;
}

getQuantity({required cropId})async{
  final _firestore = FirebaseFirestore.instance;
  var quantity;
  await _firestore
      .collection('crops')
      .get().then((data)=>{
    for(int i = 0; i < data.docs.length; i++)
      {
        if(data.docs[i].data()['uid'] == cropId)
          quantity = data.docs[i].data()['quantity']
      }
  });
  return quantity;
}