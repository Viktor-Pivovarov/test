/// currentValue - должно быть между minValue и maxValue
/// minValue - минимальное значение для currentValue
/// maxValue - максимальное значение для currentValue
/// from - от какого значения начиная с 0
/// to - от какого значения начиная с 1
double getDelta(
  double currentValue, {
  double minValue = 10,
  double maxValue = 50,
  double from = 0,
  double to = 1,
}) {
  return ((currentValue - minValue) / (maxValue - minValue)) * (to - from) +
      from;
}
