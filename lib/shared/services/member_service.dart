import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:prove_metro_app_main/core/constants/api_constant.dart';
import 'package:prove_metro_app_main/shared/models/member.dart';

class MemberService {
  String baseApi = 'resources/response_calls';

  Future<List<Member>> getAllMembers() async {
    try {
      String response = await rootBundle.loadString(ApiConstant.getMembers);
      final List<dynamic> data = json.decode(response);
      final List<Member> members = data.map((member) => Member.fromJson(member)).toList();

      return members;
    } catch (e) {
      throw Exception('error loading members');
    }
  }

  Future<Member> getMemberById(int id) async {
    try {
      final List<Member> membersList = await getAllMembers();
      final Member memberFound = membersList.firstWhere((member) => member.id == id);

      return memberFound;

    } catch (err) {
      throw Exception('error finding member by id');
    }
  }
}