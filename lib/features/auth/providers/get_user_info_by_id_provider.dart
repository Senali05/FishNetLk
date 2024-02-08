import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fishnetlk/core/constants/firebaes_collection_names.dart';
import 'package:fishnetlk/features/auth/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserInfoByIdProvider =
    FutureProvider.autoDispose.family<UserModel, String>((ref, userId) {
  return FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.users)
      .doc(userId)
      .get()
      .then((userData) {
    return UserModel.fromMap(userData.data()!);
  });
});
