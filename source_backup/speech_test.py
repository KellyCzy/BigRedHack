filepath = "gs://bigredhack-41367.appspot.com/"
output_filepath = "gs://bigredhack-41367.appspot.com/"
bucketname = "brh"

# Import libraries
from pydub import AudioSegment
import io
import os
from google.cloud import speech
from google.cloud.speech import enums
from google.cloud.speech import types
import wave
from google.cloud import storage

def m4a_to_wav(audio_file_name):
    if audio_file_name.split('.')[1] == 'm4a':    
        sound = AudioSegment.from_file(audio_file_name, "m4a")
        audio_file_name = audio_file_name.split('.')[0] + '.wav'
        sound.export(audio_file_name, format="wav")
        return audio_file_name

def stereo_to_mono(audio_file_name):
    sound = AudioSegment.from_wav(audio_file_name)
    sound = sound.set_channels(1)
    sound.export(audio_file_name, format="wav")

def frame_rate_channel(audio_file_name):
    with wave.open(audio_file_name, "rb") as wave_file:
        frame_rate = wave_file.getframerate()
        channels = wave_file.getnchannels()
        return frame_rate,channels

def upload_blob(bucket_name, source_file_name, destination_blob_name):
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    blob.upload_from_filename(source_file_name)

def delete_blob(bucket_name, blob_name):
    storage_client = storage.Client()
    bucket = storage_client.get_bucket(bucket_name)
    blob = bucket.blob(blob_name)

    blob.delete()

def google_transcribe(audio_file_name):
    
    file_name = filepath + audio_file_name
    file_name = m4a_to_wav(file_name)
    audio_file_name = audio_file_name.split('.')[0] + '.wav'
    
    frame_rate, channels = frame_rate_channel(file_name)
    
    if channels > 1:
        stereo_to_mono(file_name)

    bucket_name = bucketname
    source_file_name = filepath + audio_file_name
    destination_blob_name = audio_file_name
    
    upload_blob(bucket_name, source_file_name, destination_blob_name)
    
    gcs_uri = 'gs://' + bucketname + '/' + audio_file_name
    transcript = ''

    client = speech.SpeechClient()
    audio = types.RecognitionAudio(uri=gcs_uri)

    config = types.RecognitionConfig(
    encoding=enums.RecognitionConfig.AudioEncoding.LINEAR16,
    sample_rate_hertz=frame_rate,
    language_code='en-US')

    # Detects speech in the audio file
    response = client.recognize(config, audio)

    for result in response.results:
        transcript += result.alternatives[0].transcript

    delete_blob(bucket_name, destination_blob_name)

    transcript_filename = audio_file_name.split('.')[0] + '.txt'
    write_transcripts(transcript_filename,transcript)
    
    return filepath + transcript_filename

def write_transcripts(transcript_filename,transcript):
    f= open(output_filepath + transcript_filename,"w+")
    f.write(transcript)
    f.close()

    upload_blob(bucketname, output_filepath + transcript_filename, transcript_filename)

# if __name__ == '__main__':
# 	audio_file_name = "1.m4a"
# 	transcript = google_transcribe(audio_file_name)
# 	transcript_filename = audio_file_name.split('.')[0] + '.txt'
# 	write_transcripts(transcript_filename,transcript)