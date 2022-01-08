import 'package:cloud_firestore/cloud_firestore.dart';
import '_get_crops.dart';


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

  //To get Royalty Percentage
  getRoyaltyPercentage()async{
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
  getAvailableCrops() async{
    return await getCrops();
  }

  //Adding a buy request
  addBuyRequest({required cropId, required quantity})async{
    await _firestore.collection('crops').doc(cropId).collection('buyRequests').doc(quantity).set({
      "buyerId": id,
      "quantity": quantity
    });
  }

  //
}