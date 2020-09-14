import 'Error/IError.dart';

abstract class IResponseModel<T> {
  T map;
  List<T> list;
  IError error;
  bool isSucces = false;
}
