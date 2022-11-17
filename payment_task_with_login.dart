import 'dart:io';

main() {
  // products in cart
  String productName = "Qulaqliq";
  String error = 'Ugursuz emeliyyat.';
  double productPrice = 100;
  int count = 2;
  double totalPrice = count * productPrice;
  int cargoPrice = 10;
  // --------------------------------------
  // login info
  String userName = ""; //yoxlamaq ucun terminala togrulagayev yazilmalidi
  String passWord = ''; // yoxlamaq ucun terminala 1234 yazilmalidi
  String userAddress;
  num userCardBalance = 500;
  // --------------------------------------
// Bank
  String kapitalBank = 'Kapital Bank';
  double creditPercentKB = (totalPrice * 0.1);
  num totalForKB = creditPercentKB + totalPrice;
  String xalqBank = 'Xalq Bank';
  double creditPercentXB = (totalPrice * 0.3);
  num totalForXB = creditPercentXB + totalPrice;
  num oneMonthKB6 = totalForKB / 6;
  num oneMonthKB3 = totalForKB / 3;
// ------------------------------------------------------------------------------------------
  if (userName == '' || userName == ' ' || userName.isEmpty) {
    print("Hesabiniza giris edin!");
    var userName = stdin.readLineSync();
    if (userName == 'togrulagayev') {
      print('Sifrenizi daxil edin:');
      var passWord = stdin.readLineSync();
      if (passWord == '1234') {
        print("Xos geldin!");
        if (userName != '' && userName != ' ' && userName != null) {
          if ((productName != '' || productName != ' ') &&
              productPrice > 0 &&
              count > 0) {
            print(
                "Sebetde olan mehsul: $productName, elave olunmus meysul sayi:$count, mehsulun bir ededinin qiymeti: $productPrice AZN");
            print('Umumi qiymet:${count * productPrice}AZN');
            print('======' * 4);
            print("Odenis usulunu secin:");
            print('1. Kartla odenis');
            print('2. Catdirilma:Nagd');
            print('3. Yerinde odenis');
            var userChoice = stdin.readLineSync();
            switch (userChoice) {
              case '1':
                print("Bank secin:");
                print('1. $kapitalBank');
                print('2. $xalqBank');
                var userChoiceBank = stdin.readLineSync();
                print('Kart melumatlarini daxil edin');
                var userCard = stdin.readLineSync();
                switch (userChoiceBank) {
                  case '1':
                    print('Nece odemek isteyirsiz?');
                    print('1. 6 ay taksitle');
                    print('2. 3 ay taksitle');
                    print('3. Birdefelik odenis');
                    var userPaymentChoice = stdin.readLineSync();
                    switch (userPaymentChoice) {
                      case '1':
                        if (userCardBalance >= totalForKB) {
                          print('Umumi odencek mebleg: ${totalForKB} AZN');
                          print('Ayliq odenis: ${totalForKB / 6} AZN');
                          print(
                              'Xeberdarliq: Ilk ayin odenisi hesabinizdan cixilacaq. Emeliyyati tesdiq edin. Tesdiq ucun Y, imtina ucun N.');
                          var confirm = stdin.readLineSync();
                          switch (confirm) {
                            case 'Y':
                              print('Ilk ayin odenisi balansinizdan cixildi');
                              userCardBalance = userCardBalance - oneMonthKB6;
                              print(userCardBalance);
                              break;
                            case 'N':
                              print('Emeliyyat sona catdi.');
                              break;
                            default:
                              print('Secim duzgun deyil.');
                          }
                        } else {
                          print(error);
                        }
                        break;
                      case '2':
                        if (userCardBalance >= totalForKB) {
                          print('Umumi odencek mebleg: ${totalForKB} AZN');
                          print('Ayliq odenis: ${totalForKB / 3} AZN');
                        } else {
                          print(error);
                        }
                        break;
                      case '3':
                        if (userCardBalance >= totalPrice) {
                          print('Umumi odenilecek mebleg: ${totalPrice} AZN');
                        } else {
                          print(error);
                        }
                        break;
                    }
                    break;
                  case '2':
                    print('Nece odemek isteyirsiz?');
                    print('1. 3 hissye bolerek');
                    print('2. Bir defelik odenis');
                    var userPaymentChoice = stdin.readLineSync();
                    switch (userPaymentChoice) {
                      case '1':
                        if (userCardBalance >= totalForXB) {
                          print('Umumi odenilecek mebleg: ${totalForXB} AZN');
                          print('Ayliq odenis: ${totalForXB / 3} AZN');
                        }
                        break;
                      case '2':
                        if (userCardBalance >= totalPrice) {
                          print('Umumi odenilecek mebleg: ${totalPrice} AZN');
                        }
                        break;
                    }
                }
                break;
              case '2':
                print('Unvani daxil edin:');
                var userAddress = stdin.readLineSync();
                print("Mehsulun Qiymeti:$totalPrice");
                print('Catdirilma haqqi: ${cargoPrice} AZN');
                print(
                    'Umumi odenilecek mebleg: ${totalPrice + cargoPrice} AZN');
                break;
              case '3':
                print(
                    'Mehsulunuz sizi gozleyir. Gun erzinde gelib goture bilersiz');
                break;
            }
          } else {
            print('Sebetiniz bosdur. Mehsul elave edin sonra yoxlayin.');
          }
        }
      } else {
        print('Sifre duzgun deyil');
      }
    } else {
      print('Istifadeci tapilmadi. Melumatlari duzgun daxil edin.');
    }
  }
}
