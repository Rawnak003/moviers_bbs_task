import 'package:flutter/material.dart';

import '../../../../core/routes/route_names.dart';
import '../../static_data/user/genre_data.dart';

class GenreProvider extends ChangeNotifier {

  int get selectedCount => genreData.where((genre) => genre.isSelected).length;

  void toggleSelection(int index) {
    if (genreData[index].isSelected) {
      genreData[index].isSelected = false;
    } else {
      if (selectedCount < 6) {
        genreData[index].isSelected = true;
      }
    }
    notifyListeners();
  }

  void onTapContinue(context) {
    // TODO: implement save genre and continue logic
    Navigator.pushReplacementNamed(context, RoutesName.home);
  }
}
