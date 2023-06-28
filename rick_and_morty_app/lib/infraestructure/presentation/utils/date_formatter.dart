import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

String formatDateToSpanish(String dateStr) {
  try {
    initializeDateFormatting('es');

    DateTime date = DateFormat('MMMM d, y', 'en_US').parse(dateStr);
    String formattedDate = DateFormat.yMMMMd('es').format(date);

    return formattedDate;
  } catch (e) {
    return dateStr;
  }
}
