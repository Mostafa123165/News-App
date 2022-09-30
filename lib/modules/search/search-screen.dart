import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/lay-out/block/block.dart';
import 'package:newsapp/lay-out/block/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchText = TextEditingController();

    return BlocConsumer<NewsCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Search',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getDataSearch(text: value);
                    print(value);
                  },
                  keyboardType: TextInputType.name,
                  controller: searchText,
                  decoration: InputDecoration(
                    hintText: "Search",
                  ),
                ),
                if (state is GetDataSearchLoadingState)
                  const SizedBox(
                    height: 10,
                  ),
                if (state is GetDataSearchLoadingState)
                  const LinearProgressIndicator(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => itemBuilder(
                        context, NewsCubit.get(context).search[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                    itemCount: NewsCubit.get(context).search.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
