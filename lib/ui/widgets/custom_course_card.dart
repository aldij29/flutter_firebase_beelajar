part of 'widgets.dart';

class CustomCourseCard extends StatelessWidget {
  final String titleCourse;
  final String mentorName;
  final int hargaCourse;
  final int participant;
  final String urlThumbnail;
  final String descCourse;
  const CustomCourseCard(
      {Key? key,
      required this.titleCourse,
      required this.mentorName,
      required this.hargaCourse,
      required this.participant,
      required this.urlThumbnail,
      required this.descCourse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 18.0),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
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
              maxLines: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, top: 5),
            child: Text(
              'Mentor: ' + mentorName,
              style: regularTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '16 Module',
                  style: regularTextStyle,
                ),
                Text(
                  participant.toString() + ' Participant',
                  style: regularTextStyle,
                )
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                              urlThumbnail: urlThumbnail,
                              courseName: titleCourse,
                              hargaCourse: hargaCourse,
                              mentorName: mentorName,
                              description: descCourse,
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(defaultRadius)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 1, vertical: 18),
                child: Text(
                  'View Course',
                  style: titleTextStyle.copyWith(color: kWhiteColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
