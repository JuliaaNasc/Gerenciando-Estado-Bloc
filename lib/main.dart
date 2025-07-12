import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_estado_bloc/Bloc/user_bloc.dart';

void main() {
  runApp(MaterialApp(home: MyAppBloc()));
}

class MyAppBloc extends StatelessWidget {
  const MyAppBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My App With Bloc',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: BlocProvider(
        create: (context) => UserBloc(),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<UserBloc>().add(
                          LoadUser(userId: '123', userName: 'Julia'),
                        );
                  },
                  child: Text('Login'),
                ),
              );
            }

            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Id Usuário: ${state.userId}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 17),
                    Text(
                      'Nome: ${state.userName}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(
                              LoadUser(userId: '456', userName: 'Ana'),
                            );
                      },
                      child: Text('Mudar Valor'),
                    ),
                  ],
                ),
              );
            }

            return const Center(child: Text('Estado desconhecido'));
          },
        ),
      ),
    );
  }
}
