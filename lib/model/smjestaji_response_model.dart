class SmjestajiResponseModel {
  SmjestajiResponseModel({
    required this.take,
    required this.skip,
    this.whereClause,
    required this.ordering,
    required this.includes,
  });
  late final int take;
  late final int skip;
  late final Null whereClause;
  late final List<Ordering> ordering;
  late final List<Includes> includes;

  SmjestajiResponseModel.fromJson(Map<String, dynamic> json) {
    take = json['take'];
    skip = json['skip'];
    whereClause = null;
    ordering =
        List.from(json['ordering']).map((e) => Ordering.fromJson(e)).toList();
    includes =
        List.from(json['includes']).map((e) => Includes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['take'] = take;
    _data['skip'] = skip;
    _data['whereClause'] = whereClause;
    _data['ordering'] = ordering.map((e) => e.toJson()).toList();
    _data['includes'] = includes.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Ordering {
  Ordering({
    required this.path,
    required this.order,
  });
  late final String path;
  late final String order;

  Ordering.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['path'] = path;
    _data['order'] = order;
    return _data;
  }
}

class Includes {
  Includes({
    required this.path,
    required this.filter,
  });
  late final String path;
  late final Filter filter;

  Includes.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    filter = Filter.fromJson(json['filter']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['path'] = path;
    _data['filter'] = filter.toJson();
    return _data;
  }
}

class Filter {
  Filter({
    required this.take,
    required this.skip,
    this.whereClause,
    this.ordering,
    this.includes,
  });
  late final int take;
  late final int skip;
  late final Null whereClause;
  late final Null ordering;
  late final Null includes;

  Filter.fromJson(Map<String, dynamic> json) {
    take = json['take'];
    skip = json['skip'];
    whereClause = null;
    ordering = null;
    includes = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['take'] = take;
    _data['skip'] = skip;
    _data['whereClause'] = whereClause;
    _data['ordering'] = ordering;
    _data['includes'] = includes;
    return _data;
  }
}
