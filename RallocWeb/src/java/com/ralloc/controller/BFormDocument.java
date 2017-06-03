/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.ralloc.controller;

import com.ralloc.bean.RoomBean;
import com.ralloc.bean.SubjectStudentUsn;
import com.ralloc.model.DepartmentSubject;
import com.ralloc.model.Department;
import com.ralloc.model.Subject;
import com.ralloc.model.Room;
import java.util.HashMap;
import java.util.ArrayList;
import java.sql.SQLException;
import java.math.BigInteger;
import java.io.*;
import org.apache.xmlbeans.XmlException;
import org.apache.xmlbeans.XmlToken;
import org.apache.poi.xwpf.usermodel.Document;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFPicture;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTbl;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblPr;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STTblWidth;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTTblBorders;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTBorder;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STHeightRule;
import org.openxmlformats.schemas.drawingml.x2006.main.CTNonVisualDrawingProps;
import org.openxmlformats.schemas.drawingml.x2006.main.CTPositiveSize2D;
import org.openxmlformats.schemas.drawingml.x2006.wordprocessingDrawing.CTInline;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.CTJc;
import org.openxmlformats.schemas.wordprocessingml.x2006.main.STJc;

/**
 *
 * @author saurabh
 */
public class BFormDocument {

   HashMap<RoomBean, ArrayList<SubjectStudentUsn>> detailedRoomMap;
   //String date, time, contextPath, blipID;
   String contextPath, blipID;
   XWPFDocument document;
   FileOutputStream out;
   InputStream imgReader;
//   public BFormDocument(FileOutputStream out,HashMap<RoomBean, ArrayList<SubjectStudentUsn>> detailRoomMap, String formDate, String formTime,String contextPath) {
//      this.detailedRoomMap = detailRoomMap;
//      this.date = formDate;
//      this.time = formTime;
//      this.out = out;
//      document = new XWPFDocument();
//      this.contextPath = contextPath;
//   }


   public BFormDocument(FileOutputStream out,HashMap<RoomBean, ArrayList<SubjectStudentUsn>> detailRoomMap, /*String formDate, String formTime,*/InputStream imgReader) {
      this.detailedRoomMap = detailRoomMap;
      //this.date = formDate;
      //this.time = formTime;
      this.out = out;
      document = new XWPFDocument();
      this.imgReader = imgReader;

   }

   public void createPicture(XWPFParagraph para, String blipId,int id, int width, int height) {
      final int EMU = 9525;
      width *= EMU;
      height *= EMU;
      //String blipId = getAllPictures().get(id).getPackageRelationship().getId();

      XWPFRun run = para.createRun();
      CTInline inline = run.getCTR().addNewDrawing().addNewInline();

      String picXml = "" +
         "<a:graphic xmlns:a=\"http://schemas.openxmlformats.org/drawingml/2006/main\">" +
         "   <a:graphicData uri=\"http://schemas.openxmlformats.org/drawingml/2006/picture\">" +
         "      <pic:pic xmlns:pic=\"http://schemas.openxmlformats.org/drawingml/2006/picture\">" +
         "         <pic:nvPicPr>" +
         "            <pic:cNvPr id=\"" + id + "\" name=\"Generated\"/>" +
         "            <pic:cNvPicPr/>" +
         "         </pic:nvPicPr>" +
         "         <pic:blipFill>" +
         "            <a:blip r:embed=\"" + blipId + "\" xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\"/>" +
         "            <a:stretch>" +
         "               <a:fillRect/>" +
         "            </a:stretch>" +
         "         </pic:blipFill>" +
         "         <pic:spPr>" +
         "            <a:xfrm>" +
         "               <a:off x=\"0\" y=\"0\"/>" +
         "               <a:ext cx=\"" + width + "\" cy=\"" + height + "\"/>" +
         "            </a:xfrm>" +
         "            <a:prstGeom prst=\"rect\">" +
         "               <a:avLst/>" +
         "            </a:prstGeom>" +
         "         </pic:spPr>" +
         "      </pic:pic>" +
         "   </a:graphicData>" +
         "</a:graphic>";

        //CTGraphicalObjectData graphicData = inline.addNewGraphic().addNewGraphicData();
        XmlToken xmlToken = null;
        try {
           xmlToken = XmlToken.Factory.parse(picXml);
        } catch(XmlException xe) {
            xe.printStackTrace();
        }
        inline.set(xmlToken);
        //graphicData.set(xmlToken);

        inline.setDistT(0);
        inline.setDistB(0);
        inline.setDistL(0);
        inline.setDistR(0);

        CTPositiveSize2D extent = inline.addNewExtent();
        extent.setCx(width);
        extent.setCy(height);

        CTNonVisualDrawingProps docPr = inline.addNewDocPr();
        docPr.setId(id);
        docPr.setName("Picture " + id);
        docPr.setDescr("Generated");
        run.addBreak();
    }

