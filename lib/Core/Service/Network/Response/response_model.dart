import 'Error/IError.dart';
import 'IResponse_model.dart';

class ResponseModel<T> extends IResponseModel<T> {
  T map;
  List<T> list;
  IError error;
  bool isSucces = false;
}
