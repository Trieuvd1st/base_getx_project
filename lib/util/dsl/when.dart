class When<OBJ, RES> {
  When(OBJ obj) : _obj = obj;

  OBJ _obj;
  RES? _res;
  bool _assertSuccess = false;

  When<OBJ, RES> judge(
      Predicate<OBJ> predicate, ResultBuilder<RES, OBJ> resultBuilder) {
    if (_assertSuccess) {
      return this;
    }
    if (predicate(_obj)) {
      _assertSuccess = true;
      _res = resultBuilder(_obj);
    }
    return this;
  }

  RES getOr(RES orElse) {
    if (_res == null) {
      return orElse;
    } else {
      return _res!;
    }
  }

  RES getOrElse(RES Function() builder) {
    if (_res == null) {
      return builder();
    } else {
      return _res!;
    }
  }

  RES? get() {
    return _res;
  }

  RES? trial() {
    if (_assertSuccess) {
      return _res;
    } else {
      throw NoMatchingCondition(_obj);
    }
  }

  When<OBJ, RES> eq(dynamic obj, ResultBuilder<RES, OBJ> resultBuilder) {
    return judge((subject) => subject == obj, resultBuilder);
  }

  When<OBJ, RES> type<T>(ResultBuilder<RES, T> resultBuilder) {
    if (_obj is T) {
      return judge((_) => true, (obj) => resultBuilder.call(obj as T));
    } else {
      return judge((_) => false, (_) => null);
    }
  }
}

class NoMatchingCondition extends Error {
  final dynamic obj;
  NoMatchingCondition(this.obj);

  @override
  String toString() {
    return "No matching conditions were found: ${obj?.toString() ?? "null"}";
  }
}

typedef Predicate<SUB> = bool Function(SUB? subject);
typedef ResultBuilder<RES, OBJ> = RES? Function(OBJ obj);
