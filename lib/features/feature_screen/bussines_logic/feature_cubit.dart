import 'package:bloc/bloc.dart';
import 'package:education_app/features/feature_screen/bussines_logic/feature_state.dart';
import 'package:education_app/features/feature_screen/data/model/home_model.dart';
import 'package:education_app/features/feature_screen/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureCubit extends Cubit<FeatureState<HomeDataModel>> {
  HomeRepository homeRepository;

  FeatureCubit(this.homeRepository) : super(Idle());

  static FeatureCubit get(context) => BlocProvider.of(context);

  getHomeData({
    required String token,
  }) async {
    emit(FeatureState.loading());
    var data = await homeRepository.getHomeData(token);
    print("heeeeer11");
    data.when(
      success: (data) {
        print(data);
        print("heeeeer");
        emit(FeatureState.success(data));
        return data;
      },
      failure: (networkExceptions) {
        print("heeeeer222");
        emit(FeatureState.error(networkExceptions));
      },
    );
  }
}
