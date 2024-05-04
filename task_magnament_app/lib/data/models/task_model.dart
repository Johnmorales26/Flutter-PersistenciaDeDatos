import 'package:realm/realm.dart';
part 'taskmodel.realm.dart';

@RealmModel()
class _TaskModel {
  @PrimaryKey()
  late int uid;
  late String title;
  late String content;
  late String person;
  late List<String>? files;
  late String priority;
  late DateTime dateTime;
  late String status;
}
