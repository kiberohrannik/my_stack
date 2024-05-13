abstract class TimeHistoryService {

  List<String> getAll();
}

class InMemoryTimeHistoryService extends TimeHistoryService {

  final List<String> _trackedDays = [
    "Yesterday 07:44",
    "26 April 07:44",
    "25 April 07:44",
    "24 April 07:44",
    "23 April 07:44",
    "22 April 07:44",
    "21 April 07:44",
    "17 April 07:44",
    "16 April 07:44",
    "15 April 07:44",
    "14 April 07:44",
    "13 April 07:44",
    "10 April 07:44",
    "9 April 07:44"
  ];

  @override
  List<String> getAll() => _trackedDays;

}