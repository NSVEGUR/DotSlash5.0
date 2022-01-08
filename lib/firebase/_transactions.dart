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
  String cropId;
  String quantity;
  double maxLimit = 100000;
  late Farmer farmer;
  Transactions({required this.senderId, required this.senderType, required this.receiverId, required this.receiverType, required this.amount, required this.farmerId, required this.cropId, required this.quantity}){
    farmer = Farmer(id: farmerId);
  }


  initiateTransaction() async{
    double transactionAmount = double.parse(amount);
    if(transactionAmount >=  maxLimit)
    {
     _initiateWithRoyaltyCut(transactionAmount: transactionAmount);
    }else{
      _initiateWithoutRoyaltyCut(transactionAmount: transactionAmount);
    }

  }

  _getAvailablebalance(String id,String type)async{
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

  _initiateWithRoyaltyCut({required double transactionAmount})async{

    //Farmer Royalty
    var royaltyPercentage = await farmer.getRoyaltyPercentage();
    royaltyPercentage = double.parse(royaltyPercentage);
    double remaining;

    //At Sender End
    var senderBalance = await _getAvailablebalance(senderId, senderType);
    senderBalance = double.parse(senderBalance);
    remaining = senderBalance - transactionAmount;
    await _firestore.collection(senderType).doc(senderId).set({
      "balance": remaining,
    });
    await _firestore.collection(senderType).doc(senderId).collection('transactions').add({
      "id": receiverId,
      "amount": transactionAmount,
      "type": 'sent',
      "cropId": cropId,
      "quantity": quantity
    });

    //At Receiver End
    var receiverBalance = await _getAvailablebalance(receiverId, receiverType);
    receiverBalance = double.parse(receiverBalance);
    remaining = (receiverBalance + transactionAmount) - (amount*royaltyPercentage);
    await _firestore.collection(receiverType).doc(receiverId).set({
      "balance": remaining,
    });
    await _firestore.collection(receiverType).doc(receiverId).collection('transactions').add({
      "id": senderId,
      "amount": transactionAmount,
      "type": 'received',
      "cropId": cropId,
      "quantity": quantity
    });

    //At Farmer End
    var farmerBalance = await _getAvailablebalance(farmerId, 'farmer');
    farmerBalance = double.parse(farmerBalance);
    remaining = farmerBalance + (transactionAmount * royaltyPercentage);
    await _firestore.collection('farmer').doc(farmerId).set({
      "balance": remaining
    });
    await _firestore.collection('farmer').doc(farmerId).collection('transactions').add({
      "id": receiverId,
      "amount": transactionAmount,
      "type": 'royalty',
      "cropId": cropId,
      "quantity": quantity
    });
  }

  _initiateWithoutRoyaltyCut({required double transactionAmount})async{

    double remaining;

    //At Sender End
    var senderBalance = await _getAvailablebalance(senderId, senderType);
    senderBalance = double.parse(senderBalance);
    remaining = senderBalance - transactionAmount;
    await _firestore.collection(senderType).doc(senderId).set({
      "balance": remaining,
    });
    await _firestore.collection(senderType).doc(senderId).collection('transactions').add({
      "id": receiverId,
      "amount": transactionAmount,
      "type": 'sent',
      "cropId": cropId,
      "quantity": quantity
    });

    //At Receiver End
    var receiverBalance = await _getAvailablebalance(receiverId, receiverType);
    receiverBalance = double.parse(receiverBalance);
    remaining = receiverBalance + transactionAmount;
    await _firestore.collection(receiverType).doc(receiverId).set({
      "balance": remaining,
    });
    await _firestore.collection(receiverType).doc(receiverId).collection('transactions').add({
      "id": senderId,
      "amount": transactionAmount,
      "type": 'received',
      "cropId": cropId,
      "quantity": quantity
    });
  }
}