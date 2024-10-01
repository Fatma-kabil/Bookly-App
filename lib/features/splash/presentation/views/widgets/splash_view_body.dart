import 'package:bookly_app/conatants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> slidingAnimationtwo;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHome();

    // This listener is unnecessary; `SlideTransition` already rebuilds on animation updates.
    // slidingAnimation.addListener(() {
    // setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SlideTransition(
                position: slidingAnimationtwo,
                child: Image.asset(AssetsData.logo, height: 55)),
            const SizedBox(height: 15),
            SlideTransition(
              position: slidingAnimation,
              child: const Text(
                'Read Free Books',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 2), // Shorter duration for smoother animation
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, -20), end: const Offset(0, 0))
            .animate(
      animationController,

      // Smooth easing for animation
    );

    slidingAnimationtwo =
        Tween<Offset>(begin: const Offset(0, 20), end: const Offset(0, 0))
            .animate(
      animationController,

      // Smooth easing for animation
    );

    // Start the animation
    animationController.forward();

    // This listener is unnecessary; `SlideTransition` already rebuilds on animation updates.
    // slidingAnimation.addListener(() {
    // setState(() {});
    // });
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.to(() => const HomeView(),
            transition: Transition.fadeIn, duration: kTransitionAnimation);
      },
    );
  }
}
