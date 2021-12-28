import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Service {
  // Find the Documents path
  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<List> readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    final data = await _myFile.readAsLines(encoding: utf8);
    return data;
  }

  // This function is triggered when the "Write" buttion is pressed
  Future<void> writeData(student) async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    // If data.txt doesn't exist, it will be created automatically
    await _myFile.writeAsString(
        '${student.id},${student.name},${student.dateBirthday},${student.sex}\n',
        mode: FileMode.append);
  }

  Future<void> deleteStudent(int index) async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    readData().then((value) {
      value.removeAt(index);
      final newTextData = value.join('\n');
      _myFile.writeAsString(newTextData); // update the file with the new data
    });
  }

  Future<void> updateStudent(int index,student) async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    readData().then((value) {
      value[index]='${student.id},${student.name},${student.dateBirthday},${student.sex}\n';
      print(value[0]);
      _myFile.writeAsString(value.join('\n'),
          mode: FileMode.writeOnly); // update the file with the new data
    });
  }
}
