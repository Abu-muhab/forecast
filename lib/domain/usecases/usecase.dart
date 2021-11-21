abstract class UseCase<Type, Params> {
  Future<Type> call({required Params params});
}
