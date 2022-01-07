import 'package:cloud_firestore/cloud_firestore.dart';
import '_get_crops.dart';


class MiddleMan{

  //Variables
  String id;
  final _firestore = FirebaseFirestore.instance;

  //Constructor
  MiddleMan({required this.id});

  //To set Royalty Slab
  setRoyaltyPercentage({required royaltySlab}) async{
    await _firestore.collection('middleMan').doc(id).set({
      'royaltySlab': royaltySlab
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