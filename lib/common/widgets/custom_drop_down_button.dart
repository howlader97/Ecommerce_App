
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/app_color.dart';
import 'package:ecommerce_app/utils/dimensions.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String>? items;
  final String? titleText,labelText;
  final bool showTitle;
  final bool isRequired;
  final String? hintText;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final FontWeight? titleFontWeight;
  final String? selectedValue;
  final List<DropdownMenuItem<String>>? dropdownMenuItems;
  final Icon ?prefixIcon;

  const CustomDropdownButton({
    super.key,
    this.items,
    this.labelText,
    this.titleText,
    this.showTitle = true,
    this.isRequired = false,
    this.hintText,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.titleFontWeight,
    this.selectedValue,
    this.dropdownMenuItems,
    this.prefixIcon
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon:widget.prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: AppColors.grey,
                  width: .5
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: AppColors.grey,
                  width: .5
              )
          ),
        filled: true,
        fillColor:Colors.white
      ),
      hint: Text(widget.hintText ?? 'একটি বিকল্প নির্বাচন করুন'),

      value: widget.selectedValue,
      items: (widget.dropdownMenuItems ??
              widget.items
                  ?.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList()) ??
          [
            const DropdownMenuItem<String>(
              value: null,
              child: Text('কোন তথ্য নেই'),
            ),
          ],
      validator: widget.validator ??
          (value) {
            if (value == null) {
              return 'একটি বিকল্প নির্বাচন করুন';
            }
            return null;
          },
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
     /* buttonStyleData:   ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData:   IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary, size: 25),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusFive),
        ),
      ),
      menuItemStyleData:   MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),*/
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      borderSide: BorderSide.none,
    );
  }
}
