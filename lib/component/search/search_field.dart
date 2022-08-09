// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:best_design/controller/Api/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isDark = Theme.of(context).brightness == Brightness.dark;
    return GetBuilder<NewsController>(
      init: Get.find<NewsController>(),
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          onChanged: (value) {
            controller.searchList(value);
          },
          controller: controller.text,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey.shade400,
              ),
              suffixIcon: controller.text.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        controller.clearSearch();
                      },
                      icon: Icon(
                        Icons.clear,
                        color: _isDark ? Colors.white : Colors.black,
                      ))
                  : null,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: _isDark ? Colors.white : Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.orange)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ),
    );
  }
}
