import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/lay-out/block/block.dart';
import 'package:newsapp/lay-out/block/states.dart';
import 'package:newsapp/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , MainState>(
      listener: (context , state) {},
      builder: (context , state) {
        var cubit = NewsCubit.get(context) ;
        return ConditionalBuilder(
            condition: cubit.business.length > 0,
            builder: (context) =>
                ListView.separated(
                  physics:const BouncingScrollPhysics(),
                  itemBuilder: (context , index)=>itemBuilder(context ,cubit.business[index]),
                  separatorBuilder: (context , index)=> const SizedBox(
                    height: 10,
                  ),
                  itemCount: cubit.business.length,
                ),
            fallback: (context) => const Center(child: CircularProgressIndicator())
        ) ;
      },
    );
  }

}
