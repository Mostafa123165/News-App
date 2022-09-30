import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/lay-out/block/block.dart';
import 'package:newsapp/lay-out/block/states.dart';
import 'package:newsapp/modules/search/search-screen.dart';
import 'package:newsapp/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , MainState>(
      listener: (context , state) {},
      builder: (context , state) {
        var cubit = NewsCubit.get(context) ;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              'New App',
            ),
            actions: [
              IconButton(onPressed: (){
                navigator(context , const SearchScreen()) ;
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                cubit.changeModeApp();
              }, icon: Icon(Icons.dark_mode)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            currentIndex: cubit.currentIndexInBottomNav,
            items:const [
              BottomNavigationBarItem(
                  icon:Icon(
                    Icons.business,
                  ),
                  label: "business"
              ),
              BottomNavigationBarItem(
                  icon:Icon(
                    Icons.sports,
                  ),
                  label: "sports"
              ),
              BottomNavigationBarItem(
                  icon:Icon(
                    Icons.science,
                  ),
                  label: "science"
              ),
            ],
          ),
          body: cubit.screen[cubit.currentIndexInBottomNav],
        );
      },
    );
  }
}
