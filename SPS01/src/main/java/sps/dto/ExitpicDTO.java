package sps.dto;

import sps.dao.*;
import sps.vo.*;

public class ExitpicDTO  extends DBManager
{
	public boolean Insert(ExitVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into exitpic (exitpic) ";
		sql += "values (";
		sql += "'" + vo.getExitpic() + "'";
		sql += ")";
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}

	
}
