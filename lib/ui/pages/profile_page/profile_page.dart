part of '../pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('Users');
    String urlAvatar = 'assets/images/avatar_dummy.jpg';
    Widget _header() {
      return FutureBuilder<DocumentSnapshot>(
        future: users.doc('5cGmgkNaU8jY4Oegwlr7').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // return Text("Full Name: ${data['fullname']}");
            return Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(color: kPrimaryColor),
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(top: 18, right: 24),
                        width: 48,
                        height: 48,
                        child: Icon(
                          Icons.settings,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                  color: kWhiteColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(urlAvatar),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: Text(
                                data['fullname'],
                                style: titleTextStyle.copyWith(
                                    color: kWhiteColor, fontSize: 24),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Text(
                                data['email'],
                                style: regularTextStyle.copyWith(
                                    color: kWhiteColor),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            );
          }

          return Text("loading");
        },
      );
    }

    return ListView(children: [_header()]);
  }
}
