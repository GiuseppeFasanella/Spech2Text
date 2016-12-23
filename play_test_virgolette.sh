test=$(find /home/gfasanel/Scaricati/ -iname "*Dumb*" | head -2 | grep Oaks)
test=$(echo $test| sed "s/\ /\\\ /g")
vlc $test #non funziona
ma se faccio echo $test
/home/gfasanel/Scaricati/Musica/dumbarton/Igor\ Stravinsky\ conducts\ his\ Dumbarton\ Oaks\ Concerto.mp4

e poi lo copio e incollo

vlc copia_e_incollato allora funziona!!! Misteri della programmazione --> non capisce bene \ lo spazio

#####cosi' funziona bene
test2=$(find /home/gfasanel/Scaricati/ -iname "*Dumb*"|grep score)
gfasanel@Amerigo:~$ vlc $test2

Elimina gli spazi sostanzialmente


==> Ho capito!!!!! basta dargli la variabile tra virgolette
test=$(find /home/gfasanel/Scaricati/ -iname "*Dumb*" | head -2 | grep Oaks)
test=$(echo $test| sed "s/\ /\\\ /g")
vlc "$test" #non funziona
--> vaffanculo sembrava promettente e invece NO