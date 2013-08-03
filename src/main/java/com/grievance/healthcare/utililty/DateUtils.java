/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.utililty;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.text.ParseException;

/**
 *
 * @author sabbani
 */
public class DateUtils {

    public static Date convertStringToData(String dateStr){
        Date sqlDate = null;
        java.util.Date date = null;
        try{
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd/mm/yyyy");
            date = sdf1.parse(dateStr);
            sqlDate = new Date(date.getTime());
        }catch(ParseException ex){
            ex.printStackTrace();
        }catch(Exception e){
            e.printStackTrace();
        }
        return sqlDate;
    }

}
