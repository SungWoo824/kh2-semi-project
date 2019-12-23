package semi.servlet.hostel;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import beans.FilesDao;
import beans.FilesDto;
import beans.HostelDao;
import beans.HostelDto;

@WebServlet(urlPatterns = "/hostel/hostel_regist.do")
public class HostelRegistServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			MultipartRequest mRequest = new MultipartRequest(
						req, "C:/Users/blue2/Desktop/이가영/프로젝트", 10*1024*1024, "UTF-8", 
						new DefaultFileRenamePolicy());			

			req.setCharacterEncoding("UTF-8");

			String region_name = mRequest.getParameter("region_name");
			String city_name = mRequest.getParameter("city_name");

			HostelDto dto = new HostelDto();
			HostelDao dao = new HostelDao();

			int region_no = dao.getRegionNo(region_name, city_name);
			
			String member_id = (String) req.getSession().getAttribute("id");
			int owner_no = dao.getOwnerNo(member_id);

			dto.setOwner_no(owner_no);
			dto.setRegion_no(region_no);
			dto.setHostel_name(mRequest.getParameter("hostel_name"));
			dto.setHostel_phone(mRequest.getParameter("hostel_phone"));
			dto.setHostel_detail_addr((mRequest.getParameter("postcode")+mRequest.getParameter("address")+mRequest.getParameter("detailAddress")+mRequest.getParameter("extraAddress")));
			dto.setHostel_latitude(mRequest.getParameter("hostel_latitude"));
			dto.setHostel_longitude(mRequest.getParameter("hostel_longitude"));
			dto.setHostel_content(mRequest.getParameter("hostel_content"));
			dto.setHostel_kind_name(mRequest.getParameter("hostel_kind_name"));

			dao.regist(dto);
			
		
			File file = mRequest.getFile("file");
			if(file != null) {
				FilesDto fdto = new FilesDto();
				//fdto.setHostel_no();//게시글번호
				fdto.setUploadname(mRequest.getOriginalFileName("file"));//업로드이름
				fdto.setSavename(mRequest.getFilesystemName("file"));//실저장이름
				fdto.setFiletype(mRequest.getContentType("file"));//파일유형
				fdto.setFilesize(file.length());//파일 크기
			
				FilesDao fdao = new FilesDao();
				fdao.HostelUpload(fdto);
			}

//			[3] 출력(이동)
			resp.sendRedirect("2regist_room_info.jsp");
			
		}
		catch (Exception e) {

			e.getStackTrace();
			resp.sendError(500);

		}
	}
}