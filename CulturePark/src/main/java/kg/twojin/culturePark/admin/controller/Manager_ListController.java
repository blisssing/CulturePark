package kg.twojin.culturePark.admin.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import kg.twojin.culturePark.admin.service.Ad_ManagerListService;
import kg.twojin.culturePark.admin.service.PartnerService;
import kg.twojin.culturePark.common.vo.AdminVO;
import kg.twojin.culturePark.common.vo.ManagerVO;
import kg.twojin.culturePark.common.vo.PartnerVO;
import kg.twojin.culturePark.common.vo.ProductVO;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@RestController
public class Manager_ListController {

    @Autowired
    Ad_ManagerListService ad_managerListService;

    @Autowired
    PartnerService partnerService;


    @RequestMapping(value = "mgManager.ado")
    public ModelAndView managerList(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        List<ManagerVO> managerList = ad_managerListService.getManagerList();
        List partnerSeqList = null;
        if (managerList != null) {
/*            // 1. 회사 번호를 리스트에 담음
            for (ManagerVO managerVO : managerList) {
                partnerSeqList.add(managerVO.getComp_seq());
            }

            // 2. 리스트에 담고 있는 정보들을 바탕으로 회사 정보를 불러옴


            List<PartnerVO> partnerVOList = partnerService.get*/


            mv.addObject("managerList", managerList);
            mv.setViewName("mg_managerList");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("Error", "Proc");
            mv.setViewName("accessError");
        }
        return mv;
    }


    @RequestMapping(value = "partnerInfoModal.ado", method = RequestMethod.POST)
    public void compInfo(@RequestParam int comp_num,
                                 HttpServletRequest request, HttpServletResponse response) throws IOException {

        PartnerVO vo = partnerService.getPartnerBySeq(comp_num);
        System.out.println(vo.toString());

        JSONObject json = new JSONObject();
        json.put("comp_num", vo.getPt_seq());
        json.put("pt_compName", vo.getPt_comp_name());
        json.put("pt_ceoName", vo.getPt_ceo_name());
        json.put("pt_ceoNumber", vo.getPt_ceo_number());
        json.put("pt_tel", vo.getPt_phone());
        json.put("pt_email", vo.getPt_email());
        json.put("pt_agreeDate", vo.getPt_agreeDate());
        json.put("pt_file", vo.getPt_file());


        PrintWriter writer = response.getWriter();
        writer.print(json);

    }
}
