import 'dart:async';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/domain/user_profile/modal/certificate_details.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';

class ScreenCertificate extends StatefulWidget {
  const ScreenCertificate({Key? key, required this.certId}) : super(key: key);
  final String certId;

  @override
  State<ScreenCertificate> createState() => _ScreenCertificateState();
}

class _ScreenCertificateState extends State<ScreenCertificate> {
  final repository = getIt<UserProfileRepository>();

  late StreamController<dartz.Either<Failure, CertificateDetailsModal>>
      streamController;
  late AppControllerState appControllerState;
  @override
  void initState() {
    appControllerState = BlocProvider.of<AppControllerBloc>(context).state;
    streamController =
        StreamController<dartz.Either<Failure, CertificateDetailsModal>>();
    _getData();
    super.initState();
  }

  _getData() async {
    repository.getCertificateDetails(widget.certId).then((value) => value.fold(
        (l) => streamController.add(dartz.Left(l)),
        (r) => streamController.add(dartz.Right(r))));
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 180.w,
                      height: 24.h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                        ImageAssets.homeBarLogo,
                      ))),
                    ),
                  ),
                  const Icon(Icons.menu)
                ],
              ),
            ),
          ),
          // title: LogoBar(),
          // centerTitle: false,
          // actions: [Icon(Icons.menu)],
        ),
      ),
      body: StreamBuilder<dartz.Either<Failure, CertificateDetailsModal>>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return data!.fold(
                  (l) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(l.message),
                            CupertinoButton(
                                child: const Text('Retry'),
                                onPressed: () {
                                  _getData();
                                })
                          ],
                        ),
                      ),
                  (CertificateDetailsModal certificateDetailsModal) =>
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              color: AppColors.certificateBgGreen,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                    child: Text(
                                      'Sustainability Certificate',
                                      style: textTheme.headline4?.copyWith(
                                          color: AppColors.appWhite,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 6.h),
                                    color: AppColors.appWhite,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 9.h,
                                        ),
                                        Text("PRESENTED TO",
                                            style: textTheme.headline4
                                                ?.copyWith(fontSize: 16)),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        Text(
                                          "${certificateDetailsModal.buyer.firstName} ${certificateDetailsModal.buyer.lastName}, ${certificateDetailsModal.buyer.city}, ${certificateDetailsModal.buyer.state}",
                                          style: textTheme.caption?.copyWith(
                                              color:
                                                  AppColors.primaryActiveColor),
                                        ),
                                        SizedBox(
                                          height: 37.h,
                                        ),
                                        Wrap(
                                          spacing: 40.w,
                                          runSpacing: 20.h,
                                          alignment: WrapAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              width: 140.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "FOR OFFSETTING",
                                                    style: textTheme.caption
                                                        ?.copyWith(
                                                            fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    "${certificateDetailsModal.quantity} Metrics tons of CO2e Emissions",
                                                    style: textTheme.headline2
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .primaryActiveColor,
                                                            fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              width: 140.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "PROJECT NAME",
                                                    style: textTheme.caption
                                                        ?.copyWith(
                                                            fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    "${certificateDetailsModal.project.name}",
                                                    style: textTheme.headline2
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .primaryActiveColor,
                                                            fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              width: 140.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "VALID FOR",
                                                    style: textTheme.caption
                                                        ?.copyWith(
                                                            fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(DateTime(
                                                            certificateDetailsModal
                                                                    .buyer
                                                                    .deliveryDate
                                                                    .year +
                                                                1,
                                                            certificateDetailsModal
                                                                .buyer
                                                                .deliveryDate
                                                                .month,
                                                            certificateDetailsModal
                                                                .buyer
                                                                .deliveryDate
                                                                .day)),
                                                    style: textTheme.headline2
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .primaryActiveColor,
                                                            fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              width: 140.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "PROJECT OWNER",
                                                    style: textTheme.caption
                                                        ?.copyWith(
                                                            fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    certificateDetailsModal
                                                        .project.owner,
                                                    style: textTheme.headline2
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .primaryActiveColor,
                                                            fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              width: 140.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "VERIFICATION STANDARD",
                                                    style: textTheme.caption
                                                        ?.copyWith(
                                                            fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    "${certificateDetailsModal.project.standards.first.methodology}",
                                                    style: textTheme.headline2
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .primaryActiveColor,
                                                            fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 140.w,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              width: 140.w,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "PROJECT NUMBER",
                                                    style: textTheme.caption
                                                        ?.copyWith(
                                                            fontSize: 14),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  Text(
                                                    certificateDetailsModal
                                                        .originNumber,
                                                    style: textTheme.headline2
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: AppColors
                                                                .primaryActiveColor,
                                                            fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 22.h,
                                        ),
                                        Transform.scale(
                                            scale: .8,
                                            child: Image.network(
                                                certificateDetailsModal.project
                                                    .standards.first.logo)),
                                        SizedBox(
                                          height: 26.h,
                                        ),
                                        Image.asset(
                                            'assets/images/certifiacte_org.png'),
                                        SizedBox(
                                          height: 26.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                    child: Text(
                                      'Carbon Chain of Custody',
                                      style: textTheme.headline4?.copyWith(
                                          color: AppColors.appWhite,
                                          fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 6.h),
                                    color: AppColors.appWhite,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 33.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "CERTIFICATE NUMBER",
                                                      style: textTheme.caption
                                                          ?.copyWith(
                                                              fontSize: 14),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Text(
                                                      "${certificateDetailsModal.originNumber}",
                                                      style: textTheme.headline2
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: AppColors
                                                                  .primaryActiveColor,
                                                              fontSize: 14),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "DELIVERED",
                                                      style: textTheme.caption
                                                          ?.copyWith(
                                                              fontSize: 14),
                                                      textAlign: TextAlign.end,
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Text(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(
                                                              certificateDetailsModal
                                                                  .buyer
                                                                  .deliveryDate),
                                                      style: textTheme.headline2
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: AppColors
                                                                  .primaryActiveColor,
                                                              fontSize: 14),
                                                      textAlign: TextAlign.end,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 33.h,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              const Icon(
                                                Icons.check_circle,
                                                color: AppColors
                                                    .certificateBgGreen,
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Text(
                                                "${certificateDetailsModal.buyer.firstName} ${certificateDetailsModal.buyer.lastName}",
                                                style: textTheme.caption
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .primaryActiveColor),
                                              ),
                                              SizedBox(
                                                height: 22.h,
                                              ),
                                              Text(
                                                "${certificateDetailsModal.project.name} ${certificateDetailsModal.project.state}",
                                                style: textTheme.headline4
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .primaryActiveColor),
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Text(
                                                "${certificateDetailsModal.buyer.firstName}, ${certificateDetailsModal.buyer.city}, ${certificateDetailsModal.buyer.state}, ${certificateDetailsModal.buyer.country} ",
                                                style: textTheme.headline4
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .primaryActiveColor),
                                              ),

                                              Text(
                                                DateFormat('yyyy-MM-dd').format(
                                                    certificateDetailsModal
                                                        .buyer.deliveryDate),
                                                style: textTheme.caption
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .primaryActiveColor),
                                              ),
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Text(
                                                "${certificateDetailsModal.project.owner} AUTHENTICITY CERTIFIED BY HASHTRAC.COM",
                                                style: textTheme.caption
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .primaryActiveColor),
                                                textAlign: TextAlign.center,
                                              ),

                                              // Row(children: [Image.network(certificateDetailsModal.project.standards.first.link)],)
                                              SizedBox(
                                                height: 16.h,
                                              ),
                                              Text(
                                                "0xasdsfds75ghjhsdsad2fsdg",
                                                style: textTheme.caption
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .primaryActiveColor),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 19.h,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                """
Authenticity Report

Status: Authentic

documentHash:${certificateDetailsModal.buyer.transactionId}

documentURL:https://ecostance.marketsverse.com/certificate/${certificateDetailsModal.originNumber}.pdf

storeLocation:Local

transactionDate:${certificateDetailsModal.buyer.deliveryDate}

transactionFrom:EBC

transactionId:${certificateDetailsModal.buyer.transactionId}

transactionIssuer:EBC

transactionTo: ${certificateDetailsModal.buyer.firstName}
                """,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ));
            }
            return Center(child: const CupertinoActivityIndicator());
          }),
    );
  }
}

