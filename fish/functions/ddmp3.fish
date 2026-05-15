function ddmp3 --wraps='yt-dlp --force-ipv4 -t mp3' --description 'Download Youtube video as MP3'
    yt-dlp --force-ipv4 -t mp3 $argv
end
