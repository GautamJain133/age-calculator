import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:agecalculator/age_calculation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

AgeDuration _ageDuration;

class _HomePageState extends State<HomePage> {
  DateTime todayDate = DateTime.now();
  DateTime dob = DateTime(2003, 3, 1);
  AgeDuration _ageDuration;
  AgeDuration _nextBirthdate;
  int _nextbdayweekday;
  List<String> _months = [
    "months",
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "Octomber",
    "November",
    "December"
  ];

  List<String> _weeks = [
    "weeks",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thuresday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  Future<Null> _selectTodayDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: dob,
        lastDate: DateTime(2100));
    if (picked != null && picked != todayDate) {
      setState(() {
        todayDate = picked;
        _ageDuration = AgeCalculation().calculateAge(todayDate, dob);
        _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
        _nextbdayweekday = AgeCalculation().nextbday(todayDate, dob);
      });
    }
  }

  Future<Null> _selectDOBDate(BuildContext context) async {
    final DateTime pick = await showDatePicker(
        context: context,
        initialDate: dob,
        firstDate: DateTime(1900),
        lastDate: todayDate);

    if (pick != null && pick != todayDate) {
      setState(() {
        dob = pick;
        _ageDuration = AgeCalculation().calculateAge(todayDate, dob);
        _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
        _nextbdayweekday = AgeCalculation().nextbday(todayDate, dob);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ageDuration = AgeCalculation().calculateAge(todayDate, dob);
    _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
    _nextbdayweekday = AgeCalculation().nextbday(todayDate, dob);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: 30, width: double.maxFinite),
            Text(
              "AGE CALCULATOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "${todayDate.day} ${_months[todayDate.month]} ${todayDate.year}",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            _selectTodayDate(context);
                          },
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date Of Birth",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "${dob.day}  ${_months[dob.month]} ${dob.year}",
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _selectDOBDate(context);
                        },
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 40.0),
              height: 400,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Color(0xff333333),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 170,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              "AGE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${_ageDuration.years}",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 76,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 13),
                                  child: Text(
                                    "YEARS",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${_ageDuration.months} months | ${_ageDuration.days} days",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 1,
                        color: Color(0xf9999999),
                      ),
                      Container(
                        height: 170,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NEXT BIRTHDAY",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.cake,
                              color: Colors.yellowAccent,
                            ),
                            Text(
                              "${_weeks[_nextbdayweekday]}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${_nextBirthdate.months} months | ${_nextBirthdate.days} days",
                              style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.yellow,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "SUMMERY",
                      style: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "YEARS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${_ageDuration.years}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "MONTHS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${((_ageDuration.months) * 12) + (_ageDuration.months)}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "WEEKS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${(todayDate.difference(dob).inDays / 7).floor()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "DAYS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${(todayDate.difference(dob).inDays)}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "HOURS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${(todayDate.difference(dob).inHours)}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "MINUTES",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${(todayDate.difference(dob).inMinutes)}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Developed by Gautam",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
