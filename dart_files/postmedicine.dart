import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'services/detabase.dart';

class MedicineForm extends StatefulWidget {
  const MedicineForm({super.key});

  @override
  State<MedicineForm> createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _genericNameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _batchNoController = TextEditingController();

  // Date Picker
  Future<void> _pickExpiryDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _expiryDateController.text =
        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  // Common Input Field Widget
  Widget buildField(TextEditingController controller, String label,
      {TextInputType type = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "$label is required";
          }
          return null;
        },
      ),
    );
  }

  // Submit Form
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String id = randomAlphaNumeric(15);

      Map<String, dynamic> medicineData = {
        "Name": _nameController.text.trim(),
        "Company": _companyController.text.trim(),
        "GenericName": _genericNameController.text.trim(),
        "Type": _typeController.text.trim(),
        "Category": _categoryController.text.trim(),
        "Price": _priceController.text.trim(),
        "Quantity": _quantityController.text.trim(),
        "ExpiryDate": _expiryDateController.text.trim(),
        "BatchNo": _batchNoController.text.trim(),
        "id": id,
      };


      try {

        await DatabaseMethod().addMedicineRecord(medicineData, id);
        Fluttertoast.showToast(msg: "Medicine added successfully!");
        Navigator.pop(context);

      } catch (e) {
        Fluttertoast.showToast(msg: "Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Medicine Record",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  buildField(_nameController, "Medicine Name"),
                  buildField(_companyController, "Company Name"),
                  buildField(_genericNameController, "Generic Name"),
                  buildField(_typeController, "Type"),
                  buildField(_categoryController, "Category"),
                  buildField(_priceController, "Price",
                      type: TextInputType.number),
                  buildField(_quantityController, "Quantity",
                      type: TextInputType.number),
                  buildField(_batchNoController, "Batch Number"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      controller: _expiryDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Expiry Date",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      onTap: _pickExpiryDate,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Expiry Date is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _submitForm,
                    icon: const Icon(Icons.save),
                    label: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
