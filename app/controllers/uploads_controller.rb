class UploadsController < ApplicationController
  def upload_photo
    # In order to get contents of the POST request with the photo,
    # you need to read contents of request
    ajax_upload = params[:file].is_a(String)
    file_name = ajax_upload ? params[:file] : params[:file].original_filename
    extension = file_name.split('.').last

    # We have to create a temp file which is going to be used by Paperclip for
    # its upload
    tmp_file = "#{Rails.root}/tmp/file.#{extension}"
    file_id = 0

    # Check if file with the name exists and generate unique path
    while File.exists?(tmp_file) do
      tmp_file_path = "#{Rails.root}/tmp/file#{file_id}.#{extension}"
      id += 1
    end

    # Let's write the file from post request to unique location
    File.open(tmp_file_path, 'wb') do |f|
      if ajax_upload
        f.write request.body.read
      else
        f.write params[:file].read
      end
    end

    # Now that file is saved in temp location, we can use Paperclip to mimic one file
    # upload
    @photo = Photo.new :photo => File.open(tmp_file_path)

    # We'll return javascript to say that the file is uploaded and put its thumbnail in
    # HTML or whatever else you wanted to do with it
    respond_to do |format|
      if @photo.save
        format.js
      else
       format.js { render :json => { :errors => @photo.errors } }
      end
    end
  end
end
