import 'package:json_annotation/json_annotation.dart';

part 'page_base_response.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class PageBaseResponse<T> {
  @JsonKey(name: "current_page", defaultValue: 0, readValue: getFromMeta)
  final int currentPage;
  @JsonKey(name: "from", defaultValue: 0, readValue: getFromMeta)
  final int from;
  @JsonKey(name: "last_page", defaultValue: 0, readValue: getFromMeta)
  final int lastPage;
  @JsonKey(name: "total", defaultValue: 0, readValue: getFromMeta)
  final int total;
  @JsonKey()
  final T? data;

  PageBaseResponse({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.total,
    required this.data,
  });

  factory PageBaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PageBaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PageBaseResponseToJson(this, toJsonT);

  static int? getFromMeta(Map<dynamic, dynamic> json, String name) {
    if (json.containsKey("meta")) {
      return json[name] ?? json["meta"][name];
    } else {
      return json[name];
    }
  }
}
