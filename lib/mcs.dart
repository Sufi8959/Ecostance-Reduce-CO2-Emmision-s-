Map map = {
  "senderId": null,
  "category": null,
  "collapseKey": "com.netcarbons.app",
  "contentAvailable": false,
  "data": {"score": 850, "time": 2.45},
  "from": "/topics/weather",
  "messageId": "0:1667803274908439%72fcb72972fcb729",
  "messageType": null,
  "mutableContent": false,
  "notification": {
    "title": "Test notification",
    "titleLocArgs": [],
    "titleLocKey": null,
    "body": "A Test notification has been recived.",
    "bodyLocArgs": [],
    "bodyLocKey": null,
    "android": {
      "channelId": null,
      "clickAction": null,
      "color": null,
      "count": null,
      "imageUrl": null,
      "link": null,
      "priority": 0,
      "smallIcon": null,
      "sound": null,
      "ticker": null,
      "tag": null,
      "visibility": 0
    },
    "apple": null,
    "web": null
  },
  "sentTime": 1667803274386,
  "threadId": null,
  "ttl": 2419200
};
Map sap = {
  "message": {
    "token": "bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
    "notification": {
      "title": "Match update",
      "body": "Arsenal goal in added time, score is now 3-0"
    },
    // "android": {
    //   "ttl":"86400s",
    //   "notification"{
    //     "click_action":"OPEN_ACTIVITY_1"
    //   }
    // },
    "apns": {
      "headers": {
        "apns-priority": "5",
      },
      "payload": {
        "aps": {"category": "NEW_MESSAGE_CATEGORY"}
      }
    },
    "webpush": {
      "headers": {"TTL": "86400"}
    }
  }
};
