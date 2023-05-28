import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_v1/constants/appwrite_constants.dart';

final appwriteClientProvider = Provider((ref) {
  final client = Client();
  client
      .setEndpoint(AppwriteConstants.endpoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);
  return client;
});

///ref is used to interact with other providers
final appwriteAccountProvider = Provider((ref) {
  final account = Account(ref.watch(appwriteClientProvider));
  return account;
});
