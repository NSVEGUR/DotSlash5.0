import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nanoid/nanoid.dart';
import '_crops.dart';
import '_transactions.dart';
import '_get_crops.dart';
import '_get_crops_secondary.dart';
import '_manage_crops_user.dart';

class Farmer{

  //Variables
  String id;
  late String type;
  var crops = [];
  var balance;
  late String royaltyPercentage;
  final _firestore = FirebaseFirestore.instance;


  //Constructor
  Farmer({required this.id}){
    this.type = 'farmer';
   getCrops();
   getRoyaltyPercentage();
  }

  //To get Crops
  getCrops()async{
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

  //To get Royalty Percentage
  getRoyaltyPercentage()async{
    await _firestore
        .collection(type)
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
    await _firestore.collection(type).doc(id).set({
      'royaltyPercentage': royaltyPercentage
    });
  }

  //To get balance
  getBalance()async{
    await _firestore
        .collection(type)
        .get().then((data)=>{
      for(int i = 0; i < data.docs.length; i++)
        {
          if(data.docs[i].data()['uid'] == id)
            balance = data.docs[i].data()['balance']
        }
    });
    return balance;
  }

  //To set balance
  setBalance({required balance})async{
    await _firestore.collection(type).doc(id).set({
      'balance': balance
    });
  }

  //To add new crop
  addCrop({required cropName, required quantity, required ratePerKg}) async {
    var cropId = nanoid(10);
    var royaltyPercentage = await getRoyaltyPercentage();
    Crops(farmerId: id, cropName: cropName, cropId: cropId, royaltyPercentage: royaltyPercentage, quantity: quantity, ratePerKg: ratePerKg);
    await _firestore.collection(type).doc(id).collection('crops').doc(cropId).set({
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
    return arr;
  }

  //Accept Buy Request
  acceptRequest({required cropId, required buyerId, required requiredQuantity, required buyerType})async {
    var availableQuantity = await getQuantity(cropId: cropId);
    requiredQuantity = double.parse(requiredQuantity);

    //Making Transaction
    var ratePerKg = await getRatePerKg(cropId: cropId);
    var cropName = await getCropName(cropId: cropId);
    ratePerKg = double.parse(ratePerKg);
    var amount = requiredQuantity * ratePerKg;
    await _addCropsSecondary(buyerId: buyerId, buyerType: buyerType, cropId: cropId, cropName: cropName, quantity: requiredQuantity, ratePerKg: ratePerKg);
    await _sellCrop(amount: amount, cropId: cropId, buyerId: buyerId, buyerType: buyerType, requiredQuantity: requiredQuantity);

    //Deleting the available quantity of crop
    await _firestore
        .collection('crops').doc(cropId).collection('buyRequests').doc(availableQuantity).delete();
    availableQuantity = double.parse(availableQuantity);
    availableQuantity = availableQuantity - requiredQuantity;

    //Adding if still some more crop exis
    if(availableQuantity != 0) {
      await _firestore
          .collection('crops').doc(cropId)
          .collection('buyRequests').doc(availableQuantity)
          .set({
        "quantity": availableQuantity
      });
    } else {
      //Deleting in the farmer side and the crop
      await _firestore
          .collection('farmer').doc(id)
          .collection('crops').doc(cropId).delete();
      await _firestore
          .collection('crops').doc(cropId).delete();
    }
  }

  _sellCrop({required amount, required cropId, required buyerId, required buyerType, required requiredQuantity})async
  {
    final _transactions = Transactions(senderId: buyerId, senderType: buyerType, receiverId: id, receiverType: type, amount: amount, farmerId: id, cropId: cropId, quantity: requiredQuantity);
    await _transactions.initiateTransaction();
  }

  _addCropsSecondary({required buyerId, required cropId, required cropName, required quantity, required ratePerKg, required buyerType}) async{
    //Adding public
    await addCropsSecondary(farmerId:  id, cropId: cropId, quantity: quantity, cropName: cropName, ratePerKg: ratePerKg, royaltyPercentage: royaltyPercentage);

    //Adding to user(middleman/consumer)
    await addCropsToUser(type: buyerType, id: buyerId, cropId: cropId, cropName: cropName, quantity: quantity, ratePerKg: ratePerKg);
  }
  }