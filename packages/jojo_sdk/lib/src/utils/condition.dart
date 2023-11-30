T condition<T>(bool condition, T onTrue, T onFalse) {
  if (condition) {
    return onTrue;
  }

  return onFalse;
}
