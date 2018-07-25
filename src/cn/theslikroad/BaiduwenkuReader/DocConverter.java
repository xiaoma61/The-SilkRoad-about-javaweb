package cn.theslikroad.BaiduwenkuReader;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.ConnectException;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;

//doc格式转换
public class DocConverter {
	private String filepath;//文件路径
	private String outputpath;//输入路径
	private String filename;
	private File pdffile;
	private File swffile;
	private File docfile;
	
	public DocConverter(String filepath)
	{
		init(filepath);
	}
	public void setFile(String filepath)
	{
		init(filepath);
	}
	private void init(String filepath)
	{
		this.filepath=filepath;
		//信息需要补全
		filename=filepath.substring(0,filepath.lastIndexOf("."));
		docfile=new File(filepath);
		pdffile=new File(filename+".pdf");
		swffile=new File(filename+".swf");
	}
	private void doctopdf() throws ConnectException
	{
		if(docfile.exists())
		{
			if(!pdffile.exists()){
				//连接sooffice，需要之前开启他socket连接
				 OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
				 connection.connect();  
				 DocumentConverter converter = new OpenOfficeDocumentConverter(connection); 
				 //开始转换
				 converter.convert(docfile, pdffile);
				 connection.disconnect();
				 System.out.println("****pdf转换成功，PDF输出：" + pdffile.getPath()+ "****");  
				
			}
		}
	}
	private void pdftoswf() throws IOException
	{
		Runtime r=Runtime.getRuntime();
		if(!swffile.exists())
		{
			if(pdffile.exists())
			{
				  Process p = r.exec("F:/oracle/swf/pdf2swf.exe "+ pdffile.getPath() + " -o "+ swffile.getPath() + " -T 9"); 
				  System.out.print(loadStream(p.getInputStream()));  
                  System.err.print(loadStream(p.getErrorStream()));  
                  System.out.print(loadStream(p.getInputStream()));  
                  System.err.println("****swf转换成功，文件输出："  
                          + swffile.getPath() + "****");  
                  if (pdffile.exists()) {  
                      pdffile.delete();  
                  }  
			}
		}
	}
	 static String loadStream(InputStream in) throws IOException {  
		  
	        int ptr = 0;  
	        in = new BufferedInputStream(in);  
	        StringBuffer buffer = new StringBuffer();  
	  
	        while ((ptr = in.read()) != -1) {  
	            buffer.append((char) ptr);  
	        }  
	  
	        return buffer.toString();  
	    } 
	
	 public boolean conver() throws IOException {  
		  
	        if (swffile.exists()) {  
	            System.out.println("****swf转换器开始工作，该文件已经转换为swf****");  
	            return true;  
	        }  
	        try {
				doctopdf();
				pdftoswf();
			} catch (ConnectException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false; 
			}
	        if (swffile.exists()) {  
	            return true;  
	        } else {  
	            return false;  
	        } 
	 
	 }
	 public void setOutputPath(String outputPath) {  
	        this.outputpath = outputPath;  
	        if (!outputPath.equals("")) {  
	            String realName = filename.substring(filename.lastIndexOf("/"),  
	                    filename.lastIndexOf("."));  
	            if (outputPath.charAt(outputPath.length()) == '/') {  
	                swffile = new File(outputPath + realName + ".swf");  
	            } else {  
	                swffile = new File(outputPath + realName + ".swf");  
	            }  
	        }  
	    }
	 public String getswfPath() {  
	        if (swffile.exists()) {  
	            String tempString = swffile.getPath();  
	            tempString = tempString.replaceAll("\\\\", "/");  
	            return tempString;  
	        } else {  
	            return "";  
	        }  
	  
	    }  
}
