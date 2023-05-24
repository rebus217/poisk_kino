abstract class AbstractAuthRepository {
  register(String email, String password);
  login(String email, String password);
  logout();
}
