
                import 'transaction_remote_data_source.dart';

                class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {

                  const TransactionRemoteDataSourceImpl();

                  Future<T> _run<T>(Future<T> Function() function) async {
                    try {
                      return await function();
                    } catch (e) {
                      throw e;
                    }
                  }
                }