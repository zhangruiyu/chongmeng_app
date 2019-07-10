import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:table_calendar/table_calendar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SignInState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  final Map<DateTime, List> _holidays = {
    DateTime(2019, 7, 7): ['New Year\'s Day'],
    DateTime(2019, 7, 8): ['Epiphany'],
    DateTime(2019, 7, 3): ['Epiphany'],
    DateTime(2019, 7, 14): ['Valentine\'s Day'],
    DateTime(2019, 7, 21): ['Easter Sunday'],
    DateTime(2019, 7, 22): ['Easter Monday'],
  };

  Map<DateTime, List> markers = _holidays;
  return Scaffold(
    backgroundColor: Color(0xffF03E51),
    appBar: Toolbar(
      title: Text("签到"),
    ),
    body: EasyRefresh.custom(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: "已连续签到",
                              style: TextStyle(
                                fontSize: 18.0,
//                                  fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: "2",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: accentColor)),
                                TextSpan(
                                    text: "天",
                                    style: TextStyle(
                                        fontSize: 18.0,
//                                  fontWeight: FontWeight.bold,
                                        color: Colors.black))
                              ]),
                        ),
                        Row(
                          children: <Widget>[
                            Text("我的积分 555"),
                            Icon(
                              MdiIcons.chevronRight,
                              color: accentColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: TableCalendar(
                  locale: "zh",
                  holidays: markers,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: const TextStyle(
                        color: const Color(0xFF616161)), // Material grey[700]
                    weekendStyle:
                        const TextStyle(color: const Color(0xFF616161)),
                  ),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    weekendStyle:
                        const TextStyle(color: const Color(0xFF616161)),
                    holidayStyle:
                        const TextStyle(color: const Color(0xFF616161)),
                  ),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonVisible: false,
                  ),
                  builders: CalendarBuilders(markersBuilder:
                      (BuildContext context, DateTime date, List events,
                          List holidays) {
                    final children = <Widget>[];
                    children.add(
                      Icon(
                        Icons.check,
                        color: accentColor,
                      ),
                    );
                    return children;
                  })),
            )
          ]),
        )
      ],
    ),
  );
}
