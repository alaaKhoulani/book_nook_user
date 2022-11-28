
import 'package:book_nook_user/ui/Screens/search_user/sates.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../consts/constant.dart';
import '../../../consts/myColors.dart';
import '../../../translate/locale_keys.g.dart';
import 'cubit.dart';
import 'start_search_screen.dart';

class SearchHomeScreenUser extends StatelessWidget {
  // const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(85.0),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                flexibleSpace: buildSearchField(context, false),
              ),
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SearchCubit.get(context).isSearched
                    ? buildCharactersList(
                        context, SearchCubit.get(context).searchedBook)
                    : buildScreen(context),
              ),
            ),
          );
        });
  }
}

Widget buildScreen(context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.recent.tr(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              child: Text(LocaleKeys.clearAll.tr(),
                  style: TextStyle(color: MyColors.myPurble)),
              onPressed: () {
                SearchCubit.get(context).clearAll();
              },
            )
          ],
        ),
        Wrap(
          spacing: 15.0,
          runSpacing: 10.0,
          children: SearchCubit.get(context)
              .recent
              .map((title) => searchWidget(title, context, false))
              .toList(),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          LocaleKeys.topSearchedBooks.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        Wrap(
          spacing: 15.0,
          runSpacing: 10.0,
          children: SearchCubit.get(context)
              .booksFromApi
              .map((val) => searchWidget(val['name'], context, true))
              .toList(),
        ),
      ],
    ),
  );
}

Widget searchWidget(String tit, context, istop) {
  return Container(
    // margin: const EdgeInsets.symmetric(vertical: 1),
    //padding: const EdgeInsets.symmetric(horizontal: 20),
    padding: istop ? null : EdgeInsets.fromLTRB(0, 0, 10, 0),
    decoration: BoxDecoration(
      color: MyColors.myGrey,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: istop
        ? Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(tit, style: TextStyle(fontSize: 11)),
              ],
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(tit, style: TextStyle(fontSize: 10)),
              IconButton(
                onPressed: () {
                  SearchCubit.get(context).delete(tit);
                },
                icon: Icon(Icons.clear, size: 15),
              )
            ],
          ),
  );
}

Widget buildTopBook(item) {
  return Container(
    width: 150,
    child: ListTile(
      dense: true,
      onTap: () {}, //navigate to details screen
      leading: Image.asset(item['photo']),
      title: Text(item['title']),

      subtitle: Text(item['author']),
    ),
  );
}

Widget showLoadingIndicator() {
  return Center(
      child: CircularProgressIndicator(
    color: MyColors.myPurble,
  ));
}

final searchTextController = TextEditingController();
Widget buildSearchField(context, doing) {
  // SearchCubit.get(context).isSearched = doing;
  print("is searched${SearchCubit.get(context).isSearched}");
  return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      height: 50,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: MyColors.myBlack.withOpacity(0.3),
                blurRadius: 50,
                offset: Offset(0, 7)),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              cursorColor: MyColors.myPurble,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: MyColors.myPurble),
                  hintText: LocaleKeys.search.tr(),
                  hintStyle: p2.copyWith(color: MyColors.myBlack),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
              autofocus: false,
              onChanged: (val) {
                SearchCubit.get(context).addToSearchedList(val);
              },
              // enabled:false,
              onTap: () {
                SearchCubit.get(context).startSearching();
              },
              onSubmitted: (val) {
                SearchCubit.get(context).sendSearchtoApi(bookname: val);
              },
            ),
          ),
          SearchCubit.get(context).isSearched
              ? IconButton(
                  onPressed: () {
                    SearchCubit.get(context).stopSearching();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: MyColors.myPurble,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    SearchCubit.get(context).getRecentApi();
                    SearchCubit.get(context).getTopBooksApi();
                  },
                  icon: Icon(
                    Icons.send,
                    color: MyColors.myPurble,
                  ),
                )
        ],
      ));
}
