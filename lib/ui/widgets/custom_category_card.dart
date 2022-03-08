part of 'widgets.dart';

class CustomCategoryCard extends StatelessWidget {
  final String catName;
  const CustomCategoryCard({Key? key, required this.catName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration:
                BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
            child: Icon(
              Icons.local_cafe_outlined,
              color: kWhiteColor,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            catName,
            style: regularTextStyle.copyWith(fontWeight: regular),
          )
        ],
      ),
    );
  }
}
