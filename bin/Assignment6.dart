import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:pedantic/pedantic.dart';

void main(List<String> arguments) {

  Directory pwd = Directory.current;
  final myfile = new  File(pwd.path + '/new.txt');
  Directory temp = Directory.current;
  File file = File('/home/michael/CLionProjects/counthelines/bible.txt');
  File file2 = File('/home/michael/Documents/Bible/bible_Dougy-Rheims.txt');
  writeFile(myfile);

  //print(readFile(file2)[56]);
  print('the word \'God\' appears ${countOccurrencesUsingLoop(readFile(file2), 'God')} times');
  print('the word \'love\' appears ${countOccurrencesUsingWhereMethod(readFile(file2), 'love')} times');
  print('the word \'Jehovah\' appears ${countOccurrencesUsingWhereMethod(readFile(file2), 'Jehovah')} times');
  print('the word \'devil\' appears ${countOccurrencesUsingWhereMethod(readFile(file2), 'devil')} times');
  print('the word \'Hell\' appears ${countOccurrencesUsingWhereMethod(readFile(file2), 'Hell')} times');
  print('the word \'sex\' appears ${countOccurrencesUsingExtension(readFile(file2), 'sex')} times');
  print('the word \'money\' appears ${countOccurrencesUsingLoop(readFile(file2), 'money')} times');
//  deleteFile(myfile);

}
void deleteFile(File file){
  file.deleteSync(recursive: false);

}
void writeFile(File file){
  RandomAccessFile myFile = file.openSync(mode: FileMode.append);
  myFile.writeStringSync('Hello World');
  myFile.flushSync();
  myFile.closeSync();


}

  List readFile(File file){
    List<String> words = [];
    if (!file.existsSync()) {
      return null;
    }
    else {
      var contents = file.readAsStringSync();
      words = contents.split(' ');
      //contents.forEach((item) {words.add(item)}));
      //print(words[56]);
      return words;
    }


  }

  int countOccurrencesUsingWhereMethod(List<String> list, String element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  var foundElements = list.where((g) => g == element);
  //var stuff = list.where((g) => false)
  return foundElements.length;
}


int countOccurrencesUsingLoop(List<String> list, String element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i] == element) {
      count++;
    }
  }

  return count;
}
extension ListExt on List {
  int findOccurrences(String element) {
    var foundLetters = this.where((letter) => letter == element);
    return foundLetters.length;
  }
}

int countOccurrencesUsingExtension(List<String> list, String element) {
  return list.findOccurrences(element);
  // OR
  // return ListExt(list).findOccurrences(element);
}





