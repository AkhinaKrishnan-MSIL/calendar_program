

import 'package:calendar_program/calendar_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'calendar_state.dart';
import 'calender_event.dart';
class CalendarBloc extends Bloc<CalendarEvent,CalendarState> {

  var localData = <CalendarData>[];

CalendarBloc():super(CalendarInitial())
{
  on<CalendarEvent>((event, emit){
   if(event is SaveDetails)
     {
       localData.add(event.data);

       emit(CalendarState(localData: localData));
     }
  });
}

}
