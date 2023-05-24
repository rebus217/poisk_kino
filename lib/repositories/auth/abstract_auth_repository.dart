abstract class AbstractAuthRepository {
  signup(String email, String password);
  login(String email, String password);
  logout();
}
