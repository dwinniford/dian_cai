class PollyController < ApplicationController
    include ActionController::Live
    
    def read 
        polly = Aws::Polly::Client.new

        resp = polly.synthesize_speech({
            output_format: "mp3",
            text: params[:text],
            voice_id: "Zhiyu",
        })
        # return resp.audio_stream
        # response.headers['Content-Type'] = "mp3"
        # response.stream.write resp.audio_stream
        # response.stream.close
        IO.copy_stream(resp.audio_stream, "#{params[:text]}.mp3") # successfully creates audio file in app folder
        send_file "#{params[:text]}.mp3"
        # send_data resp.audio_stream, type: "mp3"
    end
end