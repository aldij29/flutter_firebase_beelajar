part of 'widgets.dart';

class CustomTabMenuItem extends StatelessWidget {
  final String textItem;
  final int index;
  const CustomTabMenuItem(
      {Key? key, required this.textItem, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
            color: context.read<PageCubit>().state == index
                ? kWhiteColor
                : kPrimaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          textItem,
          style: regularTextStyle.copyWith(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kGreyColor),
        )),
      ),
    );
  }
}
