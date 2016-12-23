# Spech2Text

1) Google Cloud SDK (Software development Kit

2) google-service-account -> amministratore di progetto

3)  speech2text-project

Ho preso spunto da Palaver 

Palaver funziona cosi': c'e' una hotkey che chiama hotkey_switch: Registra o analizza il comando registrato

registrare e' facile

send_speech speech.flac (sostituito)

recognize che chiama recognition/dictionary (che e' complicato)

Aegisub (per mettere i sottotitoli) import audio from video

```
sudo apt-get install python python-alsaaudio

sudo apt-get install python python-nltk

sudo apt-get install python python-sympy

https://cloud.google.com/speech/docs/getting-started

https://console.cloud.google.com/billing/009F00-2EB75F-C4C56E/budgets

ottieni un json che ti identifica
```
######################################################################

```
cd Google_rec/

./Rec_stop.sh

Parla

./Rec_stop.sh

Ora upload speech.flac che hai appena registrato (se hai dubbi sox --i speech.flac)

../Scaricati/google-cloud-sdk/bin/gsutil cp speech.flac gs://gs://speech2text_db
 
Ok e sovrascrive il file, se c'e' gia' ==> e' assolutamente perfetto
```

```
##ora si tratta di fare il parsing

export GOOGLE_APPLICATION_CREDENTIALS=/home/gfasanel/Scaricati/speech2text-project-0541f31045fe.json

../Scaricati/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

access_token=`../Scaricati/google-cloud-sdk/bin/gcloud auth print-access-token`

curl -s -k -H "Content-Type: application/json"     -H "Authorization: Bearer $access_token"     https://speech.googleapis.com/v1beta1/speech:syncrecognize     -d @sync-request.json | tee last_result.log

source do.sh (in base al testo parsato fa qualcosa)
```
```
####il suo esempio
curl -s -k -H "Content-Type: application/json" \
    -H "Authorization: Bearer $access_token" \
    https://speech.googleapis.com/v1beta1/speech:syncrecognize \
    -d @sync-request-original.json
che usa https://storage.googleapis.com/cloud-samples-tests/speech/brooklyn.flac


{
  "error": {
    "code": 400,
    "message": "Number of channels in request does not match FLAC header.",
    "status": "INVALID_ARGUMENT"
  }
}

al che ho capito che era per il numero di canali e quindi:
rec -c 1 (vuol dire: registra con un canale solo) e funziona alla grandissima
```