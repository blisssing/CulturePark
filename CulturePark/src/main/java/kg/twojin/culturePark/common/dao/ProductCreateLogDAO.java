package kg.twojin.culturePark.common.dao;

import kg.twojin.culturePark.common.vo.ProductLogVO;

public interface ProductCreateLogDAO {

    int insertLogToPCL(ProductLogVO productLogVO);

    ProductLogVO selectProductLogByPdrSeq(int pt_seq);

}
