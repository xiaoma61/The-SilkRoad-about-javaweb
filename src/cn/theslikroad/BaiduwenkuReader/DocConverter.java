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

//doc��ʽת��
public class DocConverter {
	private String filepath;//�ļ�·��
	private String outputpath;//����·��
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
		//��Ϣ��Ҫ��ȫ
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
				//����sooffice����Ҫ֮ǰ������socket����
				 OpenOfficeConnection connection = new SocketOpenOfficeConnection(8100);
				 connection.connect();  
				 DocumentConverter converter = new OpenOfficeDocumentConverter(connection); 
				 //��ʼת��
				 converter.convert(docfile, pdffile);
				 connection.disconnect();
				 System.out.println("****pdfת���ɹ���PDF�����" + pdffile.getPath()+ "****");  
				
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
                  System.err.println("****swfת���ɹ����ļ������"  
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
	            System.out.println("****swfת������ʼ���������ļ��Ѿ�ת��Ϊswf****");  
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
