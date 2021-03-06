import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _handleSubmit(BuildContext context) {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(
      title,
      value,
      _selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _handleSubmit(context),
                label: 'Título',
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                onSubmitted: (_) => _handleSubmit(context),
                label: 'Valor (R\$)',
              ),
              AdaptativeDatePicker(
                onDateChanged: (pickedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                },
                selectedDate: _selectedDate,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    onPressed: () => _handleSubmit(context),
                    label: 'Nova Transação',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
