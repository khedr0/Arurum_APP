import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lemo_app/core/widgets/date_field.dart';

class DateTimeSection extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController timeController;

  const DateTimeSection({
    super.key,
    required this.dateController,
    required this.timeController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DateField(
            controller: dateController,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
              );

              if (date != null) {
                dateController.text = DateFormat('dd/MM/yyyy').format(date);
              }
            },
            title: 'Date',
            hintText: 'dd/mm/yyyy',
            suffixIcon: Icons.calendar_month_outlined,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: DateField(
            controller: timeController,
            onTap: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (time != null) {
                timeController.text = time.format(context);
              }
            },
            title: 'Time',
            hintText: '00:00',
            suffixIcon: Icons.access_time,
          ),
        ),
      ],
    );
  }
}
