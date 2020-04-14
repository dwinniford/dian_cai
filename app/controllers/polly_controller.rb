class PollyController < ApplicationController
    def read 
        polly = Aws::Polly::Client.new

        resp = polly.synthesize_speech({
            output_format: "mp3",
            text: params[:text],
            voice_id: "Zhiyu",
        })
        # IO.copy_stream(resp.audio_stream, "nali.mp3") # successfully creates audio file in app folder
        resp.audio_stream
        
        
        
    end
end