




import '../calendar_data.dart';

class CalendarState{
  var localData = <CalendarData>[];

CalendarState
    ({required this.localData});
}

class CalendarInitial extends CalendarState{
CalendarInitial(): super(localData:<CalendarData>[]);
}