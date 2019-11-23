import 'package:cloud_firestore/cloud_firestore.dart';

//helper to intermediate data between the firestore
class FirestoreHelper{
  CollectionReference _collectionRef;
  FirestoreHelper(String collection){ //parametric constructor to initialize with given CollectionReference for the Firestore
     _collectionRef = Firestore.instance.collection(collection);
  }

  Future<String> addData(Map<String,dynamic> data) async{ //add data to collection
    var doc = await _collectionRef.add(data);
    return doc.documentID;
  }

  void addUniqueData(Map<String,dynamic> data,String key) async{ //add data for specific key
    _collectionRef.where(key,isEqualTo:data[key]).snapshots().listen((e) async {
      print(e.documents);
      if(e.documents.length == 0) await _collectionRef.add(data); //if no data was recieved await
    });  
  }

  Stream<QuerySnapshot> readAll() { //get stream of querysnapshots
    return _collectionRef.snapshots();
  }
  
  //delete data for given doc
  void deleteData(DocumentSnapshot doc) async{
    await _collectionRef.document(doc.documentID).delete();
  }
  
  //update data for given doc
  void updateData(Map<String,dynamic> data, DocumentSnapshot doc) async{
    await _collectionRef.document(doc.documentID).updateData(data);
  }

}