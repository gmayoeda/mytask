import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class FieldDynamics extends StatefulWidget {
  TextEditingController? controller;
  String label;
  TextInputType type;
  bool? needValidate = true;
  bool? enable = true;
  bool readonly;
  List<TextInputFormatter>? inputFormatter;
  Function? functionValidate;
  int? limit;
  int? minLines;

  FieldDynamics(
      {super.key,
      required this.controller,
      required this.label,
      required this.type,
      this.inputFormatter,
      required this.needValidate,
      this.functionValidate,
      this.readonly = false,
      this.limit,
      this.minLines});

  @override
  State<StatefulWidget> createState() => _FieldDynamics();
}

class _FieldDynamics extends State<FieldDynamics> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 7),
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        TextFormField(
          readOnly: widget.readonly,
          enabled: widget.enable,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          keyboardType: widget.type,
          maxLength: widget.limit,
          minLines: widget.minLines,
          maxLines: null,
          inputFormatters: widget.inputFormatter,
          validator: widget.needValidate == false
              ? widget.functionValidate != null
                  ? (value) {
                      if (widget.functionValidate != null) {
                        return widget.functionValidate!();
                      }
                      return null;
                    }
                  : null
              : (value) {
                  if (value != null && value.trim().isEmpty) {
                    return "${widget.label} cannot be null.";
                  }
                  if (widget.functionValidate != null) {
                    return widget.functionValidate!();
                  }
                  return null;
                },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[800],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              // borderSide: BorderSide(color: Colors.grey.withOpacity(0.7)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
      ],
    );
  }
}
