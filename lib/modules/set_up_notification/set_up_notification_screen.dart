import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_english/core/constants/app_color.dart';
import 'package:lazy_english/core/constants/app_icon.dart';
import 'package:lazy_english/core/constants/app_text_theme.dart';
import 'package:lazy_english/core/utils/spaces.dart';
import 'package:lazy_english/core/widgets/appbar/appbar.dart';

class SetUpNotificationScreen extends StatefulWidget {
  const SetUpNotificationScreen({super.key});

  @override
  State<SetUpNotificationScreen> createState() =>
      _SetUpNotificationScreenState();
}

class _SetUpNotificationScreenState extends State<SetUpNotificationScreen> {
  // Variables to store selected values
  String? selectedDayStart;
  String? selectedMonthStart;
  String? selectedYearStart;

  String? selectedDayEnd;
  String? selectedMonthEnd;
  String? selectedYearEnd;

  String? selectedHour;
  String? selectedMinute;
  String? selectedAmPm;

  // Dropdown options
  final List<String> days =
      List.generate(31, (index) => (index + 1).toString());
  final List<String> months =
      List.generate(12, (index) => (index + 1).toString());
  final List<String> years =
      List.generate(100, (index) => (2024 - index).toString());
  final List<String> hours =
      List.generate(12, (index) => (index + 1).toString());
  final List<String> minutes =
      List.generate(60, (index) => index.toString());
  final List<String> amPm = ['AM', 'PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: Text(
          "Thiết lập thông báo",
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: "Khung thời gian",
              description:
                  "Thiết lập khoảng thời gian để nhận thông báo nhắc nhở học tiếng Anh qua màn hình khóa.",
              child: Column(
                children: [
                  _buildDateRow("Ngày bắt đầu", (day, month, year) {
                    setState(() {
                      selectedDayStart = day;
                      selectedMonthStart = month;
                      selectedYearStart = year;
                    });
                  }),
                  spaceH16,
                  _buildDateRow("Ngày kết thúc", (day, month, year) {
                    setState(() {
                      selectedDayEnd = day;
                      selectedMonthEnd = month;
                      selectedYearEnd = year;
                    });
                  }),
                ],
              ),
            ),
            spaceH32,
            _buildSection(
              title: "Tăng suất",
              description:
                  "Chọn tần suất nhận thông báo để phù hợp với lịch trình học tập của bạn.",
              child: _buildTimeRow(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title,
      required String description,
      required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700)),
        spaceH8,
        Text(description, style: textTheme.bodyMedium),
        spaceH16,
        child,
      ],
    );
  }

  Widget _buildDateRow(
      String label, Function(String?, String?, String?) onDateChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700)),
        spaceH8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDropdown(
                "Ngày", days, (value) => onDateChanged(value, null, null)),
            _buildDropdown(
                "Tháng", months, (value) => onDateChanged(null, value, null)),
            _buildDropdown(
                "Năm", years, (value) => onDateChanged(null, null, value)),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDropdown("Giờ", hours, (value) {
          setState(() {
            selectedHour = value;
          });
        }),
        _buildDropdown("Phút", minutes, (value) {
          setState(() {
            selectedMinute = value;
          });
        }),
        _buildDropdown("AM", amPm, (value) {
          setState(() {
            selectedAmPm = value;
          });
        }),
      ],
    );
  }

  Widget _buildDropdown(
      String hint, List<String> options, Function(String?) onChanged) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.c_FF94A3B8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.c_FF2970FF),
            ),
          ),
          value: null,
          dropdownColor: AppColor.white,
          hint: Text(
            hint,
            style: textTheme.bodyLarge!.copyWith(color: AppColor.c_FF94A3B8),
          ),
          items: options
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: onChanged,
          icon: AppIcon.arrowDown,
        ),
      ),
    );
  }
}
