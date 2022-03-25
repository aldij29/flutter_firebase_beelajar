part of 'pages.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  

  Widget _bottomNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 20),
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomNavBarItem(
              pageName: 'Home',
              iconNavBar: Icons.home_rounded,
              index: 0,
            ),
            CustomNavBarItem(
              pageName: 'My Class',
              iconNavBar: Icons.import_contacts,
              index: 1,
            ),
            CustomNavBarItem(
              pageName: 'Profile',
              iconNavBar: Icons.person,
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return MyCoursePage();
      case 2:
        return ProfilePage();
      default:
        return ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(builder: (context, currentIndex) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              // _header(),
              const SizedBox(
                height: 12,
              ),
              buildContent(currentIndex),
              const SizedBox(
                height: 16,
              ),
              _bottomNavBar()
            ],
          ),
        ),
      );
    });
  }
}
