import 'package:todo_app/util/toast_service.dart';

extension UsefulExtensions<T> on Future<T?> {
  Future<T?> tryCatch({Function(dynamic)? onError, returnValue}) async {
    try {
      return await this;
    } catch (e, stackTrace) {
      if (onError == null) {
        // print("message: ${e.toString()}");
        // print("stackTrace: $stackTrace");
        ToastService.showErrorToast(message: e.toString());
      } else {
        onError(e);
        // print("stackTrace: $stackTrace");
        // print("message: ${e.toString()}");
      }
      return returnValue;
    }
  }
// Future<T?> wrapWithLoader({Function(dynamic)? onError, returnValue}) async {
//     try {
//       showFullScreenDialog(true);
//       var value = await this;
//       showFullScreenDialog(false);
//       return value;
//     } catch (e) {
//       showFullScreenDialog(false);
//       if (onError == null) {
//         ToastService.showErrorToast(message: e.toString());
//       } else {
//         onError(e);
//       }
//       return returnValue;
//     }
//   }
}
