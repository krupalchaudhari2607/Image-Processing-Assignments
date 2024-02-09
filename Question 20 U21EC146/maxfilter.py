from PIL import Image, ImageFilter 
   
# creating a image object 
im1 = Image.open(r"C:\Users\sadow984\Desktop\download2.JPG") 
   
# applying the max filter 
im2 = im1.filter(ImageFilter.MaxFilter(size = 3)) 
   
im2.show() 