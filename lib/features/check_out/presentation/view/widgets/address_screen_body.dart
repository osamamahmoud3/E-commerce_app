import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../google_maps/presentation/views/view/google_maps_screen.dart';
import '../screens/check_out_view.dart';
import '../screens/on_delivary_screen.dart';

String location = '';

class AddressScreenBody extends StatefulWidget {
  const AddressScreenBody({
    super.key,
  });

  @override
  State<AddressScreenBody> createState() => _AddressScreenBodyState();
}

bool paymentMethod = false;

int selectedIndex = 0;
int currentindex = 0;

class _AddressScreenBodyState extends State<AddressScreenBody> {
  List<Widget> paymentMethodOption = [
    Text(S.current.Cash_on_delivery),
    Text(S.current.Online_payment),
  ];
  List<Step> steps() => [
        Step(
            isActive: currentindex >= 0,
            title: const Text('حدد العنوان'),
            content: location == ''
                ? Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const GoogleMapsScreen();
                                })).then((value) => setState(() {}));
                              },
                              child: Text(S.of(context).Pick_Location_from_map,
                                  style: AppStyles.font16Medium)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: AppColors.primaryColor),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      const AppTextFeild(hint: 'Street'),
                                      const SizedBox(height: 10),
                                      const AppTextFeild(hint: 'City'),
                                      const SizedBox(height: 10),
                                      const AppTextFeild(hint: 'State'),
                                      const SizedBox(height: 10),
                                      const AppTextFeild(hint: 'Country'),
                                      const SizedBox(height: 10),
                                      const AppTextFeild(hint: 'Pincode'),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomButton(
                                          text: const Text('Submit'),
                                          bgColor: AppColors.primaryColor,
                                          onPressed: () {}),
                                    ],
                                  ));
                            },
                          );
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(width: 10),
                            Text(S.of(context).Enter_Address_Details,
                                style: AppStyles.font16Medium),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: AppColors.primaryColor),
                      const SizedBox(height: 20),
                    ],
                  )
                : const Text('خلاص عرفنا انت فين',
                    style: AppStyles.font16Medium)),
        Step(
            isActive: currentindex >= 1,
            title: const Text('حدد طريقة الدفع'),
            content: Column(
              children: [
                const SizedBox(height: 20),
                const Divider(color: AppColors.primaryColor),
                const SizedBox(height: 20),
                Text(S.of(context).Payment_Options,
                    style: AppStyles.font16Medium),
                Column(
                  children: paymentMethodOption.asMap().entries.map((e) {
                    int index = e.key;
                    var value = e.value;
                    return CheckboxListTile(
                      activeColor: AppColors.primaryColor,
                      value: selectedIndex == index,
                      title: value,
                      onChanged: (value) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Divider(color: AppColors.primaryColor),
                const SizedBox(height: 20),
                Text(S.of(context).Your_Location,
                    style: AppStyles.font16Medium),
                const SizedBox(height: 10),
                Text(location,
                    style: AppStyles.font18SemiBold.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w400)),
                const SizedBox(height: 20),
                const Divider(color: AppColors.primaryColor),
                const SizedBox(height: 20),
                CustomButton(
                    text: Text(S.of(context).Submit),
                    bgColor: AppColors.primaryColor,
                    onPressed: () {
                      if (selectedIndex == 0) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const OnDelivaryScreen();
                        }));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CheckOutView(
                            price: '1000',
                          );
                        }));
                      }
                    }),
              ],
            )),
      ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0XFFF1EFEF),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          )),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: AppColors.primaryColor,
              ),
        ),
        child: Stepper(
          elevation: 0,
          type: StepperType.horizontal,
          physics: const ScrollPhysics(),
          controlsBuilder: (context, details) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  if (currentindex == 0)
                    Expanded(
                      child: CustomButton(
                        text: const Text('التالي'),
                        bgColor: AppColors.primaryColor,
                        onPressed: details.onStepContinue,
                      ),
                    ),
                  Expanded(
                    child: CustomButton(
                      text: const Text('السابق'),
                      bgColor: AppColors.primaryColor,
                      onPressed: details.onStepCancel,
                    ),
                  ),
                ],
              ),
            );
          },
          steps: steps(),
          currentStep: currentindex,
          onStepCancel: currentindex == 0
              ? null
              : () {
                  setState(() {
                    currentindex--;
                  });
                },
          onStepContinue: () {
            final isLastStep = currentindex == steps().length - 1;
            if (isLastStep) {
              setState(() {
                currentindex = 0;
              });
            } else {
              if (location == '') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Error',
                  desc: 'Please Enter Your Location',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {},
                ).show();
              } else {
                setState(() {
                  currentindex++;
                });
              }
            }
          },
        ),
      ),
    );
  }
}

class AppTextFeild extends StatelessWidget {
  const AppTextFeild({super.key, required this.hint});
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            gapPadding: 3,
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          hintStyle: AppStyles.font15Regular.copyWith(color: AppColors.grey),
          hintText: hint,
          filled: true,
          fillColor: AppColors.lightGrey,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            borderSide: BorderSide.none,
          )),
    );
  }
}
