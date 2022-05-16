import 'package:mapoutapp/utils/constants/key_constants.dart';

class ResGoogleSignInModel {
  late String displayName;
  late String email;
  late String id;
  late String photoUrl;
  late String token;

  ResGoogleSignInModel(
      {required this.displayName, required this.email, required this.id, required this.photoUrl, required this.token});

  ResGoogleSignInModel.fromJson(Map<String, dynamic> json) {
    displayName = json[KeyConstants.googleDisplayName];
    email = json[KeyConstants.googleEmail];
    id = json[KeyConstants.googleId];
    photoUrl = json[KeyConstants.googlePhotoUrl];
    token = json[KeyConstants.googleToken];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[KeyConstants.googleDisplayName] = displayName;
    data[KeyConstants.googleEmail] = email;
    data[KeyConstants.googleId] = id;
    data[KeyConstants.googlePhotoUrl] = photoUrl;
    data[KeyConstants.googleToken] = token;
    return data;
  }
}