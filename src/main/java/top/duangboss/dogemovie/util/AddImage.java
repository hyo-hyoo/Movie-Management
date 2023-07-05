package top.duangboss.dogemovie.util;

import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;

public class AddImage {	
	public void uploadFilmImageSignal(String imageFolder, int id, UploadImageFile image) {
		String fileName = Integer.toString(id) + ".jpg";
		
		File f = new File(imageFolder + "img/filmSignal", fileName);
        if(!f.getParentFile().exists()) {
        	f.getParentFile().mkdirs();
		}
        if(!f.exists()) {
        	f.delete();
		}
        
        try {
            image.getImage().transferTo(f);
            BufferedImage img = ImageUtil.change2jpg(f);
            ImageIO.write(img, "jpg", f);

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public void uploadFilmImageDetail(String imageFolder, int fdppid, UploadImageFile image) {
		String fileName = Integer.toString(fdppid) + ".jpg";
		
		System.out.println(fdppid + "!!!");
		
		File f = new File(imageFolder + "img/filmDetail", fileName);
        if(!f.getParentFile().exists()) {
        	f.getParentFile().mkdirs();
		}
        if(!f.exists()) {
        	f.delete();
		}
        
        try {
            image.getImage().transferTo(f);
            BufferedImage img = ImageUtil.change2jpg(f);
            ImageIO.write(img, "jpg", f);

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public void uploadStuffImage(String imageFolder, int id, UploadImageFile image) {
		String fileName = Integer.toString(id) + ".jpg";
		
		File f = new File(imageFolder + "img/stuff", fileName);
        if(!f.getParentFile().exists()) {
        	f.getParentFile().mkdirs();
		}
        try {
            image.getImage().transferTo(f);
            BufferedImage img = ImageUtil.change2jpg(f);
            ImageIO.write(img, "jpg", f);

        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public void uploadUserImage(String id, UploadImageFile image) {
	}
}
