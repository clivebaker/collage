class CollageTemplate < ActiveRecord::Base

  has_many :collage_regions


  attr_accessor :datafile


  before_save :file_upload





  def file_upload
    unique_timestamp=(Time.now.to_f.to_s).delete(".")
    self.background =  unique_timestamp+"_"+datafile.original_filename

    logger.fatal("££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££")
    logger.fatal("datafile name: " + name)
    logger.fatal("££££££££££££££££££££££££££££££££££££££££££££££££££££££££££££")

    directory = "public/images/collage/collage_templates"
    # create the file path
   path = File.join(directory, self.background)
   # write the file
   File.open(path, "wb") { |f| f.write(datafile.read) }
  end



  def self.save(upload)
    name =  upload['datafile'].original_filename

    logger.fatal("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
    logger.fatal("datafile name: " + name)
    logger.fatal("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")

   directory = "public/images/collage_templates"
   # create the file path
   path = File.join(directory, name)
   # write the file
   File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end



end
