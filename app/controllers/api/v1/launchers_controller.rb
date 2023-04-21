module Api
  module V1
    class LaunchersController < Api::ApiController
      before_action :authenticate_token!
      before_action :set_launch, only: [:show, :update, :destroy]

      # GET api/v1/
      def message
        render json: { message: I18n.t("launch.import_running") }
      end

      # GET api/v1/import_launchers
      def import_launchers
        # Endpoint caso queira rodar a importação pela pŕopria api de forma assíncrona
        ImportLaunchersJob.perform_async

        render json: { message: I18n.t("launch.async_import_running") }
      end

      # GET api/v1/launchers
      def index
        @launchers = Launch.all
          .page(params[:page] || 1)
          .per(100)

        render json: { launchers: @launchers, meta: pagination_meta(@launchers) }
      end

      # GET api/v1/launchers/:launcher_id
      def show
        render json: { launcher: @launch }
      end

      # POST api/v1/launchers
      def create
        launch = Launch.new(launch_params)

        if launch.save
          render json: launch, status: :ok
        else
          render(
            json: { error: launch.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      # POST api/v1/launchers/:launcher_id
      def update
        if @launch.update(launch_params)
          render json: @launch, status: :ok
        else
          render(
            json: { error: @launch.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      # DELETE api/v1/launchers/:launcher_id
      def destroy
        if @launch.destroy
          head :no_content
        else
          render(
            json: { successful: false, error: @launch.errors.full_messages },
            status: :unprocessable_entity
          )
        end
      end

      private

      def set_launch
        @launch = Launch.where(params[:id]).first

        return @launch if @launch.present?

        render json: { successful: false, error: I18n.t("launch.not_found") }, status: :not_found
      end

      def launch_params
        params
          .permit(
            :url,
            :launch_library_id,
            :slug,
            :name,
            :net,
            :window_end,
            :window_start,
            :inhold,
            :tbdtime,
            :tbddate,
            :probability,
            :holdreason,
            :failreason,
            :hashtag,
            :webcast_live,
            :image,
            :infographic,
            :imported_t,
            :import_id,
            :last_import_code,
            :import_status,
            :launch_service_provider,
            :mission,
            :pad,
            :program,
            :rocket,
            :status
          )
      end
    end
  end
end
