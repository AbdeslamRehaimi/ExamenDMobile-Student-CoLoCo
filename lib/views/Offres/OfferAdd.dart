import 'package:flutter/material.dart';
import 'package:studen_co_loco/widgets/custom_date_time_picker.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';
import 'package:studen_co_loco/widgets/custom_textfield.dart';
//import 'package:studen_co_loco/model/todo.dart';

class AddOfferPage extends StatefulWidget {
  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
  //String _selectedDate = 'Pick date';
  DateTime _selectedDate = DateTime.now();
  //String _selectedTime = 'Pick time';
  TimeOfDay _selectedTime = TimeOfDay.now(); 


  final _textEventControler = TextEditingController();
  final _textDescControler = TextEditingController();




  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<Database>(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
              child: Text(
            "Add new Offer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
          SizedBox(
            height: 24,
          ),
          CustomTextField(
              labelText: 'Numero Telephone', controller: _textEventControler),
          SizedBox(height: 12),
          CustomTextField(
              labelText: 'L’adresse du logement', controller: _textEventControler),
          SizedBox(height: 12),
          CustomTextField(
              labelText: 'Superficie', controller: _textEventControler),
          SizedBox(height: 12),
          CustomTextField(
              labelText: 'Capacité', controller: _textEventControler),
          SizedBox(height: 12),
          CustomTextField(
              labelText: 'Description', controller: _textDescControler),
          SizedBox(height: 12),
          
          
          CustomModalActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              if (_textEventControler.text == "" ||
                  _textDescControler.text == "") {
                print("data not found");
              } else {
                /*
                provider
                    .insertTodoEntries(new TodoData(
                        //date: convertDateFromString(_selectedDate),
                        date: _selectedDate,
                        time: formatTimeToDate(_selectedTime),
                        isFinish: false,
                        task: _textEventControler.text,
                        description: _textDescControler.text,
                        todoType: TodoType.TYPE_EVENT.index,
                        id: null))
                    .whenComplete(() => Navigator.of(context).pop());
                    */
              }
            },
          )
        ],
      ),
    );
  }

}