const String certificateData = """
{
    "formattedNewOriginNumber": "1000 0000 0265",
    "originNumber": "100000000265",
    "quantity": 1,
    "project": {
        "name": "Kariba REDD+",
        "owner": "",
        "number": "VCS 902",
        "state": "",
        "standards": [
            {
                "_id": "62e77586b67e111b5f6856d9",
                "id": "4",
                "type": "Voluntary Carbon Offset",
                "name": "Verra",
                "companyWebsite": "https://verra.org/",
                "methodology": "Verified Carbon Standard",
                "logo": "https://res.cloudinary.com/cloudhungry/image/upload/v1659351392/ebc/verra_x9ifpc.png",
                "link": "https://verra.org/project/vcs-program/",
                "description": "The VCS Program is the world's most widely used voluntary GHG program. Over 1,803 certified VCS projects have collectively reduced or removed more than 957 million tonnes of carbon and other GHG emissions from the atmosphere. VCS Program ensure the credibility of emission reduction projects. Once projects have been certified against the VCS Program, project developers can issued tradable GHG credits, also known as Verified Carbon Units (VCUs). Those VCUs can then be sold on the open market and retired by individuals and companies as a means to offset their own emissions."
            }
        ],
        "intermediaries": []
    },
    "buyer": {
        "firstName": "Ameya",
        "lastName": "Pai",
        "city": "Alur",
        "state": "Karnataka",
        "country": "India",
        "pincode": "560078",
        "deliveryDate": "2022-05-18T16:37:32.705Z",
        "transactionId": "8277dcb7-00a0-4634-9b4b-904c91a5bac7"
    }
}
""";
