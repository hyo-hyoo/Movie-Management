package top.duangboss.dogemovie.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GetTime {
	public static String getTime(){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd-HH:mm");

		String dateFormat = simpleDateFormat.format(new Date());

		return dateFormat;
	}
}
