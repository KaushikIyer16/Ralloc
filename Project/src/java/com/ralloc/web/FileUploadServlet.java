/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.web;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.ralloc.bean.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 

       

/**
 * A Java servlet that handles file upload from client.
 *
 * @author www.codejava.net
 */
public class FileUploadServlet extends HttpServlet {
    //TestID is unique for each subject
    static int TestID = 1;
    private static final long serialVersionUID = 1L;
     
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
         // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;
         
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
            
                Subject Sub = new Subject();
                Dependency Dep = new Dependency();
                HashMap H = new HashMap();
                
                // iterates over form's fields
                for (FileItem item : formItems) {
                     if (item.isFormField()) {
                // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                            String fieldName = item.getFieldName();
                            String fieldValue = item.getString();
                            //request.setAttribute(fieldName,fieldValue);   //("txt", fieldValue)
                            if(fieldName.equals("SubCode"))
                                Sub.setCode(fieldValue);
                            if(fieldName.equals("SubName"))
                                Sub.setName(fieldValue);
                            Sub.setID(TestID);
                            if(fieldName.equals("Depend"))
                                Dep.setExist(fieldValue);
                            if(fieldName.equals("DepCode"))
                                if(Dep.getExist() == true)
                                    Dep.setCode(fieldValue);
                                else
                                    Dep.setCode("");
                            /*
                                    Sub object is the object for each sub
                            */
                     }
                    // processes only fields that are not form fields
                // Process file data    
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        
                        // saves the file on disk
                        item.write(storeFile);
                        
            
//////////////////////////////////////////////////////////////////////////////////////////////////
                       //Parses the list and creates lists of student objects

                        parse p = new parse();
                        List result;
                        result = p.getUSN(filePath);
                        
                        List<Student> array = new ArrayList<Student>();
                        Iterator it = result.iterator();
                        while(it.hasNext())
                        {
                            array.add(new Student((String)it.next(), TestID));
                        }
                        request.setAttribute("list",array);
                        H.put(Sub, array);
                        //HashMap <Subject,ArrayList<Student>>subjStudent = new HashMap<>();
                        
                        /*
                        Array : list of Student objects
                        */      
/////////////////////////////////////////////////////////////////////////////////////////////////                        
                    }
                }
                TestID++;
                request.setAttribute("Subject",Sub);             //("txt", fieldValue)
                H.put(Sub,Dep);
                //request.setAttribute("Dependency",Dep);
                
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        // redirects client to message page
        getServletContext().getRequestDispatcher("/ConfirmDet.jsp").forward(
                request, response);
    }
}