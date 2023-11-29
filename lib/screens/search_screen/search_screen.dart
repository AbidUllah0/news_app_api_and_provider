import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nows_app_udemy/screens/search_screen/components/empty_news_widget.dart';
import 'package:nows_app_udemy/utils/app_bar_color_getter.dart';
import 'package:nows_app_udemy/utils/app_images.dart';
import 'package:nows_app_udemy/widgets/custom_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (mounted) {
      _searchController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  List<String> searchKeyword = [
    'Football',
    'Flutter',
    'Python',
    'Weather',
    'Crypto',
    'Bitcoin',
    'Youtube',
    'Netflix',
    'Meta',
  ];

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();

              ///same as focusNode.unfocus();
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(IconlyLight.arrowLeft2),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Flexible(
                        child: TextFormField(
                          focusNode: focusNode,
                          textInputAction: TextInputAction.search,
                          autofocus: true,
                          controller: _searchController,
                          onEditingComplete: () {},
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            suffixIcon: IconButton(
                              onPressed: () {
                                _searchController.clear();

                                ///when clear the text , keyboard disappear
                                focusNode.unfocus();
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  itemCount: searchKeyword.length,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    mainAxisExtent: 40,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: color),
                      ),
                      child: Center(
                        child: CustomText(
                          text: searchKeyword[index],
                        ),
                      ),
                    );
                  },
                ),
                EmptyNewsWidget(
                    text: 'Ops! No result found', img: AppImages.search),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