   private void writeRun(XWPFParagraph para, String text, boolean breakLine) {
      XWPFRun run = para.createRun();
      run.setText(text);
      run.setFontFamily("Calibri");
      run.setFontSize(8);
      if (breakLine) run.addBreak();
   }

   private void writeRun(XWPFParagraph para, String text, boolean breakLine, int fontSize) {
      XWPFRun run = para.createRun();
      run.setText(text);
      run.setFontFamily("Calibri");
      run.setFontSize(fontSize);
      if (breakLine) run.addBreak();
   }

   private void writeHeading() {

      XWPFParagraph formBHeading = document.createParagraph();
      formBHeading.setAlignment(ParagraphAlignment.RIGHT);
      writeRun(formBHeading, "FORM B", false, 8);
//      formBHeading.setPageBreak(true);

      XWPFParagraph heading = document.createParagraph();
//      heading.setPageBreak(true);
      heading.setAlignment(ParagraphAlignment.CENTER);


      try {

         createPicture(heading, blipID,document.getNextPicNameNumber(Document.PICTURE_TYPE_JPEG), 55, 55);
      } catch (Exception e) {
          e.printStackTrace();
      }

      writeRun(heading, "BMS COLLEGE OF ENGINEERING(Autonomous Institution under VTU), BANGALORE - 560 019", true);
      writeRun(heading, "Attendance and Room Superintendent's Report", true);
      String dateTime = "        ";
      /*if(!(date.length() < 10))
          dateTime = date.substring(3, date.length());*/
      writeRun(heading, "B.E./B.Arch./M.B.A/M.C.A/M.Tech./Ph.D./M.Sc.(Res) _______ Semester Examination " + dateTime, false);
   }

   private void writeCourseDetails(SubjectStudentUsn subject, int id) {
      String courseCode = subject.getCourseCode();
      //create table
      XWPFTable table = document.createTable(3, 2);

      XWPFParagraph department = table.getRow(0).getCell(0).getParagraphArray(0);
      department.setPageBreak(false);
      department.setAlignment(ParagraphAlignment.LEFT);
      try {
         String dept = "Department: " + Department.getDepartmentNameById(DepartmentSubject.getDepartmentIdByCourseCode(courseCode));
         writeRun(department, dept, false);
      } catch (SQLException e) {
         System.out.println(e);
      }

      XWPFParagraph room = table.getRow(0).getCell(1).getParagraphArray(0);
      room.setPageBreak(false);
      room.setAlignment(ParagraphAlignment.RIGHT);
      try {
         writeRun(room, "Room: " + Room.getRoomNameById(id), true);
      } catch (SQLException e) {
         e.printStackTrace();
      }

      XWPFParagraph courseName = table.getRow(1).getCell(0).getParagraphArray(0);
      courseName.setPageBreak(false);
      courseName.setAlignment(ParagraphAlignment.LEFT);
      try {
         writeRun(courseName, "Course: " + Subject.getNameByCourseCode(courseCode), false);
      } catch (SQLException e) {
         System.out.println(e);
      }

      XWPFParagraph code = table.getRow(1).getCell(1).getParagraphArray(0);
      code.setPageBreak(false);
      code.setAlignment(ParagraphAlignment.RIGHT);
      writeRun(code, "Course Code: " + courseCode, true);

      XWPFParagraph date = table.getRow(2).getCell(0).getParagraphArray(0);
      date.setPageBreak(false);
      date.setAlignment(ParagraphAlignment.LEFT);
      writeRun(date, "Date:_______________", false);

      XWPFParagraph time = table.getRow(2).getCell(1).getParagraphArray(0);
      time.setPageBreak(false);
      time.setAlignment(ParagraphAlignment.RIGHT);
      writeRun(time, "Time: _____________ to _____________", true);

      table.setInsideHBorder(XWPFTable.XWPFBorderType.SINGLE, 1, 1, "FFFFFF");
      table.setInsideVBorder(XWPFTable.XWPFBorderType.SINGLE, 1, 1, "FFFFFF");
      table.getRow(0).setHeight(300);
      table.getRow(0).getCtRow().getTrPr().getTrHeightArray(0).setHRule(STHeightRule.EXACT);
      table.getRow(1).setHeight(300);
      table.getRow(1).getCtRow().getTrPr().getTrHeightArray(0).setHRule(STHeightRule.EXACT);

      CTTbl ctable = table.getCTTbl();
      CTTblPr pr = ctable.getTblPr();

      CTTblWidth tblW = pr.getTblW();
      tblW.setW(BigInteger.valueOf(5000));
      tblW.setType(STTblWidth.PCT);
      pr.setTblW(tblW);

      CTTblBorders tblB = pr.getTblBorders();
      CTBorder border = tblB.addNewBottom();
      border.setColor("FFFFFF");
      tblB.setBottom(border);
      tblB.setTop(border);
      tblB.setRight(border);
      tblB.setLeft(border);

      ctable.setTblPr(pr);
   }

