import 'package:book_nook_user/consts/constant.dart';
import 'package:book_nook_user/consts/myColors.dart';
import 'package:book_nook_user/services/storage/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'states.dart';

class AllLibrary extends StatefulWidget {
  @override
  State<AllLibrary> createState() => _AllLibraryState();
}

class _AllLibraryState extends State<AllLibrary> {
  //const AllLibrary({Key? key}) : super(key: key);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cubit = AllLibraryCubit.get(context);
    cubit.getData();
  }

  Widget buildList(cubit) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemCount: cubit.allLibApi.length,
        itemBuilder: (_, index) => builditem(cubit.allLibApi[index]));
  }

  Widget builditem(lib) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "libraryScreen",arguments:lib["id"] );
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: GridTile(
          
          child: lib["image"] == null
              ? Center(
                  child: Text(
                  "Kh",
                  style: TextStyle(fontSize: 80,color: MyColors.myPurble),
                ))
              : FadeInImage.assetNetwork(
                  fit: BoxFit.fill,
                  image: ("${Store.baseURL}/${lib["image"]}"),
                  // fit: BoxFit.cover,
                  placeholder: "assets/images/book1.png",
                ),
          footer: GridTileBar(
            
            title: Text(""),
            leading: Text(
              
              lib["library_name"],
              style: TextStyle(fontSize: 20, color: MyColors.myWhite),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(lib["status"],
                style: TextStyle(
                    fontSize: 15,
                    color:
                        lib['status'] == "online" ? Colors.green : Colors.red)),
            backgroundColor: MyColors.myPurble.withAlpha(100),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<AllLibraryCubit, AllLibraryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AllLibraryCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: MyColors.myWhite,
              title: Text(
                "All libraries",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: buildList(cubit),
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //     onPressed: () {
            //       cubit.getAllLibraryApi();
            //     },
            //     child: Icon(Icons.add)),
          );
        });
  }
}
