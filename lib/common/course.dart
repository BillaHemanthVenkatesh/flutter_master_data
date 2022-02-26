import 'package:flutter/material.dart';
import 'modal.dart';
import 'constants.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  final form = GlobalKey<FormState>();
  static final _focusNode = FocusNode();
  bool update = false;
  int currentIndex = 0;

  List<User> userList = [
    User(name: "abc", code: "a", id: "1"),
    User(name: "ccc", code: "b", id: "2"),
    User(name: "ddd", code: "c", id: "3"),
  ];

  @override
  Widget build(BuildContext context) {
    Widget bodyData() => DataTable(
         
          columns: const <DataColumn>[
            DataColumn(
                label: Text(
                  "Name",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.ta),
                ),
                tooltip: "To Display name"),
            DataColumn(
                label: Text(
                  "Code",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.ta),
                ),
                tooltip: "To Display code"),
            DataColumn(
                label: Text(
                  "ID",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.ta),
                ),
                tooltip: "To Display ID"),
            DataColumn(
                label: Text(
                  "Edit",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.ta),
                ),
                tooltip: "Edit data"),
            DataColumn(
                label: Text(
                  "Delete",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.ta),
                ),
                tooltip: "Delete data"),
          ],
          rows: userList
              .map(
                (user) => DataRow(
                  cells: [
                    DataCell(
                      Text(user.name),
                    ),
                    DataCell(
                      Text(user.code),
                    ),
                    DataCell(
                      Text(user.id),
                    ),
                    DataCell(
                      IconButton(
                        onPressed: () {
                          currentIndex = userList.indexOf(user);
                          _updateTextControllers(user); // new function here
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    DataCell(
                      IconButton(
                        onPressed: () {
                          currentIndex = userList.indexOf(user);
                          _deleteTextControllers(); // new function here
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Course Information",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Constants.coursebar,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              
              bodyData(),
              Padding(
                padding: Constants.formPad,
                child: Form(
                  key: form,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        maxLines: 1,
                        validator: (value) {
                           if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'enter correct course name';
                          }
                          return null;
                        },
                        
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Name',
                          icon:Icon(
                            Icons.person,
                          ),
                          labelStyle: TextStyle(
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                      const SizedBox(
                        height: Constants.boxHeight,
                      ),
                      TextFormField(
                        controller: codeController,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        maxLines: 1,
                        validator: (value) {
                           if (value!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Code',
                            hintText: 'Code',
                            labelStyle: TextStyle(
                                decorationStyle: TextDecorationStyle.solid),
                                icon:Icon(
                            Icons.source,
                          ),),
                      ),
                      const SizedBox(
                        height: Constants.boxHeight,
                      ),
                      TextFormField(
                        controller: idController,
                        // focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        maxLines: 1,
                        validator: (value) {
                           if (value!.isEmpty ) {
                            return 'enter correct id';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'ID',
                          hintText: 'ID',
                          labelStyle: TextStyle(
                              decorationStyle: TextDecorationStyle.solid),
                              icon:Icon(
                            Icons.credit_card,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Constants.boxHeight,
                      ),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Constants.addButton,
                                  ),
                                  child: const Text(
                                    "ADD",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if (validate() == true) {
                                      form.currentState!.save();
                                      addUserToList(
                                        nameController.text,
                                        codeController.text,
                                        idController.text,
                                      );
                                      clearForm();
                                    }
                                  },
                                ),
                                const SizedBox(width: Constants.boxWidth),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:Constants.td,
                                  ),
                                  child: const Text(
                                    "UPDATE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    if (validate() == true) {
                                      form.currentState!.save();
                                      updateForm();
                                      clearForm();
                                    }
                                  },
                                )],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
      
    );
  }

  void updateForm() {
    setState(() {
      User user = User(
          name: nameController.text,
          code: codeController.text,
          id: idController.text);
      userList[currentIndex] = user;
    });
  }

  void _updateTextControllers(User user) {
    setState(() {
      nameController.text = user.name;
      // value:user.name;
      codeController.text = user.code;
      idController.text = user.id;
    });
  }

  void _deleteTextControllers() {
    setState(() {
      userList.removeAt(currentIndex);
    });
  }

  void addUserToList(name, code, id) {
    setState(() {
      userList.add(User(name: name, code: code, id: id));
    });
  }

  clearForm() {
    nameController.clear();
    codeController.clear();
    idController.clear();
  }

  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
}
