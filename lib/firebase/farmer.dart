import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nanoid/nanoid.dart';
import '_crops.dart';

class Farmer{

  //Variables
  String id;
  var crops = [];
  late String royaltyPercentage;
  final _firestore = FirebaseFirestore.instance;


  //Constructor
  Farmer({required this.id}){
   _getCrops();
   _getRoyaltyPercentage();
  }

  //To get Crops
  _getCrops()async{
   await _firestore
       .collection('farmer').doc(id)
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

  //To get Royalty Percentage
  _getRoyaltyPercentage()async{
    await _firestore
        .collection('farmer')
        .get().then((data)=>{
      for(int i = 0; i < data.docs.length; i++)
        {
          if(data.docs[i].data()['uid'] == id)
            royaltyPercentage = data.docs[i].data()['royaltyPercentage']
        }
    });
    return royaltyPercentage;
  }

  //To set Royalty Percentage
  setRoyaltyPercentage({required royaltyPercentage}) async{
    await _firestore.collection('farmer').doc(id).set({
      'royaltyPercentage': royaltyPercentage
    });
  }

  //To add new crop
  addCrop({required cropName, required quantity, required ratePerKg}) async {
    var cropId = nanoid(10);
    var royaltyPercentage = await _getRoyaltyPercentage();
    Crops(farmerId: id, cropName: cropName, cropId: cropId, royaltyPercentage: royaltyPercentage, quantity: quantity, ratePerKg: ratePerKg);
    await _firestore.collection('farmer').doc(id).collection('crops').doc(cropId).set({
        "cropName": cropName,
        "cropId": cropId,
        "quantity": quantity,
        "ratePerKg": ratePerKg
    });
  }

  //Get Buy Request
  getBuyRequest({required cropId}) async{
    var arr = [];

    //To Show the buyers in the interface
    await _firestore
        .collection('crops').doc(cropId).collection('buyRequests')
        .get().then((data)=>{
      for(int i = 0; i < data.docs.length; i++)
        {
          arr.add(
              {
                "buyerId": data.docs[i].data()['buyerId'],
                "quantity": data.docs[i].data()['quantity'],
              })
        }
    });
  }

  //Accept Buy Request
  acceptRequest({required cropId, required buyerId, required requiredQuantity})async
  {
    var availableQuantity;
    await _firestore
        .collection('farmer').doc(id)
        .collection('crops').get().then((data)=>{
      for(int i = 0; i < data.docs.length; i++)
        {
         if(data.docs[i].data()["cropId"] == cropId)
           availableQuantity = data.docs[i].data()["quantity"]
        }
     });
    requiredQuantity = double.parse(requiredQuantity);

    //Deleting the available quantity of crop
    await _firestore
    .collection('crops').doc(cropId).collection('buyRequests').doc(availableQuantity).delete();
    availableQuantity = double.parse(availableQuantity);
    availableQuantity = availableQuantity - requiredQuantity;

    //Adding if still some more crop exists
    if(availableQuantity != 0) {
        await _firestore
            .collection('crops').doc(cropId)
            .collection('buyRequests').doc(availableQuantity)
            .set({
            "quantity": availableQuantity
             });
      } else {
       //Deleting in the farmer side
      await _firestore
          .collection('farmer').doc(id)
          .collection('crops').doc(cropId).delete();
    }

  }


}