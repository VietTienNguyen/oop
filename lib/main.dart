import 'package:flutter/material.dart';
import 'package:oop/service.dart';
import 'package:oop/student.dart';

import 'itemStudent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oop',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This will be displayed on the screen
  List<String> _content = [];
  final _textNameController = TextEditingController();
  final _textBirthDayController = TextEditingController();
  final _textSexController = TextEditingController();
  int position = 0;
  @override
  void initState() {
    super.initState();
    Service().readData().then((value) => setState(() {
          _content = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _textNameController,
                decoration: InputDecoration(labelText: 'Nhập tên sinh viên'),
              ),
              TextField(
                controller: _textBirthDayController,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Nhập Ngày sinh sinh viên'),
              ),
              TextField(
                controller: _textSexController,
                decoration:
                    InputDecoration(labelText: 'Nhập giới tính sinh viên'),
              ),
              ElevatedButton(
                child: Text('Thêm sinh viên'),
                onPressed: () {
                  final student = Student();
                  student.name = _textNameController.text;
                  student.dateBirthday = _textBirthDayController.text;
                  student.sex = _textSexController.text;
                  _textBirthDayController.clear();
                  _textNameController.clear();
                  _textSexController.clear();
                  Service().writeData(student);
                },
              ),
              ElevatedButton(
                child: Text('Sửa thông tin sinh viên'),
                onPressed: () {
                  final student = Student();
                  student.name = _textNameController.text;
                  student.dateBirthday = _textBirthDayController.text;
                  student.sex = _textSexController.text;
                  _textBirthDayController.clear();
                  _textNameController.clear();
                  _textSexController.clear();
                  Service().updateStudent(position, student);
                },
              ),
              SizedBox(
                height: 10,
              ),
              _content != null
                  ? Container(
                      height: 300,
                      child: ListView.builder(
                          itemCount: _content.length,
                          itemBuilder: (context, indext) {
                            List<String> newListStudent =
                                _content[indext].split(",");
                            return GestureDetector(
                                onLongPress: () {
                                  Service().deleteStudent(indext);
                                },
                                onTap: () {
                                  position = indext;
                                  _textNameController.text = newListStudent[1];
                                  _textBirthDayController.text =
                                      newListStudent[2];
                                  _textSexController.text = newListStudent[3];
                                },
                                child: ItemStudent(
                                  dataStudent: newListStudent,
                                ));
                          }),
                    )
                  : 'Press the button to load your name',
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: ElevatedButton(
          child: Text(
            'Hiển thị danh sách sinh viên',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Service().readData().then((value) => setState(() {
                  _content = value;
                }));
          },
        ),
      ),
    );
  }
}
