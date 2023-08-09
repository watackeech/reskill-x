import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:reskill_x/component/main_button.dart';

import '../constant/colors.dart';



class RegisterInterestScreen extends StatelessWidget {
  const RegisterInterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> fieldOptions = ['Excel', 'PowerPoint', 'OneNote'];
    List<String>? interestedField = [];

    List<MultiSelectCard> generateCards(List<String> fieldOptions){
      List<MultiSelectCard> result = [];
      for(int i = 0; i < fieldOptions.length; i++){
        result.add(MultiSelectCard(value: fieldOptions[i], label: fieldOptions[i]));
      }
      return result;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MultiSelectContainer(
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.grey.withOpacity(0.1),
                      ]),
                      border: Border.all(color: kLightGrey),
                      borderRadius: BorderRadius.circular(20)),
                  selectedDecoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        kPrime,
                        kPrime
                      ]),
                      border: Border.all(color: kPrimeDark),
                      borderRadius: BorderRadius.circular(5)),
                  disabledDecoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.grey[500]!),
                      borderRadius: BorderRadius.circular(10)),
                ),
              // splashColor: kPrime,
                items: generateCards(fieldOptions),
                onChange: (allSelectedItems, selectedItem) {
                  interestedField = allSelectedItems.cast<String>();
                }),
            SizedBox(height: 30,),
            MainButton(buttonColor: kPrime, buttonTitle: '興味分野を登録', onTapped:
            (){
              if(interestedField != null){
                for(int i = 0; i < interestedField!.length; i++){
                  print(interestedField![i]);
                }
              }else{
                print('一つは選択しましょう!');
              }
            },
                textStyle: TextStyle(color: kWhite, fontSize: 24, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}