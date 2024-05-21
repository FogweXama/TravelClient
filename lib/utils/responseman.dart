import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> createStatusCode(
    var x, BuildContext y) {
  if (x.statusCode == 201) {
    return ScaffoldMessenger.of(y).showSnackBar(
      const SnackBar(content: Text('Record created successfully')),
    );
  } else {
    return ScaffoldMessenger.of(y).showSnackBar(
      const SnackBar(content: Text('Error creating record')),
    );
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> updateStatusCode(
    var x, BuildContext y) {
  if (x.statusCode == 200) {
    return ScaffoldMessenger.of(y).showSnackBar(
      const SnackBar(content: Text('Record updated successfully')),
    );
  } else {
    return ScaffoldMessenger.of(y).showSnackBar(
      const SnackBar(content: Text('Error updating record')),
    );
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> deleteStatusCode(
    var x, BuildContext y) {
  if (x.statusCode == 200) {
    return ScaffoldMessenger.of(y).showSnackBar(
      const SnackBar(content: Text('Record deleted successfully')),
    );
  } else {
    return ScaffoldMessenger.of(y).showSnackBar(
      const SnackBar(content: Text('Error deleting record')),
    );
  }
}
