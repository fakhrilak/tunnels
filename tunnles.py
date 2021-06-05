from flask import Flask
import os
import json
import time
import libtmux
server = libtmux.Server()
app = Flask(__name__)

@app.route('/')
def tunnels():
    os.system("curl  http://localhost:4040/api/tunnels > tunnels.json")
    with open('tunnels.json') as data_file:    
        datajson = json.load(data_file)
    msg = "ngrok URL's: \n'"
    uri_local = "\nlocal URL's: \n'"

    for i in datajson['tunnels']:
        msg = i['public_url']
        uri_local = "\nlocal URL's: \n'" + i["config"]["addr"]
    return msg



