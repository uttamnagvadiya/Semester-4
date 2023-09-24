List<dynamic> findCommonElements(List<dynamic> list1, List<dynamic> list2) {
  List<dynamic> commonElements = [];

  for (var element in list1) {
    if (list2.contains(element)) {
      commonElements.add(element);
    }
  }

  return commonElements;
}

void main(List<String> args) {
  List<dynamic> list1 = [1, 2, 3, 4, 5];
  List<dynamic> list2 = [4, 5, 6, 5, 9, 7, 8, 3, 4];

  List<dynamic> commonElements = findCommonElements(list1, list2);

  print('Common Elements: $commonElements');
}
