import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prove_metro_app_main/core/constants/image_constant.dart';
import 'package:prove_metro_app_main/core/constants/text_constant.dart';
import 'package:prove_metro_app_main/features/activities/view/activities_list_page.dart';
import 'package:prove_metro_app_main/features/home/cubit/home_cubit.dart';
import 'package:prove_metro_app_main/features/home/widgets/widgets.dart';
import 'package:prove_metro_app_main/features/user_activities/view/user_activities_page.dart';
import 'package:prove_metro_app_main/shared/repository/member_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            memberRepository: context.read<MemberRepository>())
          ),
      ],
      child: HomeView()
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);
    final currentMember = context.select((HomeCubit cubit) => cubit.state.member);
    
    return Scaffold(
      appBar: AppBar(
        title: HomeBarTitle(
          title: currentMember.fullName,
          image: ImageConstant.logoAlt
        )
      ),
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          ActivitiesListPage(),
          UserActivitiesPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.read<HomeCubit>().state.tab.index,
        onTap: (int index) => context.read<HomeCubit>()
          .setTab(index == 0 ? HomeTab.activities : HomeTab.inscriptions),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: selectedTab.index == 0
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary
            ),
            label: TextConstant.bottomNavigationBarItem0
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: selectedTab.index == 1
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.primary
            ),
            label: TextConstant.bottomNavigationBarItem1
          ),
        ]),
    );
  }
}