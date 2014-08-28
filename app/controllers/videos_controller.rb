class VideosController < ApplicationController
  before_action :set_user
  before_action :set_video, only: [:show, :edit, :update, :qr]

  # GET /videos
  # GET /videos.json
  def index
    if @user.admin_flag != 1
      @search = @user.videos.search(params[:q])
      # binding.pry
      @videos = @search.result.page(params[:page]).per(10)
    else
      @search = Video.search(params[:q])
      @all_videos = @search.result.page(params[:page]).per(10)
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = @user.videos.build
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = @user.videos.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to user_videos_path(:user_id => @user.id), notice: '作成されました。' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # # DELETE /videos/1
  # # DELETE /videos/1.json
  # def destroy
  #   @video.destroy
  #   respond_to do |format|
  #     format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def qr
    # 「Hello Wolrd!!」いう文字列、サイズは8、誤り訂正レベルHのQRコードを生成する
    qr = RQRCode::QRCode.new( @video.url.to_s, :size => 8, :level => :h )

    #200×200にリサイズして「hello_world.png」というファイル名で保存する
    qr.to_img.resize(200, 200).save("app/assets/images/qr" + @video.id.to_s + ".png")

  end

  def plural_destroy
    for video in params[:video]
      if video["delete_check"]
        to_destroy_video = Video.find(video["id"])
        to_destroy_video.destroy
      end
    end
    redirect_to user_videos_path(:user_id => @user.id)
  end

  private
    def set_user
      @user = current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:name, :start_date, :url, :user_id, id: [])
    end
end
