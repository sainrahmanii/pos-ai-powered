
                import '../../domain/repositories/transaction_repository.dart';

                class TransactionRepositoryImpl implements TransactionRepository {
                    const TransactionRepositoryImpl();

                    Future<T> _run<T>(Future<T> Function() function) async {
                        try {
                            return await function();
                        } catch (e) {
                            throw e;
                        }
                    }
                }