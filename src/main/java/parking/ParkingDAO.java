package parking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ParkingDAO implements ParkingService {

	@Autowired private SqlSession sql;
	
	@Override
	public List<LatlngVO> getMarkerInfo() {
		return sql.selectList("parking.mapper.marker");
	}

	
}
