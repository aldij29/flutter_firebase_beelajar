part of 'widgets.dart';

class CustomCategoryCard extends StatelessWidget {
  final String catName;
  const CustomCategoryCard({Key? key, required this.catName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        catName,
        style: regularTextStyle.copyWith(fontWeight: regular),
      ),
    );
  }
}
