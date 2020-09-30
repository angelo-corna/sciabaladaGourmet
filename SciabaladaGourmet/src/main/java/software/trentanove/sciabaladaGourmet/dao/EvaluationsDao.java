package software.trentanove.sciabaladaGourmet.dao;  
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import software.trentanove.sciabaladaGourmet.beans.Dinner;
import software.trentanove.sciabaladaGourmet.beans.Evaluations;  
  
public class EvaluationsDao {  
	
	@Autowired
	JdbcTemplate template;  
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  

	@Autowired
	NamedParameterJdbcTemplate namedParameterTemplate;
	public void setNamedParameterTemplate(NamedParameterJdbcTemplate namedParameterTemplate) {  
	    this.namedParameterTemplate = namedParameterTemplate;  
	} 
	
	public int insertDinner(Dinner dinner, Map<String, String> resturantsList){  
		String resturantAndCityIndex = dinner.getResturantAndCity();
		String resturantAndCity = resturantsList.get(resturantAndCityIndex);
		if(resturantAndCity != null && !resturantAndCity.equals("0")) {
			String[] resturantAndCityP = resturantAndCity.split(" - ");
			dinner.setResturant(resturantAndCityP[0]);
			dinner.setCity(resturantAndCityP[1]);
		} else {
			for (Map.Entry<String, String> resturant : resturantsList.entrySet()) {
			    String entry = resturant.getValue();
			    String[] entryP = entry.split(" - ");
			    if (dinner.getResturant().toUpperCase().equals(entryP[0].toUpperCase()) &&  dinner.getCity().toUpperCase().equals(entryP[1].toUpperCase())){
					dinner.setResturant(entryP[0]);
					dinner.setCity(entryP[1]);
					break;
			    }
			}
		}

		SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(dinner);
		namedParameterTemplate.update("insert into dinners (dinnerDate, resturant, city) values(:dinnerDate, :resturant, :city)", namedParameters);
	    return namedParameterTemplate.queryForObject("select last_insert_id()", namedParameters , Integer.class); 
	} 
	
	public boolean checkDinner( Dinner dinner ){  
		boolean dinnerAlreadyRegistered = false;
		SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(dinner);
		int result = namedParameterTemplate.queryForObject( "select count(*) from dinners where dinnerDate = :dinnerDate", namedParameters, Integer.class);
		if(result > 0 ) {
			dinnerAlreadyRegistered = true;
		}
		return dinnerAlreadyRegistered;
	} 

	public List<Dinner> getDinnerByDate( String dinnerDate ){  
	    return template.query("select id, resturant, city from dinners where dinnerDate = ?", new Object[] {dinnerDate},new RowMapper<Dinner>(){
	        public Dinner mapRow(ResultSet rs, int row) throws SQLException {  
	        	Dinner d=new Dinner();  
	            d.setId(rs.getInt(1)); 
	            d.setResturant(rs.getString(2)); 
	            d.setCity(rs.getString(3)); 
	            return d;  
	        }  
	    });  
	} 
	
	public List<String> getDinnerParticipants( Dinner dinner ){  
		SqlParameterSource namedParameters = new BeanPropertySqlParameterSource(dinner);
	    return namedParameterTemplate.query("select participant from evaluations where dinner_id = :id",namedParameters, new RowMapper<String>(){  
	        public String mapRow(ResultSet rs, int row) throws SQLException {  
	            return rs.getString(1);  
	        }  
	    });  
	} 
	
	public List<String> getResturants(){  
	    return template.query("select resturant,city from dinners group by resturant,city order by resturant", new RowMapper<String>(){  
	        public String mapRow(ResultSet rs, int row) throws SQLException {  
	            return rs.getString(1) + " - " + rs.getString(2);  
	        }  
	    });  
	} 
	
