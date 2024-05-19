import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/presentation/app_widgets/expandable_fab.dart';
import 'package:net_carbons/presentation/calculate_page/bloc/calculate_bloc.dart';
import 'package:net_carbons/presentation/calculate_page/calculate_page.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/cart/cart_drawer.dart';
import 'package:net_carbons/presentation/home-products/screen_home.dart';
import 'package:net_carbons/presentation/layout_screen/widgets/bottom_bar.dart';
import 'package:net_carbons/presentation/profile/screen_profile.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/search_page/screen_search.dart';
import 'package:net_carbons/presentation/wish_list/bloc/wish_list_bloc.dart';
import 'package:net_carbons/presentation/wish_list/wish_list_drawer.dart';

GlobalKey<ScaffoldState> mainScaffold =
    GlobalKey<ScaffoldState>(debugLabel: 'mainScaffoldState');

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  static final List<Widget> _pages = [
    ScreenHome(),
    ScreenCalculateNew(),
    ScreenSearch(),
    ScreenAccount(),
  ];

  bool showModal = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    BlocProvider.of<WishListBloc>(context).add(const WishListEvent.started());
    // BlocProvider.of<CartBloc>(context).add(const CartEvent.cartStarted());
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CupertinoActivityIndicator(),
          )
        : Container(
      color: Colors.white,
          child: SafeArea(
              top: false,
              child: Stack(
                children: [
                  WillPopScope(
                    onWillPop: () async {
                      if (selectedIndexNotifier.value == 1 &&
                          calculatorSelectedPageNotifier.value == 1) {
                        calculatorSelectedPageNotifier.value = 0;

                        return false;
                      }
                      if (pageHistory.value.length > 1) {
                        setState(() {
                          selectedIndexNotifier.value =
                              pageHistory.value[pageHistory.value.length - 2];
                        });
                        pageHistory.value.removeLast();
                        return false;
                      }
                      pageHistory.value = [0];
                      return true;
                    },
                    child: Scaffold(
                      resizeToAvoidBottomInset: true,
                      key: mainScaffold,
                      drawer: const WishListDrawer(),
                      endDrawer: CartDrawer(),
                      backgroundColor: Colors.white,
                      body: ValueListenableBuilder(
                        valueListenable: selectedIndexNotifier,
                        builder: (BuildContext context, int value, _) {
                          return _pages[value];
                        },
                      ),
                      bottomNavigationBar: Container(
                        decoration:  const BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: AppColors.lightGrey,
                                blurRadius: 6.0,
                                spreadRadius: 1,
                                offset: Offset(0.0, -7)
                            )
                          ],
                        ),
                        child: const BottomNavigationWdget(),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: showModal
                          ? Container(
                              color: AppColors.primaryActiveColor.withOpacity(.8),
                            )
                          : const SizedBox()),
                  Positioned(
                    left: 0,
                    right: 17.w,
                    top: 0,
                    bottom: 150.h,
                    child: ValueListenableBuilder(
                      valueListenable: calculatorSelectedPageNotifier,
                      builder: (_, calculatorSelectedPage, child) {
                        return ValueListenableBuilder(
                          builder: (_, value, child) {
                            if (value == 1 && calculatorSelectedPage == 0) {
                              return SizedBox();
                            }
                            return FancyFab(
                              onPressed: () {
                                setState(() {});
                              },
                              tooltip: '',
                              icon: Icons.add,
                              onToggle: (val) {
                                setState(() {
                                  showModal = val;
                                });
                              },
                              children: [
                                FabListItem(
                                  tag: '1',
                                  icon: SvgPicture.asset(
                                    SvgAssets.calculateIconActive,
                                    width: 20,
                                  ),
                                ),
                                FabListItem(
                                  tag: '2',
                                  icon: SvgPicture.asset(
                                    SvgAssets.download,
                                    width: 20,
                                  ),
                                ),
                                FabListItem(
                                  tag: '3',
                                  icon: SvgPicture.asset(SvgAssets.cartIcon,
                                      width: 20),
                                )
                              ],
                            );
                          },
                          valueListenable: selectedIndexNotifier,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
        );
  }
}

class FabListItem extends StatelessWidget {
  const FabListItem({
    Key? key,
    required this.tag,
    required this.icon,
  }) : super(key: key);
  final String tag;

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return icon;
  }
}
//
