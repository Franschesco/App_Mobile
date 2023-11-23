import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:white_app/business/chargement/bloc/chargement_bloc.dart';
import 'package:white_app/business/chargement/bloc/chargement_event.dart';
import 'package:white_app/business/chargement/model/chargement_state.dart';
import 'package:white_app/business/navigation/bloc/navigation_bloc.dart';
import 'package:white_app/business/navigation/bloc/navigation_event.dart';
import 'package:white_app/business/navigation/model/routes.dart';

class ChargementPage extends StatefulWidget {
  const ChargementPage({
    super.key,
  });

  @override
  State<ChargementPage> createState() => _ChargementPageState();
}

class _ChargementPageState extends State<ChargementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChargementBloc, ChargementState>(
        builder: (context, state) {
          if (!state.isloaded) {
            BlocProvider.of<ChargementBloc>(context)
                .add(const ChargementEventFetch());
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SpinKitThreeBounce(
                    color: Colors.blue,
                    size: 70,
                  ),
                ),
                SizedBox(height: 20), // Espace entre le spinner et le texte
                Text(
                  "Loading",
                  style: TextStyle(
                    fontSize:
                        16, // Personnalisez la taille de la police selon vos préférences
                    color: Colors.black,
                  ),
                ),
              ],
            );
          } else {
            BlocProvider.of<NavigationBloc>(context).add(
              const NavigationEventAdd(Routes.accueil),
            );
            return Container();
          }
        },
      ),
    );
  }
}
