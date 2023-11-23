import 'package:equatable/equatable.dart';

class ChargementState extends Equatable {
  const ChargementState({required this.isloaded});

  final bool isloaded;

  factory ChargementState.initial() => const ChargementState(isloaded: false);

  copyWith({bool? newIsloaded}) {
    return ChargementState(
      isloaded: newIsloaded ?? isloaded,
    );
  }

  @override
  List<Object> get props => [isloaded];
}
