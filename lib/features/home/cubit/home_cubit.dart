
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prove_metro_app_main/shared/models/member.dart';
import 'package:prove_metro_app_main/shared/repository/member_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required MemberRepository memberRepository,
  })  : _memberRepository = memberRepository,
        super(HomeState(
          member: Member(id: 0, dni: '', lastNames: '', name: '')
        )) {

     init();
  }
  
  final MemberRepository _memberRepository;

  void init() async {
    try {
      final member = await _memberRepository.getMemberById(1);
      
      emit(state.copyWith(
        member: member
      ));
    } catch (err) {
      print('error getting member');
    }
  }

  void setTab(HomeTab tab) => emit(state.copyWith(tab: tab));
}