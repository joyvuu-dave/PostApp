module Api
  class ImagesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    # POST /api/images
    # params => image: { url: String, post_id: Integer }
    def create
      image = Image.new(image_params)
      if image.save
        render json: image 
      else
        render json: { error: 'Image could not be created', status: :unprocessible_entity }
      end
    end

    # DELETE /api/images/:id
    def destroy
      image = Image.find_by_id(params[:id])
      if image.destroy
        render json: { message: 'Image deleted', status: :ok }
      else
        render json: { error: 'Image could not be destroyed', status: :unprocessible_entity }
      end
    end

    private

      def image_params
        params.require(:image).permit(:url, :post_id)
      end
  end
end
