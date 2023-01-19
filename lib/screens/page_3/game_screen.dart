import 'package:flutter/material.dart';
import 'package:lear_second_fetch_bloc/models/models_export.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lear_second_fetch_bloc/screens/export_screen.dart';
import '../../blocs/export_bloc.dart';
import '../../widgets/my_drawer.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  static const id = "game_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30, //change size on your need
          color: Colors.white, //change color on your need
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataLoadingState) {
            context.read<GameDataBloc>().add(GameDataLoadEvent());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataLoadedState) {
            List<GameModel> gameList = state.game_data;
            return buildGameModel(gameList);
          } else if (state is GameDataErrorState) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}

Widget buildGameModel(List<GameModel> apiResult) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: apiResult.length,
    itemBuilder: (BuildContext context, int index) {
      final GameModel dataModel = apiResult[index];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailGame(dataModel: dataModel),
              ),
            );
          },
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    height: 230,
                    width: MediaQuery.of(context).size.width / 1.05,
                    fit: BoxFit.cover,
                    image: NetworkImage(dataModel.image),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width / 1.05,
                    height: 120,
                    border: 0,
                    borderRadius: 0,
                    blur: 20,
                    alignment: Alignment.bottomCenter,
                    linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.1),
                        const Color(0xFFFFFFFF).withOpacity(0.05),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              dataModel.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Platforms: ${dataModel.platforms}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
