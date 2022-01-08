import 'package:cloud_firestore/cloud_firestore.dart';
import '_get_crops.dart';
import '_manage_crops_user.dart';
import '_get_crops_secondary.dart';

class Consumer{
  String id;
  late String type;
  var balance;
  final _firestore = FirebaseFirestore.instance;
  Consumer({required this.id}){
    type = 'consumer';
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
    await _firestore.collection('crops').doc(cropId).collection('buyRequestsSecondary').doc(quantity).set({
      "buyerId": id,
      "quantity": quantity
    });
  }
}