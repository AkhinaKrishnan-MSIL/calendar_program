

import 'package:calendar_program/calendar_data.dart';

abstract class CalendarEvent{
}

class SaveDetails extends CalendarEvent
{
   SaveDetails({required this.data});
   CalendarData data;
}