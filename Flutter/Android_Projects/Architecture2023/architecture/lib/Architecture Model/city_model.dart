class CityModel{
  late String _cityName;
  int? _count;

  String get cityName => _cityName;

  set cityName(String cityName) {
    _cityName = cityName;
  }

  int? get count => _count;

  set count(int? count) {
    _count = count;
  }
}