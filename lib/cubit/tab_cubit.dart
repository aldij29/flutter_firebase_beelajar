part of 'cubits.dart';

class TabCubit extends Cubit<int> {
  TabCubit() : super(0);

  void setTab(int newTab) {
    emit(newTab);
  }
}
