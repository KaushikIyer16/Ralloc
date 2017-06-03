/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.controller;
import com.ralloc.bean.RoomBean;
import com.ralloc.bean.SubjectStudentCount;
import com.ralloc.bean.SubjectStudentUsn;
import com.ralloc.controller.Ralloc;
import com.ralloc.model.Room;
import com.ralloc.model.Subject;
import com.ralloc.routes.AllocateRouteServlet;
import static com.ralloc.routes.GenerateRouteServlet.detailedRoomMap;
import static com.ralloc.routes.GenerateRouteServlet.roomMap;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletContext;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;


/**
 *
 * @author Bhargav
 */
public class AllotmentDocument {
    
    public void writeAllotment(FileOutputStream out,HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap, HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap) throws FileNotFoundException, IOException, SQLException
    {
         //Blank Document
      XWPFDocument document= new XWPFDocument(); 
      
      
      
      
      for(RoomBean roomBean: detailedRoomMap.keySet())
        {
            XWPFParagraph roomParagraph = document.createParagraph();
            
            XWPFRun roomNameParagraph = roomParagraph.createRun();
            roomNameParagraph.setFontSize(20);
            roomNameParagraph.setBold(true);
          
            roomNameParagraph.setText("ROOM: "+ Room.getRoomNameById(roomBean.getRoomId()));
            roomNameParagraph.addBreak();
            if(AllocateRouteServlet.examDate!=null){
                roomNameParagraph.setText("DATE :  "+AllocateRouteServlet.examDate);
                roomNameParagraph.addTab();
                roomNameParagraph.addTab();
                roomNameParagraph.setText("TIME:  "+AllocateRouteServlet.examTime);
            }
            else{
                roomNameParagraph.setText("DATE : ________________");
                roomNameParagraph.addTab();
                roomNameParagraph.addTab();
                roomNameParagraph.setText("TIME: _________ to ________");
            }
            
            roomNameParagraph.addBreak();
            ArrayList<SubjectStudentUsn> studentList = detailedRoomMap.get(roomBean);
            
                    
                    for(SubjectStudentUsn subjects : studentList)
                    {
                        XWPFRun courseNameParagraph = roomParagraph.createRun();
                        courseNameParagraph.setFontSize(15);
                        courseNameParagraph.setBold(true);
                        XWPFRun usnParagraph = roomParagraph.createRun();
                        usnParagraph.setFontSize(10);
                         courseNameParagraph.setText("COURSE CODE: "+ subjects.getCourseCode());
                         for(int i=0;i<2;i++)
                            courseNameParagraph.addTab();
                         courseNameParagraph.setText("SUBJECT: "+Subject.getNameByCourseCode(subjects.getCourseCode()));
                         courseNameParagraph.addBreak();
                         ArrayList<String> usnList = subjects.getUsnList();
                         courseNameParagraph.setText("TOTAL: "+usnList.size());
                         courseNameParagraph.addBreak();
                         //paragraphOneRunOne.setBold(false);
                         for(int i=0; i<usnList.size(); i++)
                         {
                            usnParagraph.setText(usnList.get(i).toString());
                            usnParagraph.addTab();
                         }
                         usnParagraph.addBreak();
                         usnParagraph.addBreak();
                        
                    }
                    XWPFParagraph footerParagraph = document.createParagraph();
                    XWPFRun footerMessage = footerParagraph.createRun();
                    footerMessage.setFontSize(8);
                    footerMessage.setBold(true);
                    footerMessage.setText("If any UNSs are missing, please report to the Control Room - PG Block, 3rd Floor (3001)");
        }
      
      document.write(out);
      out.close();
     
        
    }
   
    
}
