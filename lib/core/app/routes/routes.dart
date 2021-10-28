import 'package:e_learn/core/app/bloc/app_state.dart';
import 'package:e_learn/features/app_content/presentation/homepage.dart';
import 'package:flutter/material.dart';
import 'package:e_learn/features/user/presentation/pages/login.dart';

List<Page> onGenerateViewPages(AppStatus state, List<Page<dynamic>> pages )
{
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [Login.page()];
  }
}