import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<int> {
  TabCubit(): super (1);

  void selectTab(int index) => emit(index);
}