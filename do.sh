RESULT=$(cat last_result.log | grep transcript | awk -F":" '{print $2}'| awk -F"," '{print $1}' |awk -F"\"" '{print $2}'|awk -F"\"" '{print $1}')
echo $RESULT
#Move this in python: it's a long journey now :-)                                                                                                                               
if [ "$RESULT" = "test test" ]; then
    echo "ehi"
    vlc ~gfasanel/Scaricati/Musica/Note_del_guanciale_Luca_Mosca_2002/10_11_12_di_21.mp4
fi
