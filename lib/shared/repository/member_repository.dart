import 'package:prove_metro_app_main/shared/models/member.dart';
import 'package:prove_metro_app_main/shared/services/member_service.dart';

class MemberRepository {
  MemberRepository({
    required MemberService memberService
  }) : _memberService = memberService;

  final MemberService _memberService;

  Future<Member> getMemberById(int id) async {
     try {

      final member = await _memberService.getMemberById(id);

      return member;
     } catch (err) {
      throw Exception('error fetching member by id');
     }
  }
}