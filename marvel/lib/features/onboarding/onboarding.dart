import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel/features/landing_tab/landing_tab.dart';
import 'package:marvel/features/onboarding/onboarding_page_child.dart';

class OnboardingPage extends StatelessWidget {
  final PageController controller = PageController();
  List<Widget> dataSource = []; 

  OnboardingPage() {
    dataSource = [
      OnboardingPageChild(
          model: OnboardingPageChildModel(
        mainTitle: "Marvel Heroes",
        secondaryTitle: "Welcome to the Marvel App",
        imageName: "resources/images/image01.jpg",
        shouldPresentButton: false,
      )),
      OnboardingPageChild(
          model: OnboardingPageChildModel(
        mainTitle: "All Heroes",
        secondaryTitle: "Check all Heroes from every region",
        imageName: "resources/images/image05.jpg",
        shouldPresentButton: false,
      )),
      OnboardingPageChild(
          model: OnboardingPageChildModel(
        mainTitle: "Detailed information",
        secondaryTitle: "Check the specific info about them",
        imageName: "resources/images/image03.jpg",
        shouldPresentButton: false,
      )),
      OnboardingPageChild(
          model: OnboardingPageChildModel(
              mainTitle: "Marvel App",
              secondaryTitle: "The best Marvel App ever",
              imageName: "resources/images/image07.jpg",
              shouldPresentButton: true,
              buttonTitle: "Get Start Now!!!",
              onButtonPressed: (context) {
                _presentPokemonListPage(context: context);
              })),
    ];
  }

  _presentPokemonListPage({BuildContext context}) {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => LandingTabPage()));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: PageView(
      children: dataSource,
    ));
  }
}
