class PollyController < ApplicationController
    include ActionController::Live
    
    def read 
        polly = Aws::Polly::Client.new

        resp = polly.synthesize_speech({
            output_format: "mp3",
            text: params[:text],
            voice_id: "Zhiyu",
        })
       
        # response.headers['Content-Type'] = "mp3/event-stream"
        # response.stream.write  resp.audio_stream
        # response.stream.close
        # rails error: undefined method `empty?' for #<StringIO:0x00007fbc8c3ef198>
       
        # send_data resp.audio_stream, filename: "#{params[:text]}.mp3", disposition: 'attachment'
        #terminal: sent data (filename) browser console: failed to load because no supported source was found

        IO.copy_stream(resp.audio_stream, "#{params[:text]}.mp3") # successfully creates audio file in app folder
        send_file "#{params[:text]}.mp3"
    end
end