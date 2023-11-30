class ReactiveErrors {
  static Map<String, String Function(Object)> get errorMethods =>
      <String, String Function(Object)>{};

  static String pattern(Object variables) {
    return 'ошибка в введенных данных';
  }

//   static String? getErrorString(Map<String, Object> errors) {
//     if (errors.entries.isNotEmpty) {
//       final String firstKey = errors.keys.first;
//       final dynamic firstValue = errors.values.first;

//       if (firstValue == true) {
//         return tr('validationErrors.$firstKey');
//       }

//       if (errorMethods[firstKey] != null) {
//         return errorMethods[firstKey]!(firstValue).toString();
//       } else {
//         // logger.e('ReactiveErrors: method: $firstKey not found');
//       }

//       return errors.entries.first.value.toString();
//     }

//     return null;
//   }

//   static String maxLength(Map<String, Object> variables) {
//     return tr('validationErrors.maxLength', namedArgs: <String, String>{
//       'requiredLength': variables['requiredLength'].toString(),
//       'actualLength': variables['actualLength'].toString(),
//     });
//   }

//   static String minLength(Map<String, Object> variables) {
//     return tr('validationErrors.minLength', namedArgs: <String, String>{
//       'requiredLength': variables['requiredLength'].toString(),
//       'actualLength': variables['actualLength'].toString(),
//     });
//   }

//   static String min(Map<String, dynamic> variables) {
//     return tr('validationErrors.min', namedArgs: <String, String>{
//       'requiredLength': variables['min'].toString(),
//       'actualLength': variables['actual'].toString(),
//     });
//   }

//   static String max(Map<String, dynamic> variables) {
//     return tr('validationErrors.max', namedArgs: <String, String>{
//       'requiredLength': variables['max'].toString(),
//       'actualLength': variables['actual'].toString(),
//     });
//   }

//   static String email(String email) {
//     return tr('validationErrors.email');
//   }

//   static String pattern(Map<String, dynamic> variables) {
//     return tr('validationErrors.pattern');
//   }
// }
}
