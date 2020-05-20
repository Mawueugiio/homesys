import 'package:beta_project/core/globals.dart';
import 'package:beta_project/data/models/member.dart';
import 'package:beta_project/presentation/widget/buttons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class RecentVisitor extends StatefulWidget {
  final Visitor person;

  const RecentVisitor({Key key, this.person}) : super(key: key);

  @override
  _RecentVisitorState createState() => _RecentVisitorState();
}

class _RecentVisitorState extends State<RecentVisitor> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final kColor = themeData.brightness == Brightness.light ? kBlack : kWhite;
    final kTextColor = widget.person.isAllowed
        ? kColor
        : widget.person.isWaiting ? kColor : themeData.accentColor.withOpacity(kMidOpacity);

    return ListTile(
      isThreeLine: widget.person.entryTime != 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: kSpacingSmall),
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Permission required"),
            content:
                Text("Do you wish to allow entry for ${widget.person.name}?"),
            actions: [
              ButtonClear(
                  text: "Allow",
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    // Update state of member
                    if (mounted) {
                      setState(() {
                        widget.person.isWaiting = false;
                        widget.person.isAllowed = true;
                      });
                    }
                  },
                  themeData: themeData),
              ButtonClear(
                  text: "Decline",
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    if (mounted) {
                      setState(() {
                        widget.person.isWaiting = false;
                        widget.person.isAllowed = false;
                      });
                    }
                  },
                  themeData: themeData),
            ],
          ),
        );
      },
      title: Text(
        widget.person.name,
        style: TextStyle(
          color: kTextColor,
          decoration: widget.person.isAllowed
              ? TextDecoration.none
              : widget.person.isWaiting
                  ? TextDecoration.none
                  : TextDecoration.lineThrough,
        ),
      ),
      subtitle: Text(
        formatTimestampAgo(widget.person.entryTime),
        style: TextStyle(color: kTextColor),
      ),
      key: Key(widget.person.name),
      trailing: widget.person.isWaiting
          ? IconButton(
              icon: Icon(EvaIcons.trash2Outline),
              onPressed: () {
                if (mounted) {
                  setState(() {
                    widget.person.isWaiting = false;
                    widget.person.isAllowed = false;
                  });
                }
              },
            )
          : SizedBox.shrink(),
      leading: Container(
        height: kAvatarSize,
        width: kAvatarSize,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: widget.person.avatar,
            fit: BoxFit.cover,
            placeholder: (_, __) => Container(
                color: themeData.accentColor.withOpacity(kMidOpacity)),
          ),
        ),
      ),
    );
  }
}
