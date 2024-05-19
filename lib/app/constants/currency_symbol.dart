String getCurrencySymbol(String code) =>
    currencySymbols[code.toUpperCase()] ?? "\$";
Map<String, String> currencySymbols = {
  "USD": "\$",
  "CAD": "\$",
  "GBP": "£",
  "EUR": "€",
  "INR": "₹",
  "JPY": "¥",
  "CNY": "¥"
};
