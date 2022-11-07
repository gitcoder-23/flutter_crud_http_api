import 'package:flutter/material.dart';
import 'package:flutter_crud_http_api/controller/todoController.dart';
import 'package:flutter_crud_http_api/models/todoModel.dart';
import 'package:flutter_crud_http_api/repository/todoRepository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // dependency injection
    var todoController = TodoController(TodoRepository());
    // Test fetch todo
    // todoController.fetchTodoList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: ((context, snapshot) {
          //
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index) {
                var todoData = snapshot.data?[index];

                // print('todoData-> $todoData');
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text('${todoData?.id}'),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text('${todoData?.title}'),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // add onTap
                              InkWell(
                                  onTap: () {
                                    // Add the Method

                                    // first make repository and todo repository then controller
                                    todoController
                                        .updatePatchCompleted(todoData!)
                                        .then((value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          content: Text(value),
                                        ),
                                      );
                                    });
                                  },
                                  child: buildCallContainer(
                                      'Patch', Colors.orange[600]!)),

                              InkWell(
                                  child: buildCallContainer(
                                      'Put', Colors.purple[600]!)),
                              InkWell(
                                  child: buildCallContainer(
                                      'Delete', Colors.red[600]!)),
                            ]),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        }),
      ),
    );
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 50,
      height: 40,
      // margin: const EdgeInsets.symmetric(horizontal: 3.0),
      decoration: BoxDecoration(
        // color: Colors.orange,
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      )),
    );
  }
}
