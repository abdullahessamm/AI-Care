// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ai_care/core/constants/app_color.dart';
import 'package:ai_care/data/repositories/auth/firebase_auth_repository.dart';
import 'package:ai_care/domain/entities/user.dart';
import 'package:ai_care/presentation/blocs/auth/auth_bloc.dart';
import 'package:ai_care/presentation/widgets/settings/setting_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  User? _user = null;

  SettingsView({super.key}) : _user = FirebaseAuthRepository.instance.user;

  @override
  Widget build(BuildContext context) {
    const spaceBetweenRows = 20.0;

    return Scaffold(
      body: Stack(
        children: [
          // background
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
          ),
          // content
          SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title
                  Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 37,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Settings of your app",
                    style: TextStyle(color: Color(0xffefefef), fontSize: 18),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // Content of page
                  Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                          )
                        ]),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // section title
                            Text(
                              "Account Settings",
                              style: TextStyle(
                                  color: Color(0xff999999), fontSize: 12),
                            ),
                            SizedBox(height: spaceBetweenRows),
                            SettingRow.primary(
                              label: "Username",
                              iconData: Icons.person_outline_rounded,
                            ),
                            SizedBox(height: spaceBetweenRows),
                            SettingRow.primary(
                              label: "Phone Number",
                              iconData: Icons.phone_outlined,
                            ),
                            SizedBox(height: spaceBetweenRows),
                            SettingRow.primary(
                              label: "Email",
                              currentValue: _user?.email,
                              iconData: Icons.email_outlined,
                            ),
                            SizedBox(height: spaceBetweenRows),
                            SettingRow.primary(
                              label: "Password",
                              iconData: Icons.password_outlined,
                            ),
                            SizedBox(height: spaceBetweenRows),
                            SettingRow.primary(
                              label: "Birthdate",
                              iconData: Icons.calendar_today,
                            ),
                            SizedBox(height: spaceBetweenRows),
                            // Disease information
                            Text(
                              "Disease information",
                              style: TextStyle(
                                  color: Color(0xff999999), fontSize: 12),
                            ),

                            SizedBox(height: spaceBetweenRows),

                            SettingRow.primary(
                              label: "Disease type",
                              iconData: Icons.healing,
                            ),

                            SizedBox(height: spaceBetweenRows),

                            SettingRow.primary(
                              label: "Disease date",
                              iconData: Icons.calendar_month_outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: spaceBetweenRows,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is Unauthenticated) {
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return Row(
                            children: [
                              CircularProgressIndicator(
                                color: AppColors.primary,
                                strokeWidth: 3,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text("Logging you out...")
                            ],
                          );
                        }

                        return SettingRow.error(
                          label: "Logout",
                          iconData: Icons.power_settings_new,
                          onTap: () {
                            context.read<AuthBloc>().add(LogoutEvent());
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
