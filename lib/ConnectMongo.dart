
import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase{
  static var db, userCollection;
  static connect()async{
     db=await Db.create("mongodb+srv://bashayer:bashayer@cluster0.shzseck.mongodb.net/youtube?retryWrites=true&w=majority");
    await db.open();
    inspect(db);

    userCollection =db.collection("users");



    print (await userCollection.find().toList());
  }
}