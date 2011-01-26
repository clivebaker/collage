require 'json'


class CollageController < ApplicationController

  layout "default"

  def configure
    @collage_template=CollageTemplate.find(params[:id])
    @collage_regions=CollageRegion.find(:all,:conditions => {:collage_template_id=> @collage_template.id})
    @images = Image.find(:all, :limit=>10)
    respond_to do |format|
      format.html
    end
  end

  def choose
    @collage_templates = CollageTemplate.find(:all)
    respond_to do |format|
      format.html
    end
  end
  


  def compile

    @info = JSON.parse(params[:params])
    @collage_template=CollageTemplate.find(params[:collage_template_id])

#    @info.each do |i|
#      properties=(i.to_hash['image']).symbolize_keys
      #properties[:image_id]
#    end



     collage_full_path = File.join(RAILS_ROOT, 'public/images/collage/collage_templates',@collage_template.background)

    unique_timestamp=(Time.now.to_f.to_s).delete(".")
     collage_full_path_finished = File.join(RAILS_ROOT, 'public/images/collage/generated_collages/collage_background'+unique_timestamp+'.jpg')
    @new_image = 'collage/generated_collages/collage_background'+unique_timestamp+'.jpg'


    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    logger.info("Collage Full image Path: #{collage_full_path}")
    logger.info("Collage Finished Full image Path: #{collage_full_path_finished}")
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
     img = MiniMagick::Image.open(collage_full_path)


    width = img[:width]
    height = img[:height]
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    logger.info img
    logger.info width
    logger.info height
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

     a = Array.new(@info.length, Hash.new)


    @info.each_with_index do |i,index|

         properties=(i.to_hash['image']).symbolize_keys
         if properties[:image_id]!=nil
         tmp_path = File.join(RAILS_ROOT, 'public/images/collage_temp/'+properties[:image_id]+"-"+Time.now.to_f.to_s+'.jpg')
        
        tmp = MiniMagick::Image.open(File.join(RAILS_ROOT, 'public/images/', Image.find(properties[:image_id]).file_name))
        tmp.resize((properties[:img_w].to_i*2).to_s+"x"+(properties[:img_h].to_i*2).to_s)

         posx=(properties[:img_x].to_i*2)
         posy=(properties[:img_y].to_i*2)

         if posx >= 0
            posx="-"+(properties[:img_x].to_i*2).to_s
          else
            posx="+"+(properties[:img_x].to_i*-2).to_s
         end
         if posy >= 0
            posy="-"+(properties[:img_y].to_i*2).to_s
         else
           posy="+"+(properties[:img_y].to_i*-2).to_s
         end

         tmp.crop((properties[:div_w].to_i*2).to_s+'x'+(properties[:div_h].to_i*2).to_s+posx+posy)
         tmp.write(tmp_path)
         a[index] = tmp_path
           end
       end


   #  if width > 150 && height > 150
       img.combine_options do |c|

         @info.each_with_index do |i,index|
           properties=(i.to_hash['image']).symbolize_keys
           if properties[:image_id]!=nil
              image_path = a[index]
 
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    logger.info("c.draw \"image Over "+((properties[:div_x].to_i*2).to_s)+","+(properties[:div_y].to_i*2).to_s+" "+(properties[:div_w].to_i*2).to_s+","+(properties[:div_h].to_i*2).to_s+" '"+File.join(image_path)+"'\"")
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

    c.draw "\"image Over "+((properties[:div_x].to_i*2).to_s)+","+(properties[:div_y].to_i*2).to_s+" "+(properties[:div_w].to_i*2).to_s+","+(properties[:div_h].to_i*2).to_s+" '"+File.join(image_path)+"'\""
  
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    logger.info "$$ Image Drawn: $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
  
  
  end
         end
       end
      
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    logger.info "$$ Writing image: #{collage_full_path_finished} $$$$$$$$$$$$$"
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
      
       img.write(collage_full_path_finished)

    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    logger.info "$$$$ Image Written: $$$$$$$$"
    logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

      
      # end

    #Cleanup
    a.each do |file|
        if file.is_a?(String)
           File.delete(file)
        end
    end



     respond_to do |format|
    #   format.html # index.html.erb
       format.js
      # format.xml  { render :xml => @images }
     end


     







  end


  def build

        image = Image.find(params[:id])
        image2 = Image.find(1)

         collage_full_path = File.join(RAILS_ROOT, 'public/images/collage_background.jpg')
         collage_full_path_finished = File.join(RAILS_ROOT, 'public/images/collage_background'+Time.now.to_f.to_s+'.jpg')
         image_full_path = File.join(RAILS_ROOT, 'public/images/', image.file_name)
         image2_full_path = File.join(RAILS_ROOT, 'public/images/', image2.file_name)
         logger.fatal "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
         logger.fatal collage_full_path
         logger.fatal image_full_path
         logger.fatal "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
         img = MiniMagick::Image.open(collage_full_path)


        width = img[:width]
        height = img[:height]
        logger.fatal "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
        logger.fatal width
        logger.fatal height
        logger.fatal "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

         if width > 150 && height > 150
           img.combine_options do |c|
             #c.gravity 'SouthWest'
             # This is RAILS_ROOT/images/watermark.gif
            # c.draw 'circle 100,100 150,150'
            c.draw "image Over 100,100 255,0 '"+image_full_path+"'"
            c.draw "image Over 655,100 255,0 '"+image2_full_path+"'"


           end


           #img.composite '-compose atop -gravity southeast -geometry +10+10 '+image_full_path+' '+collage_full_path+' '+collage_full_path_finished



           img.write(collage_full_path_finished)





         end

         respond_to do |format|
           format.html # index.html.erb
          # format.xml  { render :xml => @images }
         end


       end

  end

