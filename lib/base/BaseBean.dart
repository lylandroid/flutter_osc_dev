import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseBean<T> {
  int code;
  String msg;
  T data;

//  BaseBean(this.code, this.msg, this.data){
//    new T()
//  };

}

