// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// class Server {
//
//   Future<String> createCheckout() async {
//     final auth = 'Basic ${base64Encode(utf8.encode('$secretKey:'))}';
//     final body = {
//       'payment_method_types[]': 'card',
//       'line_items': [
//         {
//           "price_data": {
//             "currency": 'usd',
//             "product_data": {
//               "name": 'T-shirt',
//             },
//             "unit_amount": 2000,
//           },
//           "quantity": 1,
//         },
//         {
//           "price_data": {
//             "currency": 'usd',
//             "product_data": {
//               "name": 'Book',
//             },
//             "unit_amount": 40000,
//           },
//           "quantity": 1,
//         },
//       ],
//       'mode': 'payment',
//       'success_url': 'https://successebc.ebc/checkout/success?success=true?session_id={CHECKOUT_SESSION_ID}',
//       'cancel_url': 'https://cancelebc.ebc/checkout/cancel?cancel=true?session_id={CHECKOUT_SESSION_ID}',
//     };
//
//     try {
//       final result = await Dio().post(
//         "https://api.stripe.com/v1/checkout/sessions",
//         data: body,
//         options: Options(
//           headers: {HttpHeaders.authorizationHeader: auth},
//           contentType: "application/x-www-form-urlencoded",
//         ),
//       );
//       return result.data['id'];
//     } on DioError catch (e, s) {
//       //print(e.response);
//       throw e;
//     }
//   }
//
//
//
//
// }
//

const String samplepyload = """{
  "items": [
    {
      "price_data": {
        "currency": "usd",
        "product_data": {
          "name": "Kariba REDD+",
          "images": [
            "https://res.cloudinary.com/cloudhungry/image/upload/v1653386880/ebc/Card_3_j0xjjq.png",
            "https://yourimageshare.com/ib/fAt4aZ3anQ.png",
            "https://yourimageshare.com/ib/RHdoqEhvuo.png",
            "https://yourimageshare.com/ib/Ov839mhNGL.png",
            "https://yourimageshare.com/ib/rwdnwEZR5r.png",
            "https://yourimageshare.com/ib/EcTyyVpclj.png",
            "https://yourimageshare.com/ib/ZyQgASMIBv.png",
            "https://yourimageshare.com/ib/Eh1hkn6vnq.png"
          ]
        },
        "unit_amount_decimal": "1500",
        "recurring": {}
      },
      "quantity": 1
    },
    {
      "price_data": {
        "currency": "usd",
        "product_data": {
          "name": "Kariba REDD+",
          "images": [
            "https://res.cloudinary.com/cloudhungry/image/upload/v1653386880/ebc/Card_3_j0xjjq.png",
            "https://yourimageshare.com/ib/fAt4aZ3anQ.png",
            "https://yourimageshare.com/ib/RHdoqEhvuo.png",
            "https://yourimageshare.com/ib/Ov839mhNGL.png",
            "https://yourimageshare.com/ib/rwdnwEZR5r.png",
            "https://yourimageshare.com/ib/EcTyyVpclj.png",
            "https://yourimageshare.com/ib/ZyQgASMIBv.png",
            "https://yourimageshare.com/ib/Eh1hkn6vnq.png"
          ]
        },
        "unit_amount_decimal": "1500",
        "recurring": {}
      },
      "quantity": 1
    },
    {
      "price_data": {
        "currency": "usd",
        "product_data": {
          "name": "Kariba REDD+",
          "images": [
            "https://res.cloudinary.com/cloudhungry/image/upload/v1653386880/ebc/Card_3_j0xjjq.png",
            "https://yourimageshare.com/ib/fAt4aZ3anQ.png",
            "https://yourimageshare.com/ib/RHdoqEhvuo.png",
            "https://yourimageshare.com/ib/Ov839mhNGL.png",
            "https://yourimageshare.com/ib/rwdnwEZR5r.png",
            "https://yourimageshare.com/ib/EcTyyVpclj.png",
            "https://yourimageshare.com/ib/ZyQgASMIBv.png",
            "https://yourimageshare.com/ib/Eh1hkn6vnq.png"
          ]
        },
        "unit_amount_decimal": "1500",
        "recurring": {}
      },
      "quantity": 3
    }
  ],
  "email": "ameya.pai1990@gmail.com",
  "paymentMode": "payment"
}""";
