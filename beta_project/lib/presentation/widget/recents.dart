import 'package:beta_project/core/globals.dart';
import 'package:beta_project/data/models/member.dart';
import 'package:beta_project/presentation/widget/snackbars.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class RecentVisitor extends StatelessWidget {
  final Visitor person;

  const RecentVisitor({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListTile(
      isThreeLine: person.entryTime != 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: kSpacingSmall),
      onTap: () {
        // FIXME: Add contact functionality
        Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(ErrorSnackBar("No action available"));
      },
      title: Text(person.name),
      subtitle: Text(person.relation),
      key: Key(person.name),
      trailing: IconButton(
        icon: Icon(EvaIcons.phoneOutline),
        onPressed: () {
          // FIXME: Add call functionality
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SuccessSnackBar("Cannot perform call action"));
        },
      ),
      leading: Container(
        height: kAvatarSize,
        width: kAvatarSize,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: person.avatar,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(
                color: themeData.accentColor.withOpacity(kMidOpacity)),
          ),
        ),
      ),
    );
  }
}