   private void writeUSN(SubjectStudentUsn subject) {
      XWPFTable table = document.createTable(1, 5);

      XWPFParagraph usnColumn = table.getRow(0).getCell(0).getParagraphArray(0);
      usnColumn.setAlignment(ParagraphAlignment.CENTER);
      writeRun(usnColumn, "USN", false, 7);
      XWPFParagraph bookletNo = table.getRow(0).getCell(1).getParagraphArray(0);
      bookletNo.setAlignment(ParagraphAlignment.CENTER);
      writeRun(bookletNo, "Booklet/Drg. Sheet No.", false, 7);
      XWPFParagraph signature = table.getRow(0).getCell(2).getParagraphArray(0);
      signature.setAlignment(ParagraphAlignment.CENTER);
      writeRun(signature, "Signature", false, 7);
      XWPFParagraph additionalBooklet = table.getRow(0).getCell(3).getParagraphArray(0);
      additionalBooklet.setAlignment(ParagraphAlignment.CENTER);
      writeRun(additionalBooklet, "Addl. Booklet/Drg./Graph Sheet No.", false, 7);
      XWPFParagraph total = table.getRow(0).getCell(4).getParagraphArray(0);
      total.setAlignment(ParagraphAlignment.CENTER);
      writeRun(total, "Total", false, 7);

      table.getRow(0).setRepeatHeader(true);
      table.getRow(0).setHeight(350);
      table.getRow(0).getCtRow().getTrPr().getTrHeightArray(0).setHRule(STHeightRule.EXACT);
      for (int i = 0; i < 5; ++i)
         table.getRow(0).getCell(i).setVerticalAlignment(XWPFTableCell.XWPFVertAlign.CENTER);

      int counter = 1;
      for (String usn: subject.getUsnList()) {
         usnColumn = table.createRow().getCell(0).getParagraphArray(0);
         usnColumn.setAlignment(ParagraphAlignment.LEFT);
         writeRun(usnColumn, usn, false);
         table.getRow(counter).setHeight(350);
         table.getRow(counter).getCtRow().getTrPr().getTrHeightArray(0).setHRule(STHeightRule.EXACT);
         table.getRow(counter).getCell(0).setVerticalAlignment(XWPFTableCell.XWPFVertAlign.CENTER);
         ++counter;
      }

      CTTbl ctable = table.getCTTbl();
      CTTblPr pr = ctable.getTblPr();
      CTTblWidth tblW = pr.getTblW();
      tblW.setW(BigInteger.valueOf(5000));
      tblW.setType(STTblWidth.PCT);
      pr.setTblW(tblW);
      ctable.setTblPr(pr);
   }

