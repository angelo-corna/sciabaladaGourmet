package software.trentanove.sciabaladaGourmet.controllers;   

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import software.trentanove.sciabaladaGourmet.beans.Dinner;
import software.trentanove.sciabaladaGourmet.beans.Evaluations;
import software.trentanove.sciabaladaGourmet.dao.EvaluationsDao;  

@Controller  
public class EvaluationsController {  
    @Autowired  
    EvaluationsDao dao;//will inject dao from xml file  

    @Autowired  
    EvaluationsDao daoNamed;//will inject dao from xml file  

    
    @RequestMapping("/newDinner")  
    public String newDinner(Model m){  
    	m.addAttribute("command", new Dinner());
    	return "newDinner";  
    } 
    
    @RequestMapping(value="/saveDinner",method = RequestMethod.POST)  
    public String save(@ModelAttribute("dinner") Dinner dinner, @ModelAttribute("resturantList") Map<String, String> resturantList){  
    	
          
    	boolean dinnerAlreadyRegistered = daoNamed.checkDinner(dinner);
        String redirect = "";
        if (dinnerAlreadyRegistered) {
        	redirect = "redirect:/dinnerNotSaved/"+dinner.getDinnerDate(); 
        } else {
        	int dinnerId = daoNamed.insertDinner(dinner,resturantList);  
        	dao.insertDinnerParticipants(dinnerId, dinner.getParticipants());
        	redirect =  "redirect:/dinnerSaved/"+dinner.getDinnerDate();  
        }
        return redirect;
    }  
    
    @RequestMapping("/dinnerNotSaved/{dinnerDate}")  
    public String dinnerNotSaved(@PathVariable String dinnerDate, Model m){  
    	List<Dinner> dinnersByDateList = dao.getDinnerByDate(dinnerDate);  
        Dinner dinner = dinnersByDateList.get(0);
        List<String> dinnerParticipants = daoNamed.getDinnerParticipants(dinner);
        m.addAttribute("dinnerDate",dinnerDate);
        m.addAttribute("resturant",dinner.getResturant());
        m.addAttribute("city",dinner.getCity());
        m.addAttribute("participants",dinnerParticipants);
        return "dinnerNotSaved";  
    }  
    
    @RequestMapping("/dinnerSaved/{dinnerDate}")  
    public String dinnerSaved(@PathVariable String dinnerDate, Model m){  
        List<Dinner> dinnersByDateList = dao.getDinnerByDate(dinnerDate);  
        Dinner dinner = dinnersByDateList.get(0);
        List<String> dinnerParticipants = daoNamed.getDinnerParticipants(dinner);
        m.addAttribute("dinnerDate",dinnerDate);
        m.addAttribute("resturant",dinner.getResturant());
        m.addAttribute("city",dinner.getCity());
        m.addAttribute("participants",dinnerParticipants);
        return "dinnerSaved";  
    }  

    @ModelAttribute("resturantList")
    public Map<String, String> getResturantList() {
       Map<String, String> resturantList = new HashMap<String, String>();
       resturantList.put("0", "-- Selezionare il ristorante --");
       List<String> resturants = dao.getResturants();
       int listNum = 1;
       for(String resturant : resturants ) {
    	   resturantList.put(String.valueOf(listNum), resturant);
    	   listNum++;
       }
       return resturantList;
    }
    
    @RequestMapping("/evaluations")
    public String evaluations(Model m, Principal principal) {
        String currentUser = getCurrentUser(principal);
        List<Dinner> userDinners = dao.getUserDinners(currentUser);
        int totalDinners = userDinners.size();
    	m.addAttribute("currentUser", currentUser);
    	m.addAttribute("userDinners", userDinners);
    	m.addAttribute("totalDinners", totalDinners);
    	return "evaluations";  
    }
    
    @RequestMapping("/dinnerEvaluation/{id}")  
    public String dinnerEvaluation(@PathVariable String id, Model m, Principal principal){  
    	
    	//get current user
        String currentUser = getCurrentUser(principal);
        
    	//get dinner data
    	Dinner dinner = dao.getDinnerById(id); 
        
        //get evaluation data
    	Evaluations evaluations = dao.getEvaluationByDinnerId(id, currentUser); 

    	m.addAttribute("currentUser", currentUser);
        m.addAttribute("dinnerDate",dinner.getDinnerDate());
        m.addAttribute("resturant",dinner.getResturant());
        m.addAttribute("location",formatEvaluation(evaluations.getLocation()));
        m.addAttribute("menu",formatEvaluation(evaluations.getMenu()));
        m.addAttribute("service",formatEvaluation(evaluations.getService()));
        m.addAttribute("bill",formatEvaluation(evaluations.getBill()));
        m.addAttribute("id",id);

        return "dinnerEvaluation";  
    }  
    
    @RequestMapping("dinnerEvaluation/locationEvaluation/{id}")  
    public String locationEvaluation(@PathVariable String id, Model m, Principal principal){  
    	
    	//get current user
        String currentUser = getCurrentUser(principal);
        
    	//get dinner data
    	Dinner dinner = dao.getDinnerById(id); 

    	m.addAttribute("currentUser", currentUser);
        m.addAttribute("dinnerDate",dinner.getDinnerDate());
        m.addAttribute("resturant",dinner.getResturant());

        return "dinnerEvaluation/locationEvaluation";  
    }  
    
    @RequestMapping("dinnerEvaluation/menuEvaluation/{id}")  
    public String menuEvaluation(@PathVariable String id, Model m, Principal principal){  
    	
    	//get current user
        String currentUser = getCurrentUser(principal);
        
    	//get dinner data
    	Dinner dinner = dao.getDinnerById(id); 

    	m.addAttribute("currentUser", currentUser);
        m.addAttribute("dinnerDate",dinner.getDinnerDate());
        m.addAttribute("resturant",dinner.getResturant());

        return "dinnerEvaluation/menuEvaluation";  
    }  

    @RequestMapping("dinnerEvaluation/serviceEvaluation/{id}")  
    public String serviceEvaluation(@PathVariable String id, Model m, Principal principal){  
    	
    	//get current user
        String currentUser = getCurrentUser(principal);
        
    	//get dinner data
    	Dinner dinner = dao.getDinnerById(id); 

    	m.addAttribute("currentUser", currentUser);
        m.addAttribute("dinnerDate",dinner.getDinnerDate());
        m.addAttribute("resturant",dinner.getResturant());

        return "dinnerEvaluation/serviceEvaluation";  
    }  
    
    @RequestMapping("dinnerEvaluation/billEvaluation/{id}")  
    public String billEvaluation(@PathVariable String id, Model m, Principal principal){  
    	
    	//get current user
        String currentUser = getCurrentUser(principal);
        
    	//get dinner data
    	Dinner dinner = dao.getDinnerById(id); 

    	m.addAttribute("currentUser", currentUser);
        m.addAttribute("dinnerDate",dinner.getDinnerDate());
        m.addAttribute("resturant",dinner.getResturant());

        return "dinnerEvaluation/billEvaluation";  
    }  


    @RequestMapping("dinnerEvaluation/saveLocationEvaluation/{ideval}")  
    public String saveLocationEvaluation(@PathVariable String ideval, Model m, Principal principal){  
    	
    	//get id and eval
    	Integer id = Integer.parseInt(ideval.split(",")[0]);
    	String eval = ideval.split(",")[1];
    	
    	//get current user
        String currentUser = getCurrentUser(principal);

        dao.saveLocationEvaluation(id, currentUser, eval);
        
        return "redirect:/dinnerEvaluation/"+id;  
    }  

    @RequestMapping("dinnerEvaluation/saveMenuEvaluation/{ideval}")  
    public String saveMenuEvaluation(@PathVariable String ideval, Model m, Principal principal){  
    	
    	//get id and eval
    	Integer id = Integer.parseInt(ideval.split(",")[0]);
    	String eval = ideval.split(",")[1];
    	
    	//get current user
        String currentUser = getCurrentUser(principal);

        dao.saveMenuEvaluation(id, currentUser, eval);
        
        return "redirect:/dinnerEvaluation/"+id;  
    }  

    @RequestMapping("dinnerEvaluation/saveServiceEvaluation/{ideval}")  
    public String saveServiceEvaluation(@PathVariable String ideval, Model m, Principal principal){  
    	
    	//get id and eval
    	Integer id = Integer.parseInt(ideval.split(",")[0]);
    	String eval = ideval.split(",")[1];
    	
    	//get current user
        String currentUser = getCurrentUser(principal);

        dao.saveServiceEvaluation(id, currentUser, eval);
        
        return "redirect:/dinnerEvaluation/"+id;  
    }  
    
    @RequestMapping("dinnerEvaluation/saveBillEvaluation/{ideval}")  
    public String saveBillEvaluation(@PathVariable String ideval, Model m, Principal principal){  
    	
    	//get id and eval
    	Integer id = Integer.parseInt(ideval.split(",")[0]);
    	String eval = ideval.split(",")[1];
    	
    	//get current user
        String currentUser = getCurrentUser(principal);

        dao.saveBillEvaluation(id, currentUser, eval);
        
        return "redirect:/dinnerEvaluation/"+id;  
    }  


    public String getCurrentUser(Principal principal) {
    	String currentTomcatUser = principal.getName();
        return currentTomcatUser.substring(0, 1).toUpperCase() + currentTomcatUser.substring(1).toLowerCase();
    	
    }
    
    public String formatEvaluation(Integer eval) {
       	String evaluation = "n.g.";
       	if(eval != null) {
       		evaluation = String.valueOf(eval);
       	}
       	return evaluation;
    }

}  

