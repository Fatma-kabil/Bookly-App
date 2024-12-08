import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_reomte_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';

import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupServiceLocator() {
  getit.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getit.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeReomteDataSource:
          HomeReomteDataSourceImpl(apiService: getit.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));

  getit.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getit.get<ApiService>()),
  );
}