   public void writeAttendance(){
      XWPFParagraph attendance = document.createParagraph();
      attendance.setPageBreak(false);
      attendance.setAlignment(ParagraphAlignment.LEFT);
      writeRun(attendance, "", true);
      writeRun(attendance, "USNs(absentees):________________________________________________________", true);
      writeRun(attendance, "", true);
      writeRun(attendance, "USNs (candidates b/u malpractice):________________________________________________________", false);

      XWPFTable table = document.createTable(4, 4);

      XWPFParagraph roomSuperintendent = table.getRow(0).getCell(1).getParagraphArray(0);
      roomSuperintendent.setPageBreak(false);
      roomSuperintendent.setAlignment(ParagraphAlignment.CENTER);
      writeRun(roomSuperintendent, "Room Superintendent / Examiner - I", true);

      XWPFParagraph examinerII = table.getRow(0).getCell(2).getParagraphArray(0);
      examinerII.setPageBreak(false);
      examinerII.setAlignment(ParagraphAlignment.CENTER);
      writeRun(examinerII, "Examiner - II", true);

      XWPFParagraph chief = table.getRow(0).getCell(3).getParagraphArray(0);
      chief.setPageBreak(false);
      chief.setAlignment(ParagraphAlignment.CENTER);
      writeRun(chief, "Chief/Deputy Superintendent", true);

      XWPFParagraph signature = table.getRow(1).getCell(0).getParagraphArray(0);
      signature.setPageBreak(false);
      signature.setAlignment(ParagraphAlignment.LEFT);
      writeRun(signature, "Signature", true);

      XWPFParagraph name = table.getRow(2).getCell(0).getParagraphArray(0);
      name.setPageBreak(false);
      name.setAlignment(ParagraphAlignment.LEFT);
      writeRun(name, "Name", true);

      XWPFParagraph affiliation = table.getRow(3).getCell(0).getParagraphArray(0);
      affiliation.setPageBreak(false);
      affiliation.setAlignment(ParagraphAlignment.LEFT);
      writeRun(affiliation, "Affiliation", true);

      XWPFParagraph emptyParah = document.createParagraph();
      emptyParah.setPageBreak(true);
      for (int i = 1; i <= 3; ++i) {
        XWPFParagraph line = table.getRow(i).getCell(1).getParagraphArray(0);
        line.setPageBreak(false);
        line.setAlignment(ParagraphAlignment.CENTER);
        writeRun(line, ":_______________________", true);
        for (int j = 2; j <= 3; ++j) {
          XWPFParagraph otherLine = table.getRow(i).getCell(j).getParagraphArray(0);
          otherLine.setPageBreak(false);
          otherLine.setAlignment(ParagraphAlignment.CENTER);
          writeRun(otherLine, "____________________", true);
        }
        writeRun(line, "", true);
      }
       writeRun(emptyParah, "", true);
      table.setInsideHBorder(XWPFTable.XWPFBorderType.SINGLE, 1, 1, "FFFFFF");
      table.setInsideVBorder(XWPFTable.XWPFBorderType.SINGLE, 1, 1, "FFFFFF");
      for (int i = 0; i < 4; ++i) {
        table.getRow(i).setHeight(300);
        table.getRow(i).getCtRow().getTrPr().getTrHeightArray(0).setHRule(STHeightRule.EXACT);
      }


      CTTbl ctable = table.getCTTbl();
      CTTblPr pr = ctable.getTblPr();

      CTTblWidth tblW = pr.getTblW();
      tblW.setW(BigInteger.valueOf(5000));
      tblW.setType(STTblWidth.PCT);
      pr.setTblW(tblW);

      CTTblBorders tblB = pr.getTblBorders();
      CTBorder border = tblB.addNewBottom();
      border.setColor("FFFFFF");
      tblB.setBottom(border);
      tblB.setTop(border);
      tblB.setRight(border);
      tblB.setLeft(border);

      ctable.setTblPr(pr);
   }

   public void createDoc() throws Exception {

      //Write the Document in file system
      //FileOutputStream out = new FileOutputStream( new File("bform-" + date + time + ".docx"));
      blipID = document.addPictureData(imgReader, Document.PICTURE_TYPE_PNG);

      for (RoomBean roomBean: detailedRoomMap.keySet()) {
         ArrayList<SubjectStudentUsn> subjectList = detailedRoomMap.get(roomBean);
         for (SubjectStudentUsn subject: subjectList) {
            writeHeading();
            writeCourseDetails(subject, roomBean.getRoomId());
            document.createParagraph().createRun().addBreak();
            writeUSN(subject);
            writeAttendance();
         }

      }
      document.write(out);
      out.close();

   }
}
