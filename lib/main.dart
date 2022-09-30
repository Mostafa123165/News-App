import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/BlockOpserver/BlocOpserver.dart';
import 'package:newsapp/lay-out/block/block.dart';
import 'package:newsapp/lay-out/block/states.dart';
import 'package:newsapp/lay-out/home-screen/home-screen.dart';
import 'package:newsapp/modules/splash_view/splash-screen.dart';
import 'package:newsapp/shared/network/loacl.dart';
import 'package:newsapp/shared/network/remote.dart';
import 'package:newsapp/shared/style/themes/theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized() ;
  DioHelper.init() ;
  await CashHelper.init() ;
  Bloc.observer = MyBlocObserver();
  bool?isDark = CashHelper.getData(key: 'isDark');
  runApp(MyApp(isDark)) ;
}

class MyApp extends StatelessWidget {
   bool? isDark ;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create:(_)=>NewsCubit()..getDateBusiness()..getDateSports()..getDateSciences()..changeModeApp(fromShared: isDark)
        ),
      ],
      child: BlocConsumer<NewsCubit,MainState>(
        listener: (context, state){},
        builder: (context, state){
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkThem(),
            home: SplashScreen(),
            themeMode:NewsCubit.get(context).isDark == true ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}
