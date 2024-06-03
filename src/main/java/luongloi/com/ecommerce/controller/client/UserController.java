package luongloi.com.ecommerce.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import luongloi.com.ecommerce.domain.User;
import luongloi.com.ecommerce.service.UserService;


@Controller
public class UserController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder; 

    public UserController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHello() {
        return "client/hello";
    }

    @GetMapping("/admin/user/create")
    public String getUserManagerPage(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    // Thứ tự tham số là quan trọng, BindingResult ở trước Model 
    @PostMapping("/admin/user/create")
    public String postMethodName(@ModelAttribute("user") @Valid User user,
                             BindingResult bindingResult, Model model) {
        //TODO: process POST request
        if (bindingResult.hasErrors()) {
            List<FieldError> errors = bindingResult.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println(">>>> Check validation: " + error.getField() + " - " + error.getDefaultMessage());
            }
            return "admin/user/create";
        }
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        
        // System.out.println(user.toString());
        // this.userService.saveUser(user);
        return "redirect:/";
    }
    

}
