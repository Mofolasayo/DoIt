import 'package:intl/intl.dart';

const twoFiftyMS = Duration(milliseconds: 250);
const fiveHundredMS = Duration(milliseconds: 500);
const sevenFiftyMS = Duration(milliseconds: 750);
const oneSecond = Duration(seconds: 1);
const twoSeconds = Duration(seconds: 2);
const threeSeconds = Duration(seconds: 3);
const fiveSeconds = Duration(seconds: 5);
const sevenSeconds = Duration(seconds: 7);
const tenSeconds = Duration(seconds: 10);
const oneMinute = Duration(minutes: 1);
const threeMinutes = Duration(minutes: 3);

const String nairaSign = '₦';

final numberFormatter = NumberFormat('#,###.##');
final compactNumberFormatter = NumberFormat.compact();
final kDateFormatEEEMMMd = DateFormat('EEE, MMM d');
final kDateFormatEdMhmma = DateFormat("EE d MMM, h:mm a");
final kDateFormathmma = DateFormat("h:mm a");

final kDateFormatJM = DateFormat('jm');
