import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = ["Top", "Users", "Videos", "Sounds", "LIVE", "Shopping", "Brands"];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial text");

  void _onSearchChanged(String value) {
    print("Searching from $value");
  }

  void _onSearchSubmitted(String value) {
    print("Submitted $value");
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: Sizes.size16),
            unselectedLabelColor: Colors.grey.shade500,
            splashFactory: NoSplash.splashFactory,
            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
                padding: const EdgeInsets.all(Sizes.size6),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: Sizes.size10,
                    crossAxisCount: 2,
                    crossAxisSpacing: Sizes.size10,
                    childAspectRatio: 9 / 22),
                itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.size4)),
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder: "assets/images/image1.jpeg",
                                image:
                                    "https://images.unsplash.com/photo-1661956602868-6ae368943878?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"),
                          ),
                        ),
                        Gaps.v10,
                        const Text(
                          "This is a ver ong caption for my tiktok that im upload just now currently.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: Sizes.size16 + Sizes.size2,
                              fontWeight: FontWeight.bold),
                        ),
                        Gaps.v8,
                        DefaultTextStyle(
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 12,
                                foregroundImage: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/36876250?s=48&v=4"),
                              ),
                              Gaps.h4,
                              const Expanded(
                                  child: Text(
                                "My avatar is going to be very long",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                              Gaps.v4,
                              FaIcon(FontAwesomeIcons.heart,
                                  size: Sizes.size16,
                                  color: Colors.grey.shade600),
                              Gaps.h2,
                              const Text(
                                "2.5M",
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
            for (var tab in tabs.skip(1))
              Center(
                  child:
                      Text(tab, style: const TextStyle(fontSize: Sizes.size28)))
          ],
        ),
      ),
    );
  }
}
