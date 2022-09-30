import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/lay-out/block/states.dart';
import 'package:newsapp/modules/business/business-screen.dart';
import 'package:newsapp/modules/science/science-screen.dart';
import 'package:newsapp/modules/sports/sports-screen.dart';
import 'package:newsapp/shared/network/loacl.dart';
import 'package:newsapp/shared/network/remote.dart';

class NewsCubit extends Cubit<MainState> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndexInBottomNav = 0 ;

  List<Widget>screen = const [
     BusinessScreen(),
     SportsScreen(),
     ScienceScreen(),
  ];

  void changeBottomNav(int index){
    currentIndexInBottomNav = index ;
    emit(ChangeBottomNavState()) ;
  }
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> sciences = [];
  List<dynamic> search = [];

  void getDateBusiness(){
    DioHelper.getDate(
      methodUrl:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'business',
          'apiKey':'0e0ecc0a712a4410a7f390cec80f1951',
        },
      ).then((value) {
       value.data['articles'].forEach((value){
         if(value['urlToImage'] != null )
         business.add(value) ;
      });
      emit(GetDataBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetDataBusinessErrorState());
    });
  }
  void getDateSports(){
    DioHelper.getDate(
      methodUrl:'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'sports',
        'apiKey':'0e0ecc0a712a4410a7f390cec80f1951',
      },
    ).then((value) {
      value.data['articles'].forEach((value){
        if(value['urlToImage'] != null )
          sports.add(value) ;
      });
      emit(GetDataSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetDataSportsErrorState());
    });
  }
  void getDateSciences(){
    DioHelper.getDate(
      methodUrl:'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'science',
        'apiKey':'0e0ecc0a712a4410a7f390cec80f1951',
      },
    ).then((value) {
      value.data['articles'].forEach((value){
        if(value['urlToImage'] != null )
          sciences.add(value) ;
      });
      emit(GetDataScienceSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetDataScienceErrorState());
    });
  }

  void getDataSearch({
  required String text ,
}){
    search = [] ;
    emit(GetDataSearchLoadingState()) ;
    DioHelper.getDate(
      methodUrl:'v2/everything',
      query:{
        'q':'$text',
        'apiKey':'0e0ecc0a712a4410a7f390cec80f1951',
      },
    ).then((value) {
      value.data['articles'].forEach((value){
        if(value['urlToImage'] != null )
          search.add(value) ;
      });
      emit(GetDataSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetDataSearchErrorState());
    });
  }
  bool isDark = true  ;
  void changeModeApp({bool? fromShared}){
    if(fromShared == null){
      isDark = !isDark ;
    }
    else{
      isDark = fromShared ;
    }
    CashHelper.saveData(key: 'isDark', value: isDark).then((value){
      emit(ChangeAppModeState()) ;
    }).catchError((error){
      print(error.toString()) ;
    });

  }

}
