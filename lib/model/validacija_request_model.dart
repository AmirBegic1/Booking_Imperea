class ValidacijaRequestModel {
  ValidacijaRequestModel({
    required this.id,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.jib,
    required this.fullName,
    required this.email,
    required this.isApproved,
  });
  late final int id;
  late final String userId;
  late final String createdAt;
  late final String updatedAt;
  late final bool isDeleted;
  late final String jib;
  late final String fullName;
  late final String email;
  late final bool isApproved;

  ValidacijaRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
    jib = json['jib'];
    fullName = json['fullName'];
    email = json['email'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['isDeleted'] = isDeleted;
    _data['jib'] = jib;
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['isApproved'] = isApproved;
    return _data;
  }
}
