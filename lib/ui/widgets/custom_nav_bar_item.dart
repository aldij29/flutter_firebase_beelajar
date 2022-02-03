part of 'widgets.dart';

class CustomNavBarItem extends StatelessWidget {
  IconData iconNavBar;
  int index;
  String pageName;
  CustomNavBarItem(
      {Key? key,
      required this.iconNavBar,
      required this.index,
      required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            child: Icon(
              iconNavBar,
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kGreyColor,
            ),
          ),
          Container(
            child: Text(
              pageName,
              style: regularTextStyle.copyWith(
                  color: context.read<PageCubit>().state == index
                      ? kPrimaryColor
                      : kGreyColor,
                  fontWeight: context.read<PageCubit>().state == index
                      ? bold
                      : regular),
            ),
          )
        ],
      ),
    );
  }
}
