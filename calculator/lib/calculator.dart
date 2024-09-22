import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/constants/colors.dart';
import 'package:calculator/helper/button_style.dart';
import 'package:calculator/provider/calc_provider.dart';
import 'package:calculator/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Consumer<CalcProvider>(
        builder: (context, calcProvider, child) => Column(
          children: [
            SizedBox(height: 60.h),
            Center(
              child: FlutterSwitch(
                width: 72,
                height: 32,
                toggleSize: 24,
                toggleColor: isDarkMode ? AppColors.darkSecondary : AppColors.lightSecondary,
                activeColor: AppColors.darkPrimary,
                inactiveColor: Colors.white,
                activeIcon: Image.asset('assets/icons/moon.png', height: 24),
                inactiveIcon: Image.asset('assets/icons/sun.png', height: 24),
                value: themeProvider.themeMode == ThemeMode.dark,
                onToggle: (value) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
            SizedBox(height: 55.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Container(
                    height: 47.h,
                    alignment: Alignment.bottomRight,
                    child: AutoSizeText(
                      calcProvider.question,
                      style: GoogleFonts.workSans(fontSize: 40.sp),
                    ),
                  ),
                  Container(
                    height: 96.h,
                    width: 335.w,
                    alignment: Alignment.bottomRight,
                    child: AutoSizeText(
                      calcProvider.answer,
                      style: GoogleFonts.workSans(fontSize: 90.sp),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  GridView.builder(
                    itemCount: calcProvider.buttonList.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      mainAxisExtent: 72.h,
                    ),
                    itemBuilder: (context, index) {
                      final buttonText = calcProvider.buttonList[index];

                      return SizedBox(
                        height: 72.h,
                        width: 71.75.w,
                        child: ElevatedButton(
                          style: const ButtonStyle().copyWith(
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.r),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              ButtonStyleHelper.getButtonBackgroundColor(buttonText, isDarkMode),
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              ButtonStyleHelper.getButtonForegroundColor(buttonText, isDarkMode),
                            )
                          ),
                          onPressed: () {
                            calcProvider.onButtonClick(index);
                          },
                          child: FittedBox(
                            child: Text(
                              buttonText,
                              style: GoogleFonts.workSans(
                                fontSize:
                                    index == 1 || index == 18 ? 32.sp : 32.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
