package com.example.lanqiao0327ssm.controller;
import com.example.lanqiao0327ssm.pojo.User;
import com.example.lanqiao0327ssm.service.ShoppingCartService;
import com.example.lanqiao0327ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    ShoppingCartService shoppingCartService;

    @RequestMapping("userlist")
    public String testall(Model model) {
        System.out.println(111);
//       调用业务层   获取所有用户   发送给前端html
        List<User> allUsers = userService.getAllUsers();
        model.addAttribute("users", allUsers);
        return "userlist";
    }

    @GetMapping("login")
    public String gologin() {
//        跳转到登录页
        return "login";
    }


    @PostMapping("login")
    public String login(User user, HttpSession session, Model model) {
        System.out.println(user);
        User one = userService.checkUser(user);
//        登录时获取用户信息  并让所有页面可以访问
//        session   会话   和model很像   里面可以放数据供前端使用
//        session全部页面都可以使用且可以多次使用  控制层也可以用
//        model只有下一个页面可以使用且只能使用一次
        if (one != null) {
            session.setAttribute("user", one);
            int num = shoppingCartService.getNumByUser(one.getId());
            session.setAttribute("cartNum", num);
            return "redirect:/userPages";
        } else {
            model.addAttribute("loginfail", true);
            return "login";
        }
    }

//          注册
    @GetMapping("register")
    public String goregister() {
//        跳转到登录页
        return "register";
    }

    @PostMapping("register")
    public String goregister(User user) {
        System.out.println(user);
        boolean a = userService.insertUser(user);
        if (a == true) {
            return "login";
        } else {
            return "register";
        }
    }

    @GetMapping("checkUsername")
    @ResponseBody
    public boolean checkUsername(String username) {
        return userService.checkUsername(username);
    }


//    退出
    @RequestMapping("logOut")
    public String logOut(HttpSession session, Model model) {
//        invalidate清楚seesion里面的所有信息
        session.invalidate();
//        removeAttribute根据名字删除一个名字
//        session.removeAttribute("");
        model.addAttribute("logoutuser", true);
        return "forward:/userPages";
    }
}
