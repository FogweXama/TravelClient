Map<String, dynamic> toJson(var textControllerFields) {
  final encodableFields = <String, dynamic>{};

  textControllerFields.forEach((field) {
    final propertyName = field.name.replaceAll("-", "_");

    encodableFields[propertyName] = field.value;
  });
  return encodableFields;
}

void fromJson(Map<String, dynamic> json, var textControllerFields) {
  textControllerFields.forEach((field) {
    final propertyName = field.name.replaceAll("-", "_");

    if (json.containsKey(propertyName)) {
      field.value = json[propertyName];
    }
  });
}
