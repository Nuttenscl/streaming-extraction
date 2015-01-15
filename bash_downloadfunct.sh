downloadfromembemdedyouwatch(){
	if [ $# -eq 0 ]
	then
		echo -e "Missing arguments\nusage: downloadfromembemdedyouwatch youwatchurl serietitle saison episode \n";
		return 1 ;
	fi
	curl --silent  $1  |egrep -oh "video\|[^|]*\|.*\|.*\|setup" |sed 's;video|\([^|]*\)|\([^|]*\)|\([^|]*\)|setup;wget http://\3.youwatch.org:\2/\1/video.mp4;g' |sed "s,$, -O $2_s$3_e$4.mp4,g";

}


downloadfromarte(){ 
        if [ $# -eq 0 ]
        then
                echo -e "Missing arguments\nusage: downloadfromarte name artecode episode  \n";
                return 1 ;
        fi
	w3m http://arte.tv/papi/tvguide/videos/stream/player/F/$2-$3_PLUS7-F/ALL/ALL.json | grep -Po '"url":"[^\"]*A_SQ_2_VF-STF[^\"]*"' |sed 's,"url":",rtmpdump -r "rtmp://artestras.fcod.llnwd.net/a3903/o35/mp4:,g' | sed "s,$, -o  $1_e$3.mp4 ,g" ; 
}


extractyouwatch(){ 
        if [ $# -eq 0 ]
        then
                echo -e "Missing arguments\nusage: extractyouwatch regarderfilmgratuit_url min_episode max_episode \n #example of urls:  \n  * http://streamzzz.com/page/penny-dreadful-saison-1-episode- \n  * http://www.regarder-film-gratuit.com/greys-anatomy-saison-2-episode- \n";
                return 1 ;
        fi
	for ((i = $2; i <= $3; i++)); do echo "Episode $i" ; curl --silent $1$i/ |egrep -o "http://youwatch.*800x460.html"; done 
}

function downloadfromcanal(){
	if [ $# -eq 0 ]
	then
		echo -e "Missing arguments\nusage: downloadfromcanal progurl outputname ";
		return 1 ;
	fi
	
	EMISSADDR=$1
	VIDEOID=$(curl -s $EMISSADDR |egrep -o 'swf\?vid=[0-9]+' |sed 's;.*=;;g')
	EMISSNOM=$2
	if [ -z "$2" ]
	then
		EMISSNOM="output"
	fi
	
	echo "# from $EMISSADDR  ----  #videoid $VIDEOID ------ output:$EMISSNOM.mp4 ";
	echo 'rm /tmp/segment*.ts ;'
	curl -s $(curl -s $(curl -s http://service.canal-plus.com/video/rest/getVideosLiees/cplus/$VIDEOID | egrep -o '<HLS>[^<]*</HLS>' |tail -1 |sed 's;<HLS>\(.*\)</HLS>;\1;g') |tail -1) |sed -n 's;http\(.*\)segment\([0-9]*\)_3_av.ts;wget \ "http\1segment\2_3_av.ts" -O /tmp/segment_\2.ts \;;p' ;
	
	echo "rename 's/t_(\d{2})\./t_0\$1\./g' /tmp/*.ts"
	echo "rename 's/t_(\d{1})\./t_00\$1\./g' /tmp/*.ts"
	
	
	echo 'avconv -i "concat:$( printf "%s|" /tmp/segment*.ts)" -c copy '$EMISSNOM'.mp4' ;
	
}

downloadSecretState(){ w3m http://arte.tv/papi/tvguide/videos/stream/player/F/048911-00$1_PLUS7-F/ALL/ALL.json | grep -Po '"url":"[^\"]*A_SQ_2_VO-STF[^\"]*"' |sed 's,"url":",rtmpdump -r "rtmp://artestras.fcod.llnwd.net/a3903/o35/mp4:,g' | sed "s,$, -o  Secret_State_VO_s01e0$1.mp4 ,g" ; }
