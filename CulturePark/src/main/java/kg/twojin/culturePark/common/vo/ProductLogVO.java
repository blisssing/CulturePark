package kg.twojin.culturePark.common.vo;


import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ProductLogVO {
    int pd_seq, pt_seq, ad_seq, pdr_seq;
    String ad_email, pt_comp_name, pd_title, pcl_status, pcl_comments;
}
