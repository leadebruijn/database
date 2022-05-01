import 'package:flutter/material.dart';
import 'package:database/request.dart';
import 'package:database/user.dart';

class HomePage extends StatelessWidget {


  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder<List<User>?>(
        future: getUser(),
        builder: (BuildContext context, AsyncSnapshot<List<User>?> snapshot) {
          if (snapshot.hasData) {
            List<User>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (User post) => ListTile(
                      title: Text(post.name),
                      subtitle: Text("${post.number}"),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
