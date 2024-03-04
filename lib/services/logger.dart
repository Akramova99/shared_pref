import 'package:logger/logger.dart';

class LoggerService {
  static var logger = Logger();
  static debugLogger({required String text}){
     logger.d(text);

  }

  // logger.t("Trace log");
  //
  //
  // logger.i("Info log");
  //
  // logger.w("Warning log");
  //
  // logger.e("Error log", error: 'Test Error');
  //
  // logger.f("What a fatal log", error: error, stackTrace: stackTrace);

}