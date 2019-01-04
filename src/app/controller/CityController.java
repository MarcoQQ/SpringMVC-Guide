package app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
public class CityController {

    @RequestMapping(value = "/city")
    public String listcities(Model model){
        Map<String, String> capitals = new HashMap<String, String>();
        capitals.put("China","Beijing");
        capitals.put("Japan","Tokyo");
        capitals.put("Australia", "Canberra");
        model.addAttribute("capitals", capitals);

        Map<String, String[]>bigCities = new HashMap<String, String[]>();
        bigCities.put("China", new String[]{"Shanghai", "Hongkong"});
        bigCities.put("Japan", new String[]{"Kyoto"});
        bigCities.put("Australia", new String[]{"Melbourne", "Sydney"});
        model.addAttribute("bigCities", bigCities);

        return "Cities";
    }
}