	public void insertDinnerParticipants(int dinnerId, String participants){  
 		String[] participantsP = participants.split(",");
		for (int i=0; i<participantsP.length; i++) {
			template.update("insert into evaluations (dinner_id, participant) values(?, ?)",new Object[] {dinnerId, participantsP[i]});
		}
	} 
	
	public List<Dinner> getUserDinners( String currentUser ){  
		String sql = "select d.id, d.dinnerDate, d.resturant, e.location,e.menu,e.service,e.bill from dinners as d inner join "
				+ "evaluations as e on e.dinner_id=d.id where e.participant=? order by d.DinnerDate desc";
	    return template.query(sql, new Object[] {currentUser},new RowMapper<Dinner>(){
	        public Dinner mapRow(ResultSet rs, int row) throws SQLException {  
	        	Dinner d=new Dinner();  
	            d.setId(rs.getInt(1)); 
	            d.setDinnerDate(rs.getString(2)); 
	            d.setResturant(rs.getString(3)); 
	            String location=rs.getString(4);
	            String menu=rs.getString(5);
	            String service=rs.getString(6);
	            String bill=rs.getString(7);
	            boolean alreadyEvaluated = false;
	            if( location != null && menu != null && service != null && bill != null) {
	            	alreadyEvaluated = true;
	            }
	            d.setEvaluated(alreadyEvaluated); 
	            return d;  
	        }  
	    });  
	} 
	
	public Dinner getDinnerById( String id ){  
		List<Dinner> dinnersList = template.query("select id, dinnerDate, resturant, city from dinners where id = ?", new Object[] {id},new RowMapper<Dinner>(){
	        public Dinner mapRow(ResultSet rs, int row) throws SQLException {  
	        	Dinner d=new Dinner();  
	            d.setId(rs.getInt(1)); 
	            d.setDinnerDate(rs.getString(2)); 
	            d.setResturant(rs.getString(3)); 
	            d.setCity(rs.getString(4)); 
	            return d;  
	        }  
	    }); 
		return dinnersList.get(0);
	} 
	
	public Evaluations getEvaluationByDinnerId( String id, String participant ){  
		List<Evaluations> evaluationsList = template.query("select location, menu, service, bill from evaluations where dinner_id = ? and participant = ?", new Object[] {id, participant},new RowMapper<Evaluations>(){
	        public Evaluations mapRow(ResultSet rs, int row) throws SQLException {  
	        	Evaluations e=new Evaluations();  
	        	Integer location = rs.getInt(1);
	        	if (rs.wasNull()) {
	        		location = null;
	        	}
	            e.setLocation(location); 
	        	Integer menu = rs.getInt(2);
	        	if (rs.wasNull()) {
	        		menu = null;
	        	}
	            e.setMenu(menu);
	        	Integer service = rs.getInt(3);
	        	if (rs.wasNull()) {
	        		service = null;
	        	}
	            e.setService(service); 
	        	Integer bill = rs.getInt(4);
	        	if (rs.wasNull()) {
	        		bill = null;
	        	}
	            e.setBill(bill); 
	            return e;  
	        }  
	    });  
		return evaluationsList.get(0);
	} 
	
	public void saveLocationEvaluation(int dinnerId, String participant, String eval){  
		template.update("update evaluations set location=? where dinner_id=? and participant=?",new Object[] {eval, dinnerId, participant});
	} 
	
	public void saveMenuEvaluation(int dinnerId, String participant, String eval){  
		template.update("update evaluations set menu=? where dinner_id=? and participant=?",new Object[] {eval, dinnerId, participant});
	} 
 
	public void saveServiceEvaluation(int dinnerId, String participant, String eval){  
		template.update("update evaluations set service=? where dinner_id=? and participant=?",new Object[] {eval, dinnerId, participant});
	} 
	
	public void saveBillEvaluation(int dinnerId, String participant, String eval){  
		template.update("update evaluations set bill=? where dinner_id=? and participant=?",new Object[] {eval, dinnerId, participant});
	} 

}  