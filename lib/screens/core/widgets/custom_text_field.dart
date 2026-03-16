import 'package:flutter/material.dart';


final decorationForTextField = InputDecoration(
  filled: true,
  fillColor: Colors.grey[50],   
  
  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
  
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16), 
    borderSide: BorderSide(color: Colors.grey[200]!, width: 1.5),
  ),
  
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
  ),
  
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
  ),
  
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.redAccent, width: 2),
  ),
  
  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
  
);

/*
TextField(
  decoration: decorationForTextField.copyWith(
    hintText: "user name", 
    prefixIcon: Icon(Icons.person), 
  ),
)
*/
