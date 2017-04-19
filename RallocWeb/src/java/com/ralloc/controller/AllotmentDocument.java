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
    
    public FileOutputStream writeAllotment(FileOutputStream out,HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap, HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap) throws FileNotFoundException, IOException, SQLException
    {
         //Blank Document
      XWPFDocument document= new XWPFDocument(); 
      //Write the Document in file system
      //String tmpDir = System.getProperty("java.io.tmpdir");
        //System.out.println(tmpDir);
      /*File f = File.createTempFile("RoomAllocation", ".docx", new File(System.getProperty("java.io.tmpdir")));
      //FileOutputStream out = new FileOutputStream(new File(tmpDir,"RoomAllocation.docx"));
      FileOutputStream out = new FileOutputStream(f);
      f.deleteOnExit();*/
        
      //create Paragraph
     //XWPFParagraph paragraph = document.createParagraph();
     //XWPFParagraph roomParagraph[] = new XWPFParagraph[20];
     //XWPFParagraph p1 = document.createParagraph();
     //XWPFParagraph p1 = document.createParagraph();
     //XWPFParagraph p2 = document.createParagraph();
      //XWPFRun paragraphOneRunOne = paragraph[0].createRun();
      //paragraphOneRunOne.setBold(true);
      //paragraphOneRunOne.setFontSize(20);
      //XWPFRun p = p1.createRun();
      //p.setBold(true);
      //p.setFontSize(15);
      //XWPFRun q = p2.createRun();
      /*for(int i=0;i<20;i++)
      {    
          run.setText("1BM14IS023");
          run.addTab();
      }*/
      
      
      
      //int abc=0;
      //This is where code starts
      
      
      
      for(RoomBean roomBean: detailedRoomMap.keySet())
        {
            XWPFParagraph roomParagraph = document.createParagraph();
            
            XWPFRun roomNameParagraph = roomParagraph.createRun();
            roomNameParagraph.setFontSize(20);
            roomNameParagraph.setBold(true);
          
            roomNameParagraph.setText("ROOM: "+ Room.getRoomNameById(roomBean.getRoomId()));
            roomNameParagraph.addBreak();
            ArrayList<SubjectStudentUsn> studentList = detailedRoomMap.get(roomBean);
            
                    //paragraphOneRunOne.setFontSize(15);
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
                         //paragraphOneRunOne.setBold(false);
                         for(int i=0; i<usnList.size(); i++)
                         {
                            usnParagraph.setText(usnList.get(i).toString());
                            usnParagraph.addTab();
                         }
                         usnParagraph.addBreak();
                         usnParagraph.addBreak();
                        
                    }
                    //paragraphOneRunOne.setFontSize(20);
        }
      //This is where it ends
      
      
      
      
      /*for(int i=0;i<10;i++){
          paragraph[i] = document.createParagraph();
          XWPFRun para1 = paragraph[i].createRun();
          para1.setFontSize(40);
          para1.setBold(true);
          XWPFRun para2 = paragraph[i].createRun();
          para2.setFontSize(20);
          XWPFRun para3 = paragraph[i].createRun();
          para3.setFontSize(10);
        para1.setText("Hello World"+i);
        para2.setText("Bhargav Mysore"+i);
        para3.setText("BMSCE"+i);
        
        
      }*/
      
      //paragraphOneRunOne.setFontSize(80);
      //paragraphOneRunOne.setText("Hello World");
      document.write(out);
      out.close();
      return out;
      //System.out.println("createparagraph.docx written successfully");
        
    }
    /*public static void main(String[] args) throws IOException, FileNotFoundException, SQLException {
        
        Ralloc rc = new Ralloc();
        rc.getRoomAllocation();
        roomMap = rc.getRoomMap();
        detailedRoomMap = rc.getDetailedRoomMap();
        AllotmentDocument dw = new AllotmentDocument();
        dw.writeAllotment(detailedRoomMap, roomMap);
        System.out.println("Writing done");
    }*/
    
}
