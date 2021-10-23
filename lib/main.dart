import 'package:flutter/material.dart';
import 'package:test/models/channels.dart';
import 'package:test/models/people.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  List<bool> hoverdPersons = [];
  bool homeHoverd = false;
  bool addHoverd = false;
  bool browseHoverd = false;
  int activeChannelId = 0;
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    Container avatarCreator(IconData icon, int i, String displayName, int id) {
      hoverdPersons.add(false);
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InkWell(
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: id == activeChannelId
                    ? BorderRadius.circular(10)
                    : hoverdPersons[i]
                        ? BorderRadius.circular(10)
                        : BorderRadius.circular(50),
                color: id == activeChannelId ? Colors.blue : Colors.green,
              ),
              child: Tooltip(
                message: displayName,
                preferBelow: true,
                verticalOffset: 15,
                child: Icon(
                  icon,
                  size: 25,
                ),
              ),
            ),
          ),
          onTap: () {
            setState(() {
              activeChannelId = i;
            });
          },
          onHover: (val) {
            setState(() {
              hoverdPersons[i] = val;
            });
          },
        ),
      );
    }

    Container homeCreator() {
      hoverdPersons.add(false);
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InkWell(
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: homeHoverd
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(50),
                color: Colors.green,
              ),
              child: Tooltip(
                message: "Home",
                preferBelow: true,
                verticalOffset: 15,
                child: Icon(
                  Icons.home,
                  size: 25,
                ),
              ),
            ),
          ),
          onTap: () {},
          onHover: (val) {
            setState(() {
              homeHoverd = val;
            });
          },
        ),
      );
    }

    Container addCreator() {
      hoverdPersons.add(false);
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InkWell(
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: addHoverd
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(50),
                color: Colors.green,
              ),
              child: Tooltip(
                message: "Add someone",
                preferBelow: true,
                verticalOffset: 15,
                child: Icon(
                  Icons.add,
                  size: 25,
                ),
              ),
            ),
          ),
          onTap: () {},
          onHover: (val) {
            setState(() {
              addHoverd = val;
            });
          },
        ),
      );
    }

    Container browseCreator() {
      hoverdPersons.add(false);
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InkWell(
          child: AnimatedContainer(
            duration: Duration(seconds: 5),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: browseHoverd
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(50),
                color: Colors.green,
              ),
              child: Tooltip(
                message: "Browse online",
                preferBelow: true,
                verticalOffset: 15,
                child: Icon(
                  Icons.public,
                  size: 25,
                ),
              ),
            ),
          ),
          onTap: () {},
          onHover: (val) {
            setState(() {
              browseHoverd = val;
            });
          },
        ),
      );
    }

    Container channelBuilder(Channel channel) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        child: Row(
          children: [
            Text(
              "# ",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Icon(channel.icon, color: Colors.white),
            Text(" "),
            Text(
              channel.name,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );
    }

    // Right part of the navbar
    Container rightnav = Container(
      decoration: BoxDecoration(color: Color(0xff2f3136)),
      height: maxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13.5),
            child: Text(people[activeChannelId].username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                )),
          ),
          Divider(
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: (maxWidth * 0.3 > 360 ? 360 : maxWidth * 0.3) - 65,
              height: maxHeight - 80,
              child: ListView(children: [
                for (int i = 0; i < channels.length; i++)
                  channelBuilder(channels[i])
              ]),
            ),
          ),
        ],
      ),
    );

    // Left part of the navbar
    Container leftnav = Container(
      decoration: BoxDecoration(
        color: Color(0xff202225),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      child: SizedBox(
        height: maxHeight,
        width: 65,
        child: ListView(
          shrinkWrap: true,
          children: [
            homeCreator(),
            Divider(
              color: Colors.white,
              indent: 10,
              endIndent: 10,
            ),
            for (int i = 0; i < people.length; i++)
              avatarCreator(people[i].pic, i, people[i].username, people[i].id),
            Divider(
              color: Colors.white,
              indent: 10,
              endIndent: 10,
            ),
            addCreator(),
            browseCreator(),
          ],
        ),
      ),
    );

    // Full left navbar container
    Container navbar = Container(
      width: maxWidth * 0.3 > 360 ? 360 : maxWidth * 0.3,
      child: Row(
        children: [
          leftnav,
          Expanded(child: rightnav),
        ],
      ),
    );

    return Scaffold(
      body: Row(
        children: [
          navbar,
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xff36393f)),
              child: Center(),
            ),
          ),
        ],
      ),
    );
  }
}
