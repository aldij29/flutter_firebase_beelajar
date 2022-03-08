part of '../pages.dart';

class DetailCoursePage extends StatelessWidget {
  final String urlThumbnail;
  final String courseName;
  final String mentorName;
  final int hargaCourse;
  final String description;
  const DetailCoursePage(
      {Key? key,
      required this.urlThumbnail,
      required this.courseName,
      required this.mentorName,
      required this.hargaCourse,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 8, left: 8),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kWhiteColor),
              child: Icon(
                Icons.arrow_back,
                color: kPrimaryColor,
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(left: 24, right: 24),
          //   child:
          //       Text(courseName, style: titleTextStyle.copyWith(fontSize: 16)),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 8, right: 8),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kWhiteColor),
              child: Icon(
                Icons.share,
                color: kBlackColor,
              ),
            ),
          ),
        ],
      );
    }

    Widget thumbnailCourse() {
      return Container(
        margin:
            EdgeInsets.only(top: 12, left: defaultMargin, right: defaultMargin),
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
            color: kRedColor,
            image: DecorationImage(
                image: NetworkImage(urlThumbnail), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Stack(
          children: [Align(alignment: Alignment.topLeft)],
        ),
      );
    }

    Widget judulCourse() {
      return Expanded(
          child: Container(
        margin: EdgeInsets.only(top: 12, left: 24, right: 24),
        child: Text(
          courseName +
              "sajkdlaks jdlasj dlaksjd lasd jla ksdj idbne iwunci lwenc wcnw kcnwe ;cknw sadas asdasdasd asd ass",
          style: titleTextStyle.copyWith(fontSize: 20),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ));
    }

    Widget mentorCourse() {
      return Container(
        margin:
            EdgeInsets.only(top: 20, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Text(
              'By ',
              style: regularTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              mentorName,
              style: regularTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
          ],
        ),
      );
    }

    Widget tabMenu() {
      return Container(
        margin:
            EdgeInsets.only(left: defaultMargin, right: defaultMargin, top: 12),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTabMenuItem(textItem: 'Description', index: 0),
            CustomTabMenuItem(textItem: 'Lesson', index: 1),
            CustomTabMenuItem(textItem: 'Review', index: 2),
          ],
        ),
      );
    }

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return Container(
            child: Text(
              description,
              style: regularTextStyle,
            ),
          );
        case 1:
          return Container(
            child: Text(
              'Lesson',
              style: regularTextStyle,
            ),
          );
        case 2:
          return Container(
            child: Text(
              'Review',
              style: regularTextStyle,
            ),
          );
        default:
          return Container(
            child: Text(
              description,
              style: regularTextStyle,
            ),
          );
      }
    }

    return BlocBuilder<PageCubit, int>(builder: (context, currentIndex) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          children: [
            //HEADER
            header(),
            //Thumbnail Course
            thumbnailCourse(),
            //Judul Course
            judulCourse(),
            //Mentor Course
            mentorCourse(),
            tabMenu(),
            Padding(
              padding: EdgeInsets.only(
                  left: defaultMargin, right: defaultMargin, top: 16),
              child: buildContent(currentIndex),
            )
          ],
        ),
      );
    });
  }
}
