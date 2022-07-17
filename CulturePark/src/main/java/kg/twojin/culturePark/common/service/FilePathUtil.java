package kg.twojin.culturePark.common.service;

public interface FilePathUtil {

    String ThumbFilePathToDBForm(String thumbnail);

    String MainImgFilePathToDBForm(String mainImg);

    String DescriptionFileToDBForm(String description);

}
