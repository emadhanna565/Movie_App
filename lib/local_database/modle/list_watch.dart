import 'package:hive/hive.dart';

part 'list_watch.g.dart';

@HiveType(typeId: 1)
class ListWatch extends HiveObject {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? releaseDate;
  @HiveField(2)
  final String? posterPath;
  ListWatch(
      {required this.title,
      required this.releaseDate,
      required this.posterPath});
}
