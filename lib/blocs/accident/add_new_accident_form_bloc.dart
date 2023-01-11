
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class AllFieldsFormBloc extends FormBloc<String, String> {
  final text1 = TextFieldBloc();
  final text2 = TextFieldBloc();
  final text3 = TextFieldBloc();
  final text4 = TextFieldBloc();


  final multiSelect1 = MultiSelectFieldBloc<String, dynamic>(
    items: [
      'Fiziksel şiddete maruz kalma',
      'Sözlü şiddete maruz kalma',
      'Kesici delici alet yaralanmaları',
      'Biyolojik etkene maruz kalma',
      'Düşme,çarpma yaralanmaları',
      'Trafik Kazası(Maddi Hasarlı)',
      'Trafik Kazası(Yaralanmalı)',
      'Kimyasal madde ile temasa maruz kalma',
      'Yangın ve yanığa maruz kalma',
      'Ofis kazaları',
      'Elektrik kazaları',
    ],
  );
  final multiSelect2 = MultiSelectFieldBloc<String, dynamic>(
    items: [
      'Yetkisi olmadan çalışmak',
      'Hatalı uyarı vermek/almak',
      'Emniyette hata',
      'Uygun olmayan hız',
      'Ekipman koruyucusu kullanmamak',
      'Kişisel koruyucu donanım kullanmamak',
      'Ekipman kullanım hatası',
      'Arızalı ekipman kullanmak',
      'Bilgisi olmadığı alanda çalışmak',
      'Talimatlara uymamak',
      'Yorgunluk/Uykusuzluk/Dalgınlık',
      'Disiplinsiz çalışma',
      'Yetersiz makine ekipman muhafazası',
    ],
  );
  final multiSelect3 = MultiSelectFieldBloc<String, dynamic>(
    items: [
      'Yetersiz kişisel koruyucu donanım',
      'Arızalı ekipman/makine',
      'Yetersiz uyarı sistemi',
      'Yangın tehlikesi',
      'Doğal afetler',
      'Patlama tehlikesi',
      'Emniyetsiz istifleme',
      'Kapatılmamış boşluklar',
      'Emniyetsiz taşıma',
      'Elektrik sistemlerinde arıza',
      'Düzensiz oturum',
      'Aşırı gürültü',
      'Kaygan zemin',
      'Yetersiz aydınlatma',
    ],
  );
//  final file = InputFieldBloc<File?, String>(initialValue: null);


  final dateAndTime1 = InputFieldBloc<DateTime?, Object>(initialValue: null);

  final dateAndTime2 = InputFieldBloc<DateTime?, Object>(initialValue: null);

  AllFieldsFormBloc() : super(autoValidate: false) {
    addFieldBlocs(fieldBlocs: [
      text1,
      multiSelect1,
      multiSelect2,
      multiSelect3,
      dateAndTime1,
      dateAndTime2,
    ]);
  }
  @override
  void onSubmitting() async {
    try {
      print("1");
      await Future<void>.delayed(const Duration(milliseconds: 500));
      print("1");
      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      print("1");
      emitFailure();
    }
  }
}