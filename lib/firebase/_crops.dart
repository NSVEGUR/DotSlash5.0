import 'package:cloud_firestore/cloud_firestore.dart';


class Crops{

  //Variables
  String farmerId;
  String cropName;
  String cropId;
  String royaltyPercentage;
  String quantity;
  String ratePerKg;
  final _firestore = FirebaseFirestore.instance;


  //Constructor
  Crops({required this.farmerId, required this.cropName, required this.cropId, required this.royaltyPercentage, required this.quantity, required this.ratePerKg}){
    intialiseInFireBase();
  }

  intialiseInFireBase()async{
    await _firestore.collection('crops').doc(cropId).set({
      "cropId": cropId,
      "cropName": cropName,
      "farmerId": farmerId,
      "quantity": quantity,
      "ratePerKg": ratePerKg,
      "royaltyPercentage": royaltyPercentage,
    });
  }
}