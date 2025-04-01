part of 'home_cubit.dart';

enum HomeTab { activities, inscriptions }

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.activities,
    required this.member,
  });

  final HomeTab tab;
  final Member member;

  HomeState copyWith({
    HomeTab? tab,
    Member? member
  }) {
    return HomeState(
      tab: tab ?? this.tab,
      member: member ?? this.member,
    );
  }

  @override
  List<Object> get props => [tab, member];
}