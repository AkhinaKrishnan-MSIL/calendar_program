import 'package:calendar_program/bloc_part/calendar_bloc.dart';
import 'package:calendar_program/bloc_part/calendar_state.dart';
import 'package:calendar_program/bloc_part/calender_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../calendar_data.dart';
import 'addevent_Screen.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat',];
  final List<String> daysInMonth = ['29 ', '30 ', '31 ', '1Feb ','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','1','2','3','4'];
  final List<int> sundays = [29, 5, 12, 19, 26];

  // bool sundaycheck(int dayInMonth)
  // {
  //   if (sundays.contains(daysInMonth)){
  //     print(dayInMonth);
  //     return true;
  //   }
  //   return false;
  // }
  //
  Widget checkEventsAvailable(List<CalendarData> list, String date) {
    for (var element in list) {
      if (date == element.Date) {
        return Container(
          decoration:BoxDecoration(
              color:Colors.blue,
            borderRadius:BorderRadius.all(Radius.circular(4))
          ),
          child: Text(
            element.eventname + ' ' + element.eventtime,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        );
      }
    }
    return const Padding(padding: EdgeInsets.zero);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white70,
        title: Text(
          "February 2023",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
        ),
        elevation:0,
      ),
      body: BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                height: 20.0,
                child: Row(
                  children: daysOfWeek
                      .map((day) => Expanded(
                            child: Text(
                              day,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 7,
                  children: List.generate(daysInMonth.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddeventScreen(
                                    dateValue: '${index + 1}',
                                  )),
                        );
                        print('${index + 1}');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // color:sundaycheck(daysInMonth[index])?Colors.white30:Colors.white,
                            border:
                                Border.all(color: Colors.grey, width: 0.5)),
                        padding: EdgeInsets.all(0.0),
                        child: Column(
                          //mainAxisAlignment:MainAxisAlignment.end,
                          crossAxisAlignment:CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${daysInMonth[index]}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            checkEventsAvailable(
                                state.localData, '${index + 1}')
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
