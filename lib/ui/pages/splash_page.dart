part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/main-page');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 105,
              width: 240,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/beelajar_logo.png',
                      ),
                      fit: BoxFit.fitWidth)),
            ),
            Text(
              'Learn what you love.',
              style: regularTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
                color: kGreyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
