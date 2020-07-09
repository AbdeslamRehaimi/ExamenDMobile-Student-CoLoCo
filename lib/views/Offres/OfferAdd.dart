import 'package:flutter/material.dart';
import 'package:studen_co_loco/widgets/custom_modal_action_button.dart';
import 'package:studen_co_loco/widgets/custom_textfield.dart';
import 'package:studen_co_loco/widgets/custum_numberfield.dart';
//import 'package:studen_co_loco/model/todo.dart';

class AddOfferPage extends StatefulWidget {
  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
   
  final _inputPhoneControler = TextEditingController();
  final _inputAdrControler = TextEditingController();
  final _inputSuperfControler = TextEditingController();
  final _inputCapControler = TextEditingController();
  final _inputDescControler = TextEditingController();
  final _inputPriceControler = TextEditingController();



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
          CustomNumberField(
              labelText: 'Numero Telephone', controller: _inputPhoneControler,),
          SizedBox(height: 5),
          CustomTextField(
              labelText: 'L’adresse du logement', controller: _inputAdrControler),
          SizedBox(height: 5),
          CustomNumberField(
              labelText: 'Superficie', controller: _inputSuperfControler),
          SizedBox(height: 5),
          CustomNumberField(
              labelText: 'Capacité', controller: _inputCapControler),
          SizedBox(height: 5),
          CustomNumberField(
              labelText: 'Prix/mois', controller: _inputPriceControler),
          SizedBox(height: 5),
          CustomTextField(
              labelText: 'Description', controller: _inputDescControler),
          SizedBox(height: 5),
          
          
          CustomModalActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              if (_inputPhoneControler.text == "" ||
                  _inputAdrControler.text == "" ) {
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