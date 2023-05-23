# -*- coding: utf-8 -*-
from logging.handlers import TimedRotatingFileHandler
from datetime import datetime
import calendar
import logging
from flask import Flask, request, jsonify
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
import datetime
from selenium.webdriver.support import expected_conditions as EC
import re
import datetime
import requests
#from pyzwcad import ZwCAD, APoint
import time
# import load_workbook
from openpyxl import load_workbook
import json
# Paramètres pour le navigateur
options = webdriver.ChromeOptions()
options.add_argument('--headless')  # exécuter en mode têteless (sans interface graphique)
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')


def test_scrapping():

# Création de l'instance du navigateur
   driver = webdriver.Chrome(options=options)
#url = 'https://odoo.gexpertise.fr/web#id=94933&action=311&active_id=18&model=helpdesk.ticket&view_type=form&menu_id>   new_url = 'https://odoo.gexpertise.fr/web#id=94933&action=311&active_id=18&model=helpdesk.ticket&view_type=form&m>   url = requests.get('http://10.252.216.10:5008/')
   print(url.status_code)
   test1 = url.text
   driver.get(test1)
   username = driver.find_element(By.ID,"login")
   password = driver.find_element(By.ID,"password")
   username.send_keys("GexApp Pôle Développement")
   password.send_keys("Ppr9QX1RlqlB")


# getting the button by class name

   button1 = driver.find_element(By.XPATH,'//button[@type="submit"]').click()
# clicking on the button
#button1.click()
#**********************Nom_Mission **********************
   element = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[5]/table[2]/tbody/tr[8]/td[2]/a[@class='o_form_uri o_field_widget o_quick_editable']/span")))
   Mission = element.get_attribute("innerHTML")
   Mission = Mission.split('-')
   Mission = Mission[0]
   print('Mission :', Mission)


#**********************Cree le **********************
   element1 = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[5]/table/tbody/tr[10]/td[2]/span[@class='o_field_date o_field_widget o_quick_editable']")))
   global Cree_le
   Cree_le = element1.get_attribute("innerHTML")
   print('Cree_le :', Cree_le)
   Cree_le_extension = datetime.datetime.strptime(str(Cree_le),'%d/%m/%Y').strftime('%b %Y') #%B full name et %b sho>   print("forme_finale de la date ", Cree_le_extension)
   Cree_le_extension = requests.post('http://10.252.216.10:5008/cree_le_extension', data=Cree_le_extension)   

   def fxn(stng):

    # add first letter
    oupt = stng[0]

    # iterate over string
    for i in range(1, len(stng)):
        if stng[i-1] == ' ':

            # add letter next to space
            oupt += stng[i]

    # uppercase oupt
    oupt = oupt.upper()
    return oupt
   #**********************Client **********************
   element = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[5]/table[2]/tbody/tr/td[2]/a[@class='o_form_uri o_field_widget o_quick_editable field_partner_id']"))
      )
   Client = element.get_attribute("innerHTML")
   to_clean = re.compile('<.*?>')
   Client_newt = re.sub(to_clean, '', Client)
   global Cree_par
   Cree_par = fxn(Client_newt)
   #*********************RDE***************************
   element = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[5]/table/tbody/tr[14]/td[2]/div/div/a/span/span[@class='o_tag_badge_text']"))
      )
   RDE = element.get_attribute("innerHTML")
   print('RDE :', RDE)
   RDE = RDE.split("RDE :")[1]
   rde = requests.post('http://10.252.216.10:5008/RDE', data=(fxn(RDE)))

 #**********************Full_address**********************
   element = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[5]/table[2]/tbody/tr[10]/td[2]/a[@class='o_form_uri o_field_widget o_quick_editable o_readonly_modifier']/span"))
      )
   global full_address
   full_address = element.get_attribute("innerHTML")
   print('full_address :', full_address)
   #***********************Commune**************************

   # Remplacez "votre_clé_api" par votre propre clé API
   url = "https://api-adresse.data.gouv.fr/search/?q=19+rue+emmy+noether+93400+saint-ouen&limit=1"
   # Adresse statique
   # adresse = "140 Boulevard Macdonald, 75019 Paris"
   # Modifier l'URL avec l'adresse statique
   url = "https://api-adresse.data.gouv.fr/search/?q=" + full_address.replace(" ", "+") + "&limit=1"
   response = requests.get(url)
   data = response.json()
   # Extraire le nom de la commune
   commune = data["features"][0]["properties"]["city"]
   commune = commune.upper()
   # Vérifier si le nom de la commune commence par "PARIS"
   if commune.startswith("PARIS"):
      commune = "VILLE DE PARIS"
      commune = requests.post('http://10.252.216.10:5008/commune', data=commune)
   else:
      commune =  commune.upper()
      commune = requests.post('http://10.252.216.10:5008/commune', data=commune)



   driver.find_element(By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[5]/table[2]/tbody/tr[10]/td[2]/a[@class='o_form_uri o_field_widget o_quick_editable o_readonly_modifier']/span").click()

   #***********************_lattt**********************
   element = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[3]/table[2]/tbody/tr/td[2]/span[@class='o_field_float o_field_number o_field_widget o_quick_editable o_readonly_modifier']"))
      )
   global latitude
   latitude = element.get_attribute("innerHTML")
   latitude = latitude.replace(",", ".")
   print(latitude)  # Output: 2.30734
 #**********************long__**********************
   element = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[3]/table[2]/tbody/tr[2]/td[2]/span[@class='o_field_float o_field_number o_field_widget o_quick_editable o_readonly_modifier']"))
      )
   global longitude
   longitude = element.get_attribute("innerHTML")
   longitude = longitude.replace(",", ".")


   #***********************code lieu **********************
   element = WebDriverWait(driver, 10).until(
         EC.presence_of_element_located((By.XPATH, ".//div/div/div[2]/div/div/div[2]/div[3]/table/tbody/tr[2]/td[2]/span[@class='o_field_char o_field_widget o_quick_editable o_readonly_modifier']"))
      )
   global num_livrable
   num_livrable = element.get_attribute("innerHTML")
   print("num_livrable", num_livrable)

   print('Full Address :', full_address)
   address = full_address.split(',')
   print("test_adress", address )
   address1 = address[0]
   print("L'ADRESSE est la suivante: ", address[0] )
   adress = requests.post('http://10.252.216.10:5008/address1', data=address1)


   Mission = requests.post('http://10.252.216.10:5008/Mission', data=Mission)
   num_livrable = requests.post('http://10.252.216.10:5008/num_livrable', data=num_livrable)
   Cree_le = requests.post('http://10.252.216.10:5008/Cree_le', data=Cree_le)
   Cree_par = requests.post('http://10.252.216.10:5008/Cree_par', data=Cree_par)
   destination = requests.get('http://10.252.216.10:5008/destination')
   driver.quit()

   def localisation_extract_v01(adresse):
              # URL de l'API "Adresse"
              url = "https://api-adresse.data.gouv.fr/search/"
              # paramètres de la requête
              params = {
                   "q": adresse,
                   "limit": 1
                  }
              # envoi de la requête à l'API
              response = requests.get(url, params=params)
              properties = response.json()["features"][0]["properties"]

              if "housenumber" in properties:
                   number = properties["housenumber"]
                   number = requests.post('http://10.252.216.10:5008/number', data=number)
              else:
                   number = ""
                   number = requests.post('http://10.252.216.10:5008/number', data=number)
      # extraction du département à partir de la réponse JSON
              city = response.json()["features"][0]["properties"]["city"]
              if city == "Paris":
                     distinct  = response.json()["features"][0]["properties"]["district"]
                     print("distinct", distinct)
                     a = "Paris"
                     if (a in distinct):
                          distinct = " ".join(distinct.split()[1:])
                          print("city_after modif", distinct )
                          distinct = "("+distinct+")"
                          departement = requests.post('http://10.252.216.10:5008/departement', data=distinct)
                     else:
                          print("distinct", distinct)
              else:
                    context  = response.json()["features"][0]["properties"]["context"]
                    elements = context.split(", ")
                    numero_departement = elements[0]
                    nom_departement = elements[1]
                    region = elements[2]
                    print(f"Numéro de département : {numero_departement}")
                    print(f"Nom du département : {nom_departement}")
                    print(f"Région : {region}")
                    # extraction du code postal à partir de la réponse JSON
                    code_postal = data["features"][0]["properties"]["postcode"]
                    print("code_postal", code_postal)
                    code_postale = requests.post('http://10.252.216.10:5008/code_postale', data=code_postal)
                    departement_name = "("+code_postal + "-" + nom_departement+")"
                    departement = requests.post('http://10.252.216.10:5008/departement', data=departement_name)
                    
             # extraction du number+streeet+coordinates  à partir de la réponse JSON
             # number = response.json()["features"][0]["properties"]["housenumber"]



              street = response.json()["features"][0]["properties"]["street"]
              street = street[0].lower() + street[1:]
              print(street)
              destination = requests.get('http://10.252.216.10:5008/destination')
              #number = requests.post('http://10.252.216.10:5008/number', data=number)
              street = requests.post('http://10.252.216.10:5008/street', data=street)
              adresse = response.json()["features"][0]["geometry"]["coordinates"]
              return(adresse)
   
   

   def localisation_extract(address):

            #Extraire
            city_address = {'q': address}
            r = requests.get('https://geocodage.ign.fr/look4/address/search', params=city_address).json()
            #response= requests.get('https://geocodage.ign.fr/look4/address/search?q=140 boulevard Macdonald').json()
            adresse = r.get('features')[0].get('geometry').get('coordinates')
            global city
            city = r.get('features')[0].get('properties').get('city')
            print("city est ", city)
            # a= "Paris 19e Arrondissement"
            a = "Paris"
            if (a in city):
               city = " ".join(city.split()[1:])
               print("city_after modif", city )
            else:
               print("city_after modif", city )

            city = requests.post('http://10.252.216.10:5008/city', data=city)
            #Définition des polices pour des styles de texte spécifiques
            global number
            global street
            number = r.get('features')[0].get('properties').get('number')
            street = r.get('features')[0].get('properties').get('street')

            print(city, number, street)
            destination = requests.get('http://10.252.216.10:5008/destination')
            number = requests.post('http://10.252.216.10:5008/number', data=number)
            street = requests.post('http://10.252.216.10:5008/street', data=street)
            return (adresse)
   

   def cadastre_extract():
          #n= localisation_extract(address1)
          n = localisation_extract_v01(full_address)
          filter = {'type':'point', 'coordinates': n}
          payload1 = {'searchGeom': json.dumps(filter)}
          #payload1 = {'searchGeom': json.dumps(coordinates)}
          #https://geocodage.ign.fr/look4/parcel/reverse?searchGeom={"type":"Point","coordinates":[2.379032,48.899039]}
          response= requests.get('https://geocodage.ign.fr/look4/parcel/reverse', params=payload1).json()
          features = response.get('features')
          if features and len(features) > 0:
               global section_name
               global section_num
               global cadastre
               section_num  = response.get('features')[0].get('properties').get('numero')
               section_name = response.get('features')[0].get('properties').get('section')
               chr_spec = "n\u1D52"
               cadastre = "Cadastre : Section "+chr_spec+ " n "+ section_num
               print ("cadastre", cadastre)
               cadastre = requests.post('http://10.252.216.10:5008/cadastre', data=cadastre)
            # Faites quelque chose avec first_feature
          else:
               print("La liste features est vide.")
               section_name = ""
               section_num = ""
               cadastre = "Cadastre : Section "+section_name+ " n "+ section_num
               print ("cadastre", cadastre)
               cadastre = requests.post('http://10.252.216.10:5008/cadastre', data=cadastre)

         # global commune_name
         # commune_name = response.get('features')[0].get('properties').get('nomCommune')
         # if commune_name == "Paris":
          #   commune_name = "VILLE DE PARIS"
          #   commune = requests.post('http://10.252.216.10:5008/commune', data=commune_name)
          #else:
           #  commune_name =  commune_name
           #  commune = requests.post('http://10.252.216.10:5008/commune', data=commune_name)


          cadastre = requests.post('http://10.252.216.10:5008/cadastre', data=cadastre)
          section_num = requests.post('http://10.252.216.10:5008/section_num', data=section_num)
          section_name = requests.post('http://10.252.216.10:5008/section_name', data=section_name)



   #cadastre_extract()

   def cadastre_extract_API_FROM_ODOO(longitude,latitude):
          filter = {'type':'point', 'coordinates': [longitude,latitude]}
          payload1 = {'searchGeom': json.dumps(filter)}
          response= requests.get('https://geocodage.ign.fr/look4/parcel/reverse', params=payload1).json()
          features = response.get('features')
          if features and len(features) > 0:
               global section_name
               global section_num
               global cadastre
               section_num  = response.get('features')[0].get('properties').get('numero')
               section_num = str(section_num).lstrip('0')
               section_name = response.get('features')[0].get('properties').get('section')
               if section_name.startswith("0"):  # vérifie si le nom commence par un zéro
                   section_name = section_name[1:]  # supprime le premier caractère (le zéro)
               cadastre = "Cadastre : Section "+section_name+ " n "+ section_num
               print ("cadastre", cadastre)
               cadastre = requests.post('http://10.252.216.10:5008/cadastre', data=cadastre)
            # Faites quelque chose avec first_feature
          else:
               print("La liste features est vide.")
               section_name = ""
               section_num = ""
               cadastre = "Cadastre : Section "+section_name+ " n "+ section_num
               print ("cadastre", cadastre)
               cadastre = requests.post('http://10.252.216.10:5008/cadastre', data=cadastre)


          #cadastre = requests.post('http://10.252.216.10:5008/cadastre', data=cadastre)
          section_num = requests.post('http://10.252.216.10:5008/section_num', data=section_num)
          section_name = requests.post('http://10.252.216.10:5008/section_name', data=section_name)
   localisation_extract_v01(full_address)
   cadastre_extract_API_FROM_ODOO(longitude,latitude)





app = Flask(__name__)
# Configuration de la journalisation
logging.basicConfig(filename='server_sdp_plugin.log', level=logging.INFO,
                    format='%(asctime)s:%(levelname)s:%(message)s')
@app.route('/', methods = ['GET','POST'])
def get_url():
    if request.method == 'POST':
         global test
         data = request.get_data()
         print(type(data))
         test = data.decode("utf-8")
         print("ok", (data.decode("utf-8")))

         test_scrapping()
         app.logger.info('Sending URL et Scrapping')
         return test
    else:
        return test

@app.route('/destination', methods = ['GET','POST'])
def get_destination():
    if request.method == 'POST':
         global test1
         data1 = request.get_data()

         print(data1)
         test1 = data1.decode("utf-8")
         return test1
    else:
         return test1



@app.route('/commune', methods = ['GET','POST'])
def get_commune():
    if request.method == 'POST':
         global test2
         data1 = request.get_data()
         test2 = data1.decode("utf-8")
         return test2
    else:
        return test2
    
@app.route('/address1', methods = ['GET','POST'])
def get_adress():
    if request.method == 'POST':
         global test3
         data1 = request.get_data()
         test3 = data1.decode("utf-8")
         return test3
    else:
        return test3
@app.route('/section_num', methods = ['GET','POST'])
def get_section_num():
    if request.method == 'POST':
         global test4
         data1 = request.get_data()
         test4 = data1.decode("utf-8")
         return test4
    else:
        return test4

@app.route('/section_name', methods = ['GET','POST'])
def get_section_name():
    if request.method == 'POST':
         global test5
         data1 = request.get_data()
         test5 = data1.decode("utf-8")
         return test5
    else:
        return test5
@app.route('/Mission', methods = ['GET','POST'])
def get_mission():
    if request.method == 'POST':
         global test6
         data1 = request.get_data()
         test6 = data1.decode("utf-8")
         return test6
    else:
        return test6
    
@app.route('/num_livrable', methods = ['GET','POST'])
def get_num_livrable():
    if request.method == 'POST':
         global test7
         data1 = request.get_data()
         test7 = data1.decode("utf-8")
         return test7
    else:
        return test7
@app.route('/Cree_le', methods = ['GET','POST'])
def get_cree_le():
    if request.method == 'POST':
         global test8
         data1 = request.get_data()
         test8 = data1.decode("utf-8")
         return test8
    else:
        return test8

@app.route('/Cree_par', methods = ['GET','POST'])
def get_cree_par():
    if request.method == 'POST':
         global test9
         data1 = request.get_data()
         test9 = data1.decode("utf-8")
         return test9
    else:
        return test9

@app.route('/city', methods = ['GET','POST'])
def get_city():
    if request.method == 'POST':
         global test10
         data1 = request.get_data()
         test10 = data1.decode("utf-8")
         return test10
    else:
        return test10
@app.route('/number', methods = ['GET','POST'])
def get_number():
    if request.method == 'POST':
         global test11
         data1 = request.get_data()
         test11 = data1.decode("utf-8")
         return test11
    else:
        return test11
@app.route('/street', methods = ['GET','POST'])
def get_street():
    if request.method == 'POST':
         global test12
         data1 = request.get_data()
         test12 = data1.decode("utf-8")
         return test12
    else:
        return test12
    

@app.route('/cree_le_extension', methods = ['GET','POST'])
def get_cree_le_extension():
    if request.method == 'POST':
         global test13
         data1 = request.get_data()
         test13 = data1.decode("utf-8")
         return test13
    else:
        return test13

@app.route('/RDE', methods = ['GET','POST'])
def get_RDE():
    if request.method == 'POST':
         global test14
         data1 = request.get_data()
         test14 = data1.decode("utf-8")
         return test14
    else:
        return test14
@app.route('/cadastre', methods = ['GET','POST'])
def get_cadastre():
    if request.method == 'POST':
         global test15
         data1 = request.get_data()
         test15 = data1.decode("utf-8")

         return test15
    else:
        return test15

@app.route('/code_postale', methods = ['GET','POST'])
def get_code_postale():
    if request.method == 'POST':
         global test16
         data1 = request.get_data()
         test16 = data1.decode("utf-8")

         return test16
    else:
        return test16

@app.route('/departement', methods = ['GET','POST'])
def get_departement():
    if request.method == 'POST':
         global test17
         data1 = request.get_data()
         test17 = data1.decode("utf-8")

         return test17
    else:
        return test17




if __name__ == '__main__':
#if __name__ == '__main__':
#    app.run(host='192.168.0.10', port=5055)
    logging.info('Starting app...')
    app.run(host='0.0.0.0', port=5008)
       


