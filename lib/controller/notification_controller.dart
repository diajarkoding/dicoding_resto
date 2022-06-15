import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../helper/notification/background_service.dart';
import '../helper/notification/date_time_helper.dart';

class NotificationController extends GetxController {
  bool _isSchedule = false;

  bool get isSchedule => _isSchedule;

  final _box = GetStorage();

  static const _notif = 'NOTIFICATION';

  bool get isSwitch {
    bool value = _box.read(_notif) ?? false;
    return value;
  }

  void _setNotificationStatus(bool value) async {
    if (_box.read(_notif) != null) {
      await _box.remove(_notif);
    } else {
      await _box.write(_notif, value);
    }
  }

  void _getStatusNotification() async {
    _isSchedule = isSwitch;
    update();
  }

  Future<bool> scheduleRestaurant(bool value) async {
    try {
      _isSchedule = value;

      _setNotificationStatus(value);

      _getStatusNotification();

      update();

      if (_isSchedule) {
        update();
        return await AndroidAlarmManager.periodic(
          const Duration(hours: 24),
          1,
          BackgroundService.callback,
          startAt: DateTimeHelper.format(),
          exact: true,
          wakeup: true,
        );
      } else {
        update();
        return await AndroidAlarmManager.cancel(1);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
