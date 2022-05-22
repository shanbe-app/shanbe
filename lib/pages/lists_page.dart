import 'package:client/shanbe_icons.dart';
import 'package:client/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListsPage extends StatefulWidget {
  const ListsPage({Key? key}) : super(key: key);

  @override
  _ListsPageState createState() => _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  AppLocalizations? t;

  @override
  Widget build(BuildContext context) {
    t ??= AppLocalizations.of(context);
    return Scaffold(
      key: widget.key ?? GlobalKey(debugLabel: 'lists'),
      body: CustomScrollView(
        primary: true,
        slivers: [
          // SliverAppBar(
          //   actions: [
          //     ElevatedButton(child: Text('edit'),onPressed: ,)
          //   ],
          //   title: Text('Lists'),
          //
          // ),
          CupertinoSliverNavigationBar(
            largeTitle: PlatformText(t!.lists),
            stretch: false,
            automaticallyImplyLeading: true,
            previousPageTitle: t!.today,
            trailing: PlatformIconButton(icon: const Icon(Shanbe.sliders),onPressed: (){
              Navigator.pushNamed(context, '/edit-lists');
            },),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: Constants.PAGE_PADDING,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: const CupertinoSearchTextField(
                placeholder: 'Search',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: Constants.PAGE_PADDING,
              child: Column(
                children: [
                  Text('Today'),
                  Text('All'),
                  Text('Completed'),
                  Text('Next 7 Days'),
                  Text('Inbox'),
                ],
              ),
            ),
          ),
          //  Projects
          //  Tags
        ],
      ),
    );
  }
}
