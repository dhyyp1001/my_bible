import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropdown {
  Widget customDropdownWidget(Future future, String? selectedValue, String hint,
      Function(String?)? function) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(204, 108, 45, 1.0), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(fontSize: 15),
                  ),
                );
              } else {
                return DropdownButton(
                  underline: SizedBox.shrink(),
                  hint: Text(hint),
                  alignment: Alignment.center,
                  value: selectedValue,
                  items: snapshot.data
                      ?.map<DropdownMenuItem<String>>(
                        (String? item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text('$item'),
                        ),
                      )
                      .toList(),
                  onChanged: function,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
