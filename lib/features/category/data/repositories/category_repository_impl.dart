
                import '../../domain/repositories/category_repository.dart';

                class CategoryRepositoryImpl implements CategoryRepository {
                    const CategoryRepositoryImpl();

                    Future<T> _run<T>(Future<T> Function() function) async {
                        try {
                            return await function();
                        } catch (e) {
                            throw e;
                        }
                    }
                }