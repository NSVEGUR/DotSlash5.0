import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'farmer.dart';

class Transactions {

  //Firebase
  final _firestore = FirebaseFirestore.instance;

  //Local Variables
  String senderId;
  String senderType;
  String receiverId;
  String receiverType;
  String farmerId;
  String amount;
  late Farmer farmer;
  Transactions({required this.senderId, required this.senderType, required this.receiverId, required this.receiverType, required this.amount, required this.farmerId}){
    farmer = Farmer(id: farmerId);
  }


  initiateTransaction() async{

    double transactionAmount = double.parse(amount);

    //Farmer Royalty
    var royaltyPercentage = await farmer.getRoyaltyPercentage();
    royaltyPercentage = double.parse(royaltyPercentage);
    double remaining;


    //At Sender End
    var senderBalance = await getAvailablebalance(senderId, senderType);
    senderBalance = double.parse(senderBalance);
    remaining = senderBalance - transactionAmount;
    await _firestore.collection(senderType).doc(senderId).set({
      "balance": remaining,
    });
    await _firestore.collection(senderType).doc(senderId).collection('transactions').add({
      "id": receiverId,
      "amount": transactionAmount,
    });

    //At Receiver End
    var receiverBalance = await getAvailablebalance(receiverId, receiverType);
    receiverBalance = double.parse(receiverBalance);
    remaining = (receiverBalance + transactionAmount) - (amount*royaltyPercentage);
    await _firestore.collection(receiverType).doc(receiverId).set({
      "balance": remaining,
    });
    await _firestore.collection(receiverType).doc(receiverId).collection('transactions').add({
      "id": senderId,
      "amount": transactionAmount,
    });

    //At Farmer End
    var farmerBalance = await getAvailablebalance(farmerId, 'farmer');
    farmerBalance = double.parse(farmerBalance);
    remaining = farmerBalance + (transactionAmount * royaltyPercentage);
    await _firestore.collection('farmer').doc(farmerId).set({
       "balance": remaining
    });
    await _firestore.collection('farmer').doc(farmerId).collection('transactions').add({
      "id": receiverId,
      "amount": transactionAmount,
    });
  }

  getAvailablebalance(String id,String type)async{
    var balance;
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
}