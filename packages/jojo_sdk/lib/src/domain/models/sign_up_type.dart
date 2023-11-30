enum SignUpType {
  google,
  appleId,
  tg;

  static SignUpType find(String value) {
    return SignUpType.values.firstWhere(
      (SignUpType element) => element.name == value,
    );
  }
}
