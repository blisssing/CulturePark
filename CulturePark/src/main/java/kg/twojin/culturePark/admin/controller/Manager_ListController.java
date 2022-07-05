package kg.twojin.culturePark.admin.controller;

import kg.twojin.culturePark.admin.service.Ad_ManagerListService;
import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class Manager_ListController {

    @Autowired
    Ad_ManagerListService ad_managerListService;

    @Autowired
    PartnerService partnerService;


    @RequestMapping(value = "mgManager.ado")
    public ModelAndView managerList(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        List <ManagerVO> managerList = ad_managerListService.getManagerList();
        List partnerSeqList = null;
        if (managerList != null) {
            // 1. 회사 번호를 리스트에 담음
            for (ManagerVO managerVO : managerList) {
                partnerSeqList.add(managerVO.getComp_seq());
            }

            // 2. 리스트에 담고 있는 정보들을 바탕으로 회사 정보를 불러옴




            mv.addObject("managerList", managerList);
            mv.setViewName("mg_managerList");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("Error", "Proc");
            mv.setViewName("accessError.jsp");
        }
        return mv;
    }

    @RequestMapping(value="mgInfoModal.ado")
    public ModelAndView compInfo(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        List<PartnerVO> partnerList = partnerService.getAllPartner();

        if(partnerList != null){
            mv.addObject("partnerList", partnerList);
            mv.setViewName("mg_managerList");
        }else {
            HttpSession session = request.getSession();
            session.setAttribute("Error","Proc");
            mv.setViewName("accessError.jsp");
        }
        return mv;
    }

}
