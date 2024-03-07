import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

final TextEditingController commentController = TextEditingController();

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage("profile pic"),
                        ),
                        title: const Row(
                          children: [
                            Text(
                              "username",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Comments",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        subtitle: const Row(
                          children: [
                            Text(
                              'date',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '10 Likes',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                      );
                    })),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: TextFormField(
                controller: commentController,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red))),
              ),
              trailing: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Send',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
