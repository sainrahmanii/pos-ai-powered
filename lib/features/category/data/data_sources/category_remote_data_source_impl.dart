
                import 'category_remote_data_source.dart';

                class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {

                  const CategoryRemoteDataSourceImpl();

                  Future<T> _run<T>(Future<T> Function() function) async {
                    try {
                      return await function();
                    } catch (e) {
                      throw e;
                    }
                  }
                }