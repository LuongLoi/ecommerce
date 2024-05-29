package luongloi.com.ecommerce.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import jakarta.validation.Valid;
import luongloi.com.ecommerce.domain.User;


@Controller
public class UserController {

    @GetMapping("/")
    public String getHello() {
        return "client/hello";
    }

    @GetMapping("/admin/user/create")
    public String getUserManagerPage(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String postMethodName(@Valid @ModelAttribute("user") User user,
                            Model model, BindingResult result) {
        //TODO: process POST request
        if (result.hasErrors()) {
            return "error";
        }
        System.out.println(user.toString());
        return "redirect:/";
    }
    

}
