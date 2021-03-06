import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../user/presentation/pages/login.dart';
import 'onboarding_page.dart';
import '../widgets/next_button.dart';
import '../widgets/page_indicator.dart';
import '../widgets/text_column.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  Onboarding({Key? key, required this.screenHeight}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  int pageNumber = 1;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late AnimationController _rippleAnimationController;
  late Animation<double> _rippleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));
    _setSlideOutAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  void _setSlideOutAnimation() {
    setState(() {
      _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(-3, 0))
          .animate(CurvedAnimation(
              parent: _animationController, curve: Curves.easeIn));
      _animationController.reset();
    });
  }

  void _setSlideInAnimation() {
    setState(() {
      _slideAnimation = Tween<Offset>(begin: Offset(3, 0), end: Offset.zero)
          .animate(CurvedAnimation(
              parent: _animationController, curve: Curves.easeOut));
      _animationController.reset();
    });
  }

  void _setNextPage(int nextPage) {
    setState(() {
      pageNumber = nextPage;
    });
  }

  Widget _getPage() {
    switch (pageNumber) {
      case 1:
        return OnboardingPage(
          slideAnimation: _slideAnimation,
          assetPath: "assets/images/resources.png",
          textColumn: TextColumn(
              title: "Language",
              key: Key("1"),
              text:
                  "Tools provided to assist you to learn\nin your local dialect."),
        );
      case 2:
        return OnboardingPage(
            slideAnimation: _slideAnimation,
            assetPath: "assets/images/accessibility.png",
            textColumn: TextColumn(
                title: "Accessibility",
                key: Key("2"),
                text:
                    "Learn mathematical concepts easily anywhere and at anytime."));
      case 3:
        return OnboardingPage(
            slideAnimation: _slideAnimation,
            assetPath: "assets/images/megaphone.png",
            textColumn: TextColumn(
                title: "Share",
                key: Key("3"),
                text:
                    "Share achievements and problems\nwith friends to make it easy."));
      default:
        throw ("Undefined page number");
    }
  }

  Future<void> _nextPage() async {
    switch (pageNumber) {
      case 1:
        {
          await _animationController.forward();
          _setNextPage(2);
          _setSlideInAnimation();
          await _animationController.forward();
          _setSlideOutAnimation();
        }

        break;
      case 2:
        {
          await _animationController.forward();
          _setNextPage(3);
          _setSlideInAnimation();
          await _animationController.forward();
          _setSlideOutAnimation();
        }
        break;
      case 3:
        await _gotoLoginPage();
        break;
    }
  }

  Future<void> _gotoLoginPage() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
    await _rippleAnimationController.forward();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF01011D),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Align(
              alignment: Alignment.topRight,
              child: RawMaterialButton(
                onPressed: () {
                  _gotoLoginPage();
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.alegreya(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
            SizedBox(height: 90),
            _getPage(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PageIndicator(pageNumber),
                SizedBox(
                  width: 10,
                ),
                NextButton(
                  pageFunc: () async => _nextPage(),
                ),
              ],
            ),
          ]),
        ),
        AnimatedBuilder(
          animation: _rippleAnimation,
          builder: (_, Widget? child) {
            return Ripple(
              isButton: pageNumber == 3,
              radius: _rippleAnimation.value,
            );
          },
        ),
      ]),
    );
  }
}

class Ripple extends StatelessWidget {
  final double radius;
  final bool isButton;
  const Ripple({
    required this.radius,
    required this.isButton,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Positioned(  
      right:isButton?screenWidth-radius: (0 - radius/2),
      top:isButton?screenWidth-radius: (0 - radius/2) ,
      child: Container(
        width: 2 * radius,
        height: 2 * radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF171531),
        ),
      ),
    );
  }

 
}
