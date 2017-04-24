/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.controller;

import com.ralloc.model.Room;
import com.ralloc.bean.RoomBean;
import com.ralloc.bean.SubjectStudentCount;
import com.ralloc.bean.SubjectStudentUsn;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.apache.poi.xwpf.usermodel.Borders;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTJc;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTPPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTPageMar;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSectPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTSpacing;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STJc;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STLineSpacingRule;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;

/**
 *
 * @author Sneha
 */

public class IndentDocument {

   HashMap<RoomBean, ArrayList<SubjectStudentUsn>> detailedRoomMap;
   HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap;
   XWPFDocument document;
   FileOutputStream out;
   public IndentDocument(FileOutputStream out,HashMap<RoomBean, ArrayList<SubjectStudentUsn>> detailRoomMap,HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap) 
   {
        this.detailedRoomMap = detailRoomMap;
        this.roomMap=roomMap;
        this.out=out;
        document = new XWPFDocument();
   }
   
    private static void addRun(XWPFParagraph para, String text, boolean breakLine, int fontSize) {
        System.out.println("I was in addRun");
      XWPFRun run = para.createRun();
      run.setText(text);
      run.setFontFamily("Calibri");
      run.setFontSize(fontSize);
      if (breakLine) run.addBreak();
    }
   
    private void writeHeading() {
        System.out.println("I was in writeHeading");
      XWPFParagraph college = document.createParagraph();
      college.setPageBreak(true);
      college.setAlignment(ParagraphAlignment.CENTER);
      addRun(college, "B.M.S COLLEGE OF ENGINEERING, BANGALORE - 560 019", true, 18);
      addRun(college,"(Autonomous Institution under VTU)",true, 12);
      addRun(college, "Indent Sheet", true, 18);
   }
    private void writeRoom(String room){
        System.out.println("I was in addRoom");
        XWPFParagraph classRoom = document.createParagraph();
        classRoom.setBorderTop(Borders.SINGLE);
        
        CTPPr ppr;
        ppr = classRoom.getCTP().getPPr();
        if (ppr == null) ppr = classRoom.getCTP().addNewPPr();
        CTSpacing spacing;
        spacing = ppr.isSetSpacing()? ppr.getSpacing() : ppr.addNewSpacing();
        spacing.setAfter(BigInteger.valueOf(0));
        spacing.setBefore(BigInteger.valueOf(0));
        spacing.setLineRule(STLineSpacingRule.AUTO);
        spacing.setLine(BigInteger.valueOf(240));
        
        XWPFRun roomID = classRoom.createRun();
        roomID.setFontSize(20);
        roomID.addBreak();
        roomID.setText("Room: " + room);
   }
   private void writeStudCnt(String room, List<String> course, List<Integer> studCount, int n) {
        System.out.println("I was in studCnt");
        writeRoom(room);
        XWPFTable table = document.createTable();
        table.getCTTbl().getTblPr().unsetTblBorders();
        table.setInsideHBorder(XWPFTable.XWPFBorderType.SINGLE, 1, 1, "FFFFFF");
        table.setInsideVBorder(XWPFTable.XWPFBorderType.SINGLE, 1, 1, "FFFFFF");
        //table.setColBandSize(30);
        table.setCellMargins(10,10,30,30);
        
        CTTblPr tblpr = table.getCTTbl().getTblPr();
        CTJc jc = tblpr.addNewJc();        
        jc.setVal(STJc.CENTER);
        tblpr.setJc(jc);
        CTTblWidth Wd = tblpr.getTblW();
        Wd.setW(BigInteger.valueOf(4500));
        Wd.setType(STTblWidth.PCT);
        tblpr.setTblW(Wd);
        
        int i;
        
        //create first row
        XWPFTableRow title = table.createRow();
        XWPFRun colCode = title.addNewTableCell().addParagraph().createRun();
        colCode.setFontSize(15);
        colCode.setText("Course Code");
        XWPFRun colNum = title.addNewTableCell().addParagraph().createRun();
        colNum.setFontSize(15);
        colNum.setText("Students");
        for(i=0; i<n ;i++)
        {
            XWPFTableRow row = table.createRow();
            XWPFRun col1 = row.addNewTableCell().addParagraph().createRun();
            col1.setFontSize(15);
            col1.setText(course.get(i));
            XWPFRun col2 = row.addNewTableCell().addParagraph().createRun();
            col2.setFontSize(15);
            col2.setText(String.valueOf(studCount.get(i)));
        }
   }
    public void createIndent() throws Exception{
       
        //Blank Document
        //XWPFDocument document= new XWPFDocument(); 
        //Write the Document in file system
        //FileOutputStream out = new FileOutputStream(new File("Indent.docx"));
        
        //To align the page
        CTSectPr sectPr;
        sectPr = document.getDocument().getBody().addNewSectPr();
        CTPageMar pageMar;
        pageMar = sectPr.addNewPgMar();
        pageMar.setTop(BigInteger.valueOf(720L));
        pageMar.setBottom(BigInteger.valueOf(720L));
     
        //To write the page heading
        writeHeading();
        int n;
        String RoomID;
        try{
        for(RoomBean roomBean: roomMap.keySet())
        {
            n = 0;
            List<String> Code = new ArrayList<String>();
            List<Integer> NumStud = new ArrayList<Integer>();
            //writeStudCnt(Room.getRoomNameById(roomBean.getRoomId()));
            for(SubjectStudentCount paperCount: roomMap.get(roomBean))
            {
                n++;
                Code.add(paperCount.getCourseCode());
                NumStud.add(paperCount.getNumberOfStudents());
            }
            RoomID = Room.getRoomNameById(roomBean.getRoomId());
            writeStudCnt(RoomID,Code,NumStud,n);
        }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        document.write(out);
        out.close();
        System.out.println("Indent.docx written successfully");
    }
}
