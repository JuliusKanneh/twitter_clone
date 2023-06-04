import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone_v1/constants/constants.dart';
import 'package:twitter_clone_v1/core/core.dart';
import 'package:twitter_clone_v1/core/providers.dart';
import 'package:twitter_clone_v1/models/user_model.dart';

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
  Future<Document> getUserData(String uid);
}

final userAPIProvider = Provider((ref) {
  return UserAPI(db: ref.watch(appwriteDatabaseProvider));
});

class UserAPI implements IUserAPI {
  final Databases _db;

  const UserAPI({required Databases db}) : _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.userCollectionId,
        documentId: userModel.uid,
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          message: e.message ?? 'Unexpected error occured.',
          stackTrace: st,
        ),
      );
    } catch (e, st) {
      return left(
        Failure(
          message: e.toString(),
          stackTrace: st,
        ),
      );
    }
  }

  @override
  Future<Document> getUserData(String uid) async {
    return _db.getDocument(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.userCollectionId,
      documentId: uid,
    );
  }
}
