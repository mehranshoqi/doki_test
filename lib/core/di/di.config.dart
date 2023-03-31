// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/user/data/datasource/data_source.dart' as _i5;
import '../../features/user/data/datasource/data_source_impl.dart' as _i6;
import '../../features/user/data/repository/repository_impl.dart' as _i8;
import '../../features/user/domain/repository/repository.dart' as _i7;
import '../../features/user/domain/usecases/get_user.dart' as _i10;
import '../../features/user/domain/usecases/get_users.dart' as _i11;
import '../../features/user/domain/usecases/login.dart' as _i12;
import '../error/error_translator.dart' as _i3;
import '../navigation/navigations.dart' as _i4;
import '../service/users.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ErrorTranslator>(() => _i3.ErrorTranslator());
  gh.lazySingleton<_i4.Navigations>(() => _i4.Navigations());
  gh.lazySingleton<_i5.UserDataSource>(() => _i6.UserDataSourceIMPL());
  gh.lazySingleton<_i7.UserRepository>(
      () => _i8.UserRepositoryIMPL(get<_i5.UserDataSource>()));
  gh.factory<_i9.UsersService>(() => _i9.UsersService());
  gh.lazySingleton<_i10.GetUser>(() => _i10.GetUser(get<_i7.UserRepository>()));
  gh.lazySingleton<_i11.GetUsers>(
      () => _i11.GetUsers(get<_i7.UserRepository>()));
  gh.lazySingleton<_i12.Login>(() => _i12.Login(get<_i7.UserRepository>()));
  return get;
}
