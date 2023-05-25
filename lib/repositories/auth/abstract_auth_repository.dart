abstract class AbstractAuthRepository {
  signup(String email, String password, String fullName);
  login(String email, String password);
  logout();
}
