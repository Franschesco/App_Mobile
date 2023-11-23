import 'package:equatable/equatable.dart';

class AcccueilState extends Equatable {
  const AcccueilState({required this.isloaded});

  final bool isloaded;

  factory AcccueilState.initial() => const AcccueilState(isloaded: false);

  copyWith({bool? newIsloaded}) {
    return AcccueilState(
      isloaded: newIsloaded ?? isloaded,
    );
  }

  @override
  List<Object> get props => [isloaded];
}
