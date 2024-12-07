import 'package:json_annotation/json_annotation.dart';

part 'data_base_response.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class DataBaseResponse<T> {
  @JsonKey(defaultValue: "")
  final String message;
  @JsonKey(defaultValue: "")
  final String error;
  @JsonKey()
  final T? data;

  DataBaseResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory DataBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$DataBaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataBaseResponseToJson(this, toJsonT);
}
