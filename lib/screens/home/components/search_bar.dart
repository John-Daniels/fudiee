import 'package:flutter/material.dart';
import 'package:fudiee/constants/assets_constant.dart';
import 'package:fudiee/themes/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: primaryColor.withOpacity(0.3),
            width: 0.8,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        hintText: 'Search, -> Grilled chicken -> Pizza',
        suffixIcon: Image.asset(Assets.searchIcon),
      ),
    );
  }
}
