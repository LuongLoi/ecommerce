package luongloi.com.ecommerce.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import luongloi.com.ecommerce.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
    User save(User user);
}
