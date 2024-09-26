import 'package:flutter/material.dart';

pushRelacement(context, Widget newView) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    return newView;
  }));
}

pushTo(BuildContext context, Widget newView) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return newView;
  }));
// ignore: unused_element
 pushAndRemoveUntil(BuildContext context, Widget newView) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => newView),
    (Route<dynamic> route) => false, // This removes all the previous routes.
  );
}

}
