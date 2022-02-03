part of 'widgets.dart';

class CustomCourseCard extends StatelessWidget {
  final String titleCourse;
  final String mentorName;
  final int hargaCourse;
  const CustomCourseCard(
      {Key? key,
      required this.titleCourse,
      required this.mentorName,
      required this.hargaCourse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String urlThumbnail =
        'https://firebasestorage.googleapis.com/v0/b/beelajar-998c7.appspot.com/o/Assets%2Fimages%2Fmarvin-meyer-SYTO3xs06fU-unsplash.jpg?alt=media&token=b91c50f8-19b9-4ced-9c0d-e413fe91f8e2';
    return Container(
      margin: EdgeInsets.only(right: 18.0),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 140,
              width: 300,
              margin: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: NetworkImage(urlThumbnail), fit: BoxFit.cover)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Text(
              titleCourse,
              style: titleTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12),
            child: Text(
              'Mentor: ' + mentorName,
              style: regularTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Jumlah Modul'), Text('data')],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(defaultRadius)),
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: Text(
                'View Course',
                style: titleTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
