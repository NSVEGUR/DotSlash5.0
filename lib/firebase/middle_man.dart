import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotslash5/firebase/_get_crops_secondary.dart';
import '_get_crops.dart';
import '_manage_crops_user.dart';
import '_transactions.dart';


class MiddleMan{

  //Variables
  String id;
  late String type;
  var balance;
  var royaltySlab;
  final _firestore = FirebaseFirestore.instance;

  //Constructor
  MiddleMan({required this.id}){
    this.type = 'middleMan';
  }

  //To get Royalty Slab
  getRoyaltySlab()async{
    await _firestore
        .collection(type)
        .get().then((data)=>{
      for(int i = 0; i < data.docs.length; i++)
        {
          if(data.docs[i].data()['uid'] == id)
            royaltySlab = data.docs[i].data()['royaltySlab']
        }
    });
    return royaltySlab;
  }

  //To set Royalty Slab
  setRoyaltySlab({required royaltySlab}) async{

    await _firestore.collection(type).doc(id).set({
      'royaltySlab': royaltySlab
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

  //Get Available Crops
  getPrimaryCrops() async{
    return await getCrops();
  }

  //Available crops at the middleman
  getSecondaryCrops()async{
    return await getCropsSecondary();
  }

  //Available crops at me
  getMyCrops()async{
    return await getCropsFromUser(type: type, id: id);
  }

  //Adding a buy request
  addBuyRequest({required cropId, required quantity})async{
    await _firestore.collection('crops').doc(cropId).collection('buyRequests').doc(quantity).set({
      "buyerId": id,
      "quantity": quantity
    });
  }

  //adding buy requests to other middlemans secondary
  addBuyRequestSecondary({required cropId, required quantity})async{
    await _firestore.collection('secondaryCrops').doc(cropId).collection('buyRequests').doc(quantity).set({
      "buyerId": id,
      "quantity": quantity
    });
  }

  //Get Buy Request Secondary (for consumers or other middlemans)
  getBuyRequestSecondary({required cropId}) async{
    var arr = [];

    //To Show the buyers in the interface
    await _firestore
        .collection('secondaryCrops').doc(cropId).collection('buyRequests')
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

  // Accept Buy Request Secondary (accepting from consumers or other middlemans)
  acceptRequest({required cropId, required buyerId, required requiredQuantity, required buyerType})async {
    var availableQuantity = await getQuantitySecondary(cropId: cropId);
    requiredQuantity = double.parse(requiredQuantity);

    //Deleting the available quantity of crop
    await _firestore
        .collection('secondaryCrops').doc(cropId).collection('buyRequests').doc(availableQuantity).delete();
    availableQuantity = double.parse(availableQuantity);
    availableQuantity = availableQuantity - requiredQuantity;

    //Adding if still some more crop exis
    if(availableQuantity != 0) {
      await _firestore
          .collection('secondaryCrops').doc(cropId)
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

    var ratePerKg = await getRatePerKg(cropId: cropId);
    ratePerKg = double.parse(ratePerKg);
    var amount = requiredQuantity * ratePerKg;
    await _sellCrop(amount: amount, cropId: cropId, buyerId: buyerId, buyerType: buyerType, requiredQuantity: requiredQuantity);
  }
  //
  _sellCrop({required amount, required cropId, required buyerId, required buyerType, required requiredQuantity})async
  {
    final _transactions = Transactions(senderId: buyerId, senderType: buyerType, receiverId: id, receiverType: type, amount: amount, farmerId: id, cropId: cropId, quantity: requiredQuantity);
    await _transactions.initiateTransaction();
  }
}