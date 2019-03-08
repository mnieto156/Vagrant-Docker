#!/usr/bin/env python3
import json
import requests
import sys
import re

base_url = sys.argv[1]
job_name = sys.argv[2]
build_number = sys.argv[3]
job_name_url = re.sub(r'([^\/]+)\/([^\/]+)\/([^\/]+)',r'\1/pipelines/\2/branches/\3',job_name)
job_url = base_url + 'blue/rest/organizations/jenkins/pipelines/' + job_name_url + '/runs/' + str(build_number) + '/nodes/?pretty=true'
#response = requests.get(job_url)
#http://my.plci.local/jenkins/job/mario-prueba/job/PLci-usuario2/job/master/52/
#http://my.plci.local/jenkins/blue/rest/organizations/jenkins/pipelines/mario-prueba/pipelines/PLci-usuario2/branches/master/runs/50/nodes/?pretty=true
#${JENKINS_URL}/blue/rest/organizations/jenkins/pipelines/${JOB_NAME}/runs/${BUILD_NUMBER}/nodes/?pretty=true
#http://my.plci.local/jenkins/                            Job_Name:mario-prueba/PLci-usuario2/master => regexr.com/48hd9  
with open('descarga.json') as data_steps:
  data = json.loads(data_steps.read()) 
  nodos_id_url = {}
  aciertos = 0
  errores = 0
  # buscar nodos con result:"SUCCESS"
  for nodo in data:
    if nodo["result"]!="SUCCESS":
        try:
            nodos_id_url[nodo["displayName"]]=nodo["_links"]["self"]["href"]
            errores += 1
        except KeyError:
            print ('Error al leer el nodo.')
    else:
        aciertos += 1

  print ('Errores:' + str(errores))

