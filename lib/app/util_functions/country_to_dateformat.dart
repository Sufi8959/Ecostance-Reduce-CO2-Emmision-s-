import 'dart:convert';

String getDateFormat(String iso3Code) {
  final List<dynamic> list = jsonDecode(_data);
  final string = list.firstWhere(
      (element) => element['iso3code'] == iso3Code.toUpperCase(),
      orElse: () =>
          {"iso3code": "ALB", "dateFormat": "yyyy-MM-dd"})['dateFormat'];

  return string;
}

const _data = """[
  {
    "iso3code": "ALB",
    "dateFormat": "yyyy-MM-dd"
  },
  {
    "iso3code": "ARE",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "ARG",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "AUS",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "AUT",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "BEL",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "BEL",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "BGR",
    "dateFormat": "yyyy-M-d"
  },
  {
    "iso3code": "BHR",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "BIH",
    "dateFormat": "yyyy-MM-dd"
  },
  {
    "iso3code": "BLR",
    "dateFormat": "d.M.yyyy"
  },
  {
    "iso3code": "BOL",
    "dateFormat": "dd-MM-yyyy"
  },
  {
    "iso3code": "BRA",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "CAN",
    "dateFormat": "yyyy-MM-dd"
  },
  {
    "iso3code": "CAN",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "CHE",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "CHE",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "CHE",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "CHL",
    "dateFormat": "dd-MM-yyyy"
  },
  {
    "iso3code": "CHN",
    "dateFormat": "yyyy-M-d"
  },
  {
    "iso3code": "COL",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "CRI",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "CYP",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "CZE",
    "dateFormat": "d.M.yyyy"
  },
  {
    "iso3code": "DEU",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "DNK",
    "dateFormat": "dd-MM-yyyy"
  },
  {
    "iso3code": "DOM",
    "dateFormat": "MM/dd/yyyy"
  },
  {
    "iso3code": "DZA",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "ECU",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "EGY",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "ESP",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "ESP",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "EST",
    "dateFormat": "d.MM.yyyy"
  },
  {
    "iso3code": "FIN",
    "dateFormat": "d.M.yyyy"
  },
  {
    "iso3code": "FRA",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "GBR",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "GRC",
    "dateFormat": "d/M/yyyy"
  },
  {
    "iso3code": "GTM",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "HKG",
    "dateFormat": "yyyy年M月d日"
  },
  {
    "iso3code": "HND",
    "dateFormat": "MM-dd-yyyy"
  },
  {
    "iso3code": "HRV",
    "dateFormat": "dd.MM.yyyy."
  },
  {
    "iso3code": "HUN",
    "dateFormat": "yyyy.MM.dd."
  },
  {
    "iso3code": "IDN",
    "dateFormat": "dd/MM/yyyy"
  },
  
  {
    "iso3code": "IND",
    "dateFormat": "d/M/yyyy"
  },
  {
    "iso3code": "IRL",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "IRL",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "IRQ",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "ISL",
    "dateFormat": "d.M.yyyy"
  },
  {
    "iso3code": "ISR",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "ITA",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "JOR",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "JPN",
    "dateFormat": "yyyy/MM/dd"
  },
  {
    "iso3code": "JPN",
    "dateFormat": "H24.MM.dd"
  },
  {
    "iso3code": "KOR",
    "dateFormat": "yyyy. M. d"
  },
  {
    "iso3code": "KWT",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "LBN",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "LBY",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "LTU",
    "dateFormat": "yyyy.M.d"
  },
  {
    "iso3code": "LUX",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "LUX",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "LVA",
    "dateFormat": "yyyy.d.M"
  },
  {
    "iso3code": "MAR",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "MEX",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "MKD",
    "dateFormat": "d.M.yyyy"
  },
  {
    "iso3code": "MLT",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "MLT",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "MNE",
    "dateFormat": "d.M.yyyy."
  },
  {
    "iso3code": "MYS",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "NIC",
    "dateFormat": "MM-dd-yyyy"
  },
  {
    "iso3code": "NLD",
    "dateFormat": "d-M-yyyy"
  },
  {
    "iso3code": "NOR",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "NOR",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "NZL",
    "dateFormat": "d/MM/yyyy"
  },
  {
    "iso3code": "OMN",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "PAN",
    "dateFormat": "MM/dd/yyyy"
  },
  {
    "iso3code": "PER",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "PHL",
    "dateFormat": "M/d/yyyy"
  },
  {
    "iso3code": "POL",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "PRI",
    "dateFormat": "MM-dd-yyyy"
  },
  {
    "iso3code": "PRT",
    "dateFormat": "dd-MM-yyyy"
  },
  {
    "iso3code": "PRY",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "QAT",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "ROU",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "RUS",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "SAU",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "SCG",
    "dateFormat": "d.M.yyyy."
  },
  {
    "iso3code": "SDN",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "SGP",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "SGP",
    "dateFormat": "M/d/yyyy"
  },
  {
    "iso3code": "SLV",
    "dateFormat": "MM-dd-yyyy"
  },
  {
    "iso3code": "SRB",
    "dateFormat": "d.M.yyyy."
  },
  {
    "iso3code": "SVK",
    "dateFormat": "d.M.yyyy"
  },
  {
    "iso3code": "SVN",
    "dateFormat": "d.M.yyyy"
  },
  {
    "iso3code": "SWE",
    "dateFormat": "yyyy-MM-dd"
  },
  {
    "iso3code": "SYR",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "THA",
    "dateFormat": "d/M/2555"
  },
  {
    "iso3code": "THA",
    "dateFormat": "๓/๖/๒๕๕๕"
  },
  {
    "iso3code": "TUN",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "TUR",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "TWN",
    "dateFormat": "yyyy/M/d"
  },
  {
    "iso3code": "UKR",
    "dateFormat": "dd.MM.yyyy"
  },
  {
    "iso3code": "URY",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "USA",
    "dateFormat": "M/d/yyyy"
  },
  {
    "iso3code": "USA",
    "dateFormat": "M/d/yyyy"
  },
  {
    "iso3code": "VEN",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "VNM",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "YEM",
    "dateFormat": "dd/MM/yyyy"
  },
  {
    "iso3code": "ZAF",
    "dateFormat": "yyyy/MM/dd"
  }
]""";
