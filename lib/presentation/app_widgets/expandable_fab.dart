import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/presentation/calculate_page/bloc/calculate_bloc.dart';
import 'package:net_carbons/presentation/calculate_page/calculate_page.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import '../layout_screen/widgets/bottom_bar.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  final Function(bool) onToggle;
  final List<Widget> children;
  const FancyFab(
      {super.key,
      required this.onPressed,
      required this.tooltip,
      required this.icon,
      required this.onToggle,
      required this.children});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
    widget.onToggle(isOpened);
  }

  Widget toggle() {
    return FloatingActionButton(
      elevation: 10,
      backgroundColor: !isOpened ? AppColors.nevyblueFab : AppColors.blueFab,
      onPressed: animate,
      child: Transform.rotate(
          angle: _animateIcon.value * 2.3,
          child: SvgPicture.asset(
            SvgAssets.closeAdd,
            width: 20.w,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        return BlocBuilder<CalculateBloc, CalculateState>(
            builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                      0.0,
                      _translateButton.value * 3.0,
                      0.0,
                    ),
                    child: FabItem(
                      isOpened: isOpened,
                      data: state.calculatorResultValue
                          .roundToDouble()
                          .toStringAsFixed(2),
                      title: 'My Emission ',
                      onPressed: () {
                        animate();
                        selectedIndexNotifier.value = 1;
                        calculatorSelectedPageNotifier.value = 0;
                      },
                      child: widget.children[0],
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                      0.0,
                      _translateButton.value * 2.0,
                      0.0,
                    ),
                    child: FabItem(
                      isOpened: isOpened,
                      data: state.offsetValue.floor().toString(),
                      title: 'My Reduction Target ',
                      onPressed: () {
                        animate();
                        selectedIndexNotifier.value = 1;
                        calculatorSelectedPageNotifier.value = 1;
                      },
                      child: widget.children[1],
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                      0.0,
                      _translateButton.value,
                      0.0,
                    ),
                    child: FabItem(
                      isOpened: isOpened,
                      data: cartState.cartQuantity.toString(),
                      title: 'My Cart ',
                      onPressed: () {
                        animate();
                        mainScaffold.currentState?.openEndDrawer();
                      },
                      child: widget.children[2],
                    ),
                  ),
                  toggle(),
                ],
              ),
            ],
          );
        });
      },
    );
  }
}

class FabItem extends StatelessWidget {
  const FabItem({
    Key? key,
    required this.isOpened,
    required this.child,
    required this.data,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final bool isOpened;
  final Widget child;
  final String data;
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isOpened
            ? Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                    color: AppColors.primaryActiveColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.r))),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: title,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.appWhite,
                          ),
                    ),
                    TextSpan(
                      text: data,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: AppColors.appWhite,
                          ),
                    )
                  ]),
                ),
              )
            : const SizedBox(),
        const SizedBox(
          width: 10,
        ),
        FloatingActionButton(
            heroTag: title,
            onPressed: onPressed,
            elevation: 0,
            backgroundColor: AppColors.appWhite,
            child: child),
      ],
    );
  }
}
