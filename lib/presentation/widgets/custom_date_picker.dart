import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:realtime_innovation_employee_app/core/constants/assets.dart';
import 'package:realtime_innovation_employee_app/core/constants/constants.dart';
import 'package:realtime_innovation_employee_app/core/theme/custom_colors.dart';
import 'package:realtime_innovation_employee_app/generated/app_localizations.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/bottom_navigation_wrapper.dart';
import 'package:realtime_innovation_employee_app/presentation/widgets/custom_button.dart';
import 'package:realtime_innovation_employee_app/core/utils/date_utils.dart'
    as du;

class CustomDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime?) onDateSelected;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool allowDateAsNull;

  const CustomDatePicker({
    super.key,
    this.initialDate,
    required this.onDateSelected,
    this.minDate,
    this.maxDate,
    this.allowDateAsNull = false,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime? _selectedDate;
  late DateTime _currentDate;
  late DateTime _currentMonth;
  AppLocalizations? _appLocalizations;
  String? _error;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      microsecond: 0,
      millisecond: 0,
    );
    _selectedDate = widget.initialDate;
    if (_selectedDate != null) {
      _currentMonth = DateTime(_selectedDate!.year, _selectedDate!.month, 1);
    } else {
      _currentMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    }
    Future.delayed(Duration.zero, () {
      setState(() {});
    });
  }

  void _changeMonth(int offset) {
    DateTime newMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + offset,
      _currentDate.day,
    );

    if (offset == -1 &&
        widget.minDate != null &&
        newMonth.isBefore(widget.minDate!)) {
      return;
    }
    if (offset == 1 &&
        widget.maxDate != null &&
        newMonth.isAfter(widget.maxDate!)) {
      return;
    }

    setState(() {
      _currentMonth = newMonth;
    });
  }

  void _selectDate(DateTime? date) {
    if (date == null) return;
    if (widget.minDate != null && date.isBefore(widget.minDate!)) return;
    if (widget.maxDate != null && date.isAfter(widget.maxDate!)) return;

    setState(() {
      _error = null;
      _selectedDate = date;
    });
  }

  void _saveDate() {
    if (_selectedDate == null && !widget.allowDateAsNull) {
      setState(() {
        _error = _appLocalizations!.noDateSelected;
      });
      return;
    }
    widget.onDateSelected(_selectedDate);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    _appLocalizations ??= AppLocalizations.of(context)!;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: kIsWeb ? MediaQuery.sizeOf(context).width * 0.3 : 16.w,
      ),
      backgroundColor: CustomColors.pureWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.sp)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.0.sp,
              right: 16.0.sp,
              top: 24.0.sp,
              bottom: 8.0.sp,
            ),
            child: Column(
              children: [
                _getQuickSelections(),
                Gap(14.sp),
                _monthYearWithNavigationButtons(),
                Gap(14.sp),
                _getWeekDays(),
                Gap(18.sp),
                _getDatesGrid(),
              ],
            ),
          ),
          _showError(),
          _getBottomRow(),
        ],
      ),
    );
  }

  Widget _getQuickSelections() {
    return !widget.allowDateAsNull
        ? Column(
          children: [
            Row(
              children: [
                _getQuickActionButton(
                  text: _appLocalizations!.today,
                  dateTime: _currentDate,
                ),
                Gap(16.sp),
                _getQuickActionButton(
                  text: _appLocalizations!.nextMonday,
                  dateTime: du.DateUtils.getNextWeekday(
                    _currentDate,
                    DateTime.monday,
                  ),
                ),
              ],
            ),
            Gap(16.sp),
            Row(
              children: [
                _getQuickActionButton(
                  text: _appLocalizations!.nextTuesday,
                  dateTime: du.DateUtils.getNextWeekday(
                    _currentDate,
                    DateTime.tuesday,
                  ),
                ),
                Gap(16.sp),
                _getQuickActionButton(
                  text: _appLocalizations!.afterOneWeek,
                  dateTime: _currentDate.add(Duration(days: 7)),
                ),
              ],
            ),
          ],
        )
        : Row(
          children: [
            _getQuickActionButton(
              text: _appLocalizations!.noDate,
              dateTime: null,
            ),
            Gap(16.sp),
            _getQuickActionButton(
              text: _appLocalizations!.today,
              dateTime: _currentDate,
            ),
          ],
        );
  }

  Widget _getQuickActionButton({
    required String text,
    required DateTime? dateTime,
  }) {
    bool isSelected = _selectedDate == dateTime;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            _error = null;
            _selectedDate = dateTime;
          });
        },
        child: Container(
          height: 36.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color:
                isSelected ? CustomColors.primaryBlue : CustomColors.blueLight,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Text(
                text,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color:
                      isSelected
                          ? CustomColors.pureWhite
                          : CustomColors.primaryBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _monthYearWithNavigationButtons() {
    DateTime newMonthMinus1 = DateTime(
      _currentMonth.year,
      _currentMonth.month - 1,
      _currentDate.day,
    );
    DateTime newMonthPlus = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      _currentDate.day,
    );

    bool disablePrev =
        (widget.minDate != null && newMonthMinus1.isBefore(widget.minDate!));
    bool disableNext =
        (widget.maxDate != null && newMonthPlus.isAfter(widget.maxDate!));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: Image.asset(
              Assets.icArrowBack,
              color:
                  disablePrev
                      ? CustomColors.platinumGrey
                      : CustomColors.jetGrey,
            ),
          ),
          onPressed: () => _changeMonth(-1),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 135.w),
          child: Text(
            DateFormat(Constants.dateFormat2).format(_currentMonth),
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: CustomColors.jetGrey),
          ),
        ),
        IconButton(
          icon: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: Image.asset(
              Assets.icArrowNext,
              color:
                  disableNext
                      ? CustomColors.platinumGrey
                      : CustomColors.jetGrey,
            ),
          ),
          onPressed: () => _changeMonth(1),
        ),
      ],
    );
  }

  Widget _getWeekDays() {
    List<String> weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          weekdays
              .map(
                (day) => ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 30.w),
                  child: Center(
                    child: Text(
                      day,
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(color: CustomColors.jetGrey),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _getDatesGrid() {
    double cellSize = 36.h;
    double spacingBetweenRows = 8.h;
    int numberOfRows = 6;
    int daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;
    int firstWeekday =
        DateTime(_currentMonth.year, _currentMonth.month, 1).weekday;

    List<Widget> rows = [];
    int totalCells = daysInMonth + (firstWeekday % 7);
    int index = 0;

    for (int row = 0; row < numberOfRows; row++) {
      List<Widget> weekRow = [];

      for (int col = 0; col < 7; col++) {
        if (index < (firstWeekday % 7)) {
          weekRow.add(
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingBetweenRows / 2),
              child: SizedBox(width: cellSize, height: cellSize),
            ),
          );
        } else if (index < totalCells) {
          DateTime date = DateTime(
            _currentMonth.year,
            _currentMonth.month,
            index - (firstWeekday % 7) + 1,
          );
          bool isSelected = _selectedDate == date;
          bool isCurrentDate = _currentDate == date;
          bool isDisabled =
              (widget.minDate != null && date.isBefore(widget.minDate!)) ||
              (widget.maxDate != null && date.isAfter(widget.maxDate!));

          weekRow.add(
            GestureDetector(
              onTap: isDisabled ? null : () => _selectDate(date),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: spacingBetweenRows / 2),
                child: Container(
                  height: cellSize,
                  width: cellSize,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          isCurrentDate
                              ? CustomColors.primaryBlue
                              : Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(cellSize),
                    color:
                        isSelected
                            ? CustomColors.primaryBlue
                            : isCurrentDate
                            ? Colors.transparent
                            : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: Theme.of(
                        context,
                      ).textTheme.displayMedium!.copyWith(
                        color:
                            isDisabled
                                ? CustomColors.platinumGrey
                                : isSelected
                                ? CustomColors.pureWhite
                                : isCurrentDate
                                ? CustomColors.primaryBlue
                                : CustomColors.jetGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          weekRow.add(
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacingBetweenRows / 2),
              child: SizedBox(width: cellSize, height: cellSize),
            ),
          );
        }
        index++;
      }

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weekRow,
        ),
      );
    }

    return SizedBox(
      height: ((cellSize * numberOfRows) + (spacingBetweenRows * numberOfRows)),
      child: Column(mainAxisSize: MainAxisSize.min, children: rows),
    );
  }

  Widget _showError() {
    return _error == null
        ? Container()
        : Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Text(
              _error!,
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(color: CustomColors.fireRed),
            ),
          ),
        );
  }

  Widget _getBottomRow() {
    return BottomNavigationWrapper(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.icDate, width: 24.w),
              Gap(12.w),
              Text(
                (_selectedDate != null)
                    ? du.DateUtils.getStringFormattedDate(
                      date: _selectedDate,
                      outputFormat: Constants.dateFormat3,
                    )
                    : _appLocalizations!.noDate,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          Expanded(child: Container()),
          CustomButton(
            text: _appLocalizations!.cancel,
            onClick: () {
              Navigator.of(context).pop();
            },
            buttonType: ButtonType.buttonOutlined,
          ),
          Gap(16.w),
          CustomButton(text: _appLocalizations!.save, onClick: _saveDate),
        ],
      ),
    );
  }
}
