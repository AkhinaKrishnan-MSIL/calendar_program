import 'package:calendar_program/bloc_part/calendar_bloc.dart';
import 'package:calendar_program/bloc_part/calender_event.dart';
import 'package:calendar_program/screens/calendar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../calendar_data.dart';

class AddeventScreen extends StatefulWidget {
  String dateValue;
  AddeventScreen({super.key, required this.dateValue});
  @override
  State<AddeventScreen> createState() => _AddeventScreenState();
}

class _AddeventScreenState extends State<AddeventScreen> {
  var eventController = TextEditingController();
  var eventTime = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Event Details",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body:Padding(
        padding:EdgeInsets.all(15),
        child:Column(
          children: [
             Padding(padding:EdgeInsets.all(15),
              child:TextField(maxLength:12,
                controller: eventController,
                decoration:InputDecoration(
                border:OutlineInputBorder(),
                labelText:'Event Name',
                hintText: 'Enter Your Event Name'
              ),),
            ),
             Padding(padding:EdgeInsets.all(15),

              child:TextField(maxLength:7,
                controller: eventTime,
                decoration:InputDecoration(
                  border:OutlineInputBorder(),
                  labelText:'Event Time',
                  hintText: 'Enter Your Event Time'
              ),),
            ),
          ElevatedButton(
              onPressed:(){
                context.read<CalendarBloc>().add(SaveDetails(
                    data: CalendarData(
                        eventname: eventController.text ,
                        eventtime: eventTime.text,
                        Date: widget.dateValue )));
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) =>CalendarScreen()),
                );
              },
              child:const Text('Save'))
          ],
        ),
      ),
    );
  }
}
