double getCurrencyMinimumAmount(String currencyCode) {
  return currencyMinimumMap[currencyCode] ?? 0.5;
}

Map<String, double> currencyMinimumMap = {
  'USD': 0.5,
  'CAD': 0.5,
  'GBP': 0.3,
  'EUR': 0.5,
  'INR': 0.5,
  'JPY': 50,
  'CNY': 0.5,
};
