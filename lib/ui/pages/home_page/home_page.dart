part of '../pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String urlThumbnail =
    //     'https://firebasestorage.googleapis.com/v0/b/beelajar-998c7.appspot.com/o/Assets%2Fimages%2Fstil-staMgYWHM7s-unsplash.jpg?alt=media&token=2b67ebdb-d488-49c5-b1eb-be8c862ea8ec';
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference category = firestore.collection('Category');
    CollectionReference courses = firestore.collection('Courses');
    Widget appBar() {
      return Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(color: kBackgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.dehaze,
                color: kPrimaryColor,
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'Hi, Aldi',
                    overflow: TextOverflow.ellipsis,
                    style: titleTextStyle.copyWith(),
                  ),
                ),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              child: Icon(Icons.notifications),
            )
          ],
        ),
      );
    }

    Widget bannerTop() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [Colors.yellow, Colors.orange]),
                    borderRadius: BorderRadius.circular(defaultRadius)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            'Mulai',
                            style: titleTextStyle.copyWith(
                                color: kWhiteColor, fontSize: 24),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/beelajar_white_logo.png'),
                                  fit: BoxFit.contain)),
                        )
                      ],
                    ),
                    Container(
                      width: 200,
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/illustration_beelajar.png'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(40)),
                child: TextFormField(
                  style: regularTextStyle.copyWith(
                      fontSize: 14, fontWeight: regular),
                  obscureText: false,
                  cursorColor: kBlackColor,
                  decoration: InputDecoration(
                      hintText: 'Search Class',
                      prefixIcon: Icon(
                        Icons.search,
                        color: kGreyColor,
                      ),
                      suffixIcon: Icon(Icons.tune),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none)),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget categorySection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Category',
              style: titleTextStyle.copyWith(fontSize: 20),
            ),
          ),
          Container(
            height: 130,
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            margin: EdgeInsets.only(top: 12),
            child: Center(
              child: FutureBuilder<QuerySnapshot>(
                future: category.orderBy('categoryCreated').get(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: snapshot.data!.docs
                          .map(
                            (e) => GestureDetector(
                              onTap: () {},
                              child: CustomCategoryCard(
                                catName: (e.data() as dynamic)['titleCourse'],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Text("Loading...");
                  }
                },
              ),
            ),
          ),
        ],
      );
    }

    Widget body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Courses',
              style: titleTextStyle.copyWith(fontSize: 20),
            ),
          ),
          Container(
            height: 330,
            width: 1000,
            margin: EdgeInsets.only(
              top: 12,
            ),
            child: FutureBuilder<QuerySnapshot>(
              future: courses.get(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: snapshot.data!.docs
                        .map(
                          (e) => GestureDetector(
                            onTap: () {},
                            child: CustomCourseCard(
                              titleCourse: (e.data() as dynamic)['titleCourse'],
                              mentorName: (e.data() as dynamic)['mentorCourse'],
                              hargaCourse: (e.data() as dynamic)['hargaCourse'],
                              participant:
                                  (e.data() as dynamic)['participantCourse'],
                              urlThumbnail:
                                  (e.data() as dynamic)['thumbnailCourse'],
                              descCourse: (e.data() as dynamic)['description'],
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Text("Loading...");
                }
              },
            ),
          )
        ],
      );
    }

    return ListView(
      children: [
        appBar(),
        bannerTop(),
        categorySection(),
        body(),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
