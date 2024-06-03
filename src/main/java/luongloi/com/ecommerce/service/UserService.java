package luongloi.com.ecommerce.service;

import org.springframework.stereotype.Service;

import luongloi.com.ecommerce.domain.User;
import luongloi.com.ecommerce.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User saveUser(User user) {
        User newUser = this.userRepository.save(user);
        return newUser;
    }
}
