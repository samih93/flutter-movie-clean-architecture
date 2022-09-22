import 'package:movie/core/network/errormessage_model.dart';

class ServerExeption implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerExeption({required this.errorMessageModel});
}
