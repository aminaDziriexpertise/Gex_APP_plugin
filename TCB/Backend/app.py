from flask import Flask, request
from selenium import webdriver
from selenium.webdriver.common.by import By
from unittest import result
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from flask import Flask
import re
import datetime;
import time
import string
from pyzwcad import ZwCAD, APoint
import matplotlib as mpl
import matplotlib.pyplot as plt
from random import random
import numpy as np
import json
import requests
from flask import Flask,jsonify,request,make_response,url_for,redirect


def scrapper_url_odoo(url):
    
        # Définir un style de texte spécifique 
        #acad.ActiveDocument.ActiveTextStyle = acad.ActiveDocument.TextStyles.Item("G100TXT-droit")
        #Définition des polices pour des styles de texte spécifiques
        #acad.ActiveDocument.TextStyles.Item("G100TXT-droit").SetFont("suissb.shx", False, False, 1, 0 or 0)
        acad = ZwCAD()
        #Scrapping tache déléguée
        driver = webdriver.Chrome() 
        #url = 'https://odoo-r7.gexpertise.fr/web/login'
        print('ok1')
        #url = configureEndpoint.url
        print('ok2')
        #url = 'https://odoo.gexpertise.fr/web#id=94933&action=311&active_id=18&model=helpdesk.ticket&view_type=form&menu_id=191'
        driver.get(url)
        username = driver.find_element(By.ID,"login")
        password = driver.find_element(By.ID,"password")
        #username.send_keys("i.benabdallah@gexpertise.fr")
        #password.send_keys("i$XnRR6H*l8d")

        username.send_keys("GexApp Pôle Développement")
        password.send_keys("Ppr9QX1RlqlB")

        # getting the button by class name 
        button1 = driver.find_element(By.XPATH,'//button[@type="submit"]').click()
        # clicking on the button
        #button1.click()
        
        # function to create acronym
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
            #**********************Nom_Mission **********************
        element = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, ".//div[3]/div/div/div/div[5]/div[6]/table[2]/tbody/tr[5]/td[2]/a[@class='o_form_uri o_field_widget']")) 
            )
        Mission = element.get_attribute("innerHTML")
        Mission = Mission.split('-')
        Mission = Mission[0]
        #print(type(Mission))
        print('Mission :', Mission)

        #**********************Cree par **********************
        element = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, ".//div[3]/div/div/div/div[5]/div[6]/table[2]/tbody/tr/td[2]/a[@class='o_form_uri o_field_widget field_partner_id']")) 
            )
        Cree_par = element.get_attribute("innerHTML")
        Cree_par = fxn(Cree_par)
        print('Cree_par :', Cree_par)
        print("tester la structure finale du nom", fxn(Cree_par))

        #**********************Full_address**********************
        element = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, ".//div[3]/div/div/div/div[5]/div[6]/table[2]/tbody/tr[7]/td[2]/a[@class='o_form_uri o_field_widget o_readonly_modifier']")) 
            )
        full_address = element.get_attribute("innerHTML")
        print('Full Address :', full_address)
        address = full_address.split(',')
        print("test_adress", address )
        address1 = address[0]
        print("L'ADRESSE est la suivante: ", address[0] )
        print("code postale est : ", address[1] )


        #**********************Cree le **********************
        element = WebDriverWait(driver, 10).until(
                EC.presence_of_element_located((By.XPATH, ".//div[3]/div/div/div/div[5]/div[6]/table/tbody/tr[8]/td[2]/span[@class='o_field_date o_field_widget o_readonly_modifier']")) 
            )
        Cree_le = element.get_attribute("innerHTML")
        print('Cree_le :', Cree_le)
        Cree_le = datetime.datetime.strptime(str(Cree_le),'%d/%m/%Y %H:%M:%S').strftime('%b %Y') #%B full name et %b short name
        print("forme_finale de la date ", Cree_le)
        time.sleep(2) # Let the user actually see something!
        driver.quit()
        def localisation_extract(address):
        #Extraire 
            city_address = {'q': address}
            
            r = requests.get('https://geocodage.ign.fr/look4/address/search', params=city_address).json()
            #response= requests.get('https://geocodage.ign.fr/look4/address/search?q=140 boulevard Macdonald').json()
            adresse = r.get('features')[0].get('geometry').get('coordinates')
            city = r.get('features')[0].get('properties').get('city')
            #Définition des polices pour des styles de texte spécifiques
            acad.ActiveDocument.TextStyles.Item("G100TXT-droit").SetFont("swiss721CnBT.shx", False, False, 1, 0 or 0)

            t1 = acad.model.AddText("("+city+")", APoint(1653953.3941, 8210382.2722), 1)
            t1.color=0
            number = r.get('features')[0].get('properties').get('number')
            street = r.get('features')[0].get('properties').get('street')

            #Définition des polices pour des styles de texte spécifiques
            acad.ActiveDocument.TextStyles.Item("G100TXT-droit").SetFont("swissl.shx", False, False, 1, 0 or 0)
            t1 = acad.model.AddText(number+", "+ street, APoint(1653953.2389, 8210374.8059), 1)
            t1.color=0
            t2 = acad.model.AddText(number+", "+ street, APoint(1653880.1227, 8210306.3645), 2)
            t2.color=0
            print(city, number, street)
            return (adresse)


    
        def cadastre_extract():
            n= localisation_extract(address1)
            filter = {'type':'point', 'coordinates': n}
            payload1 = {'searchGeom': json.dumps(filter)}
            #https://geocodage.ign.fr/look4/parcel/reverse?searchGeom={"type":"Point","coordinates":[2.379032,48.899039]}
            response= requests.get('https://geocodage.ign.fr/look4/parcel/reverse', params=payload1).json()
        
            commune_name = response.get('features')[0].get('properties').get('nomCommune')
            section_name = response.get('features')[0].get('properties').get('section')
            section_num  = response.get('features')[0].get('properties').get('numero')
        
        
            #Définition des polices pour des styles de texte spécifiques
            acad.ActiveDocument.TextStyles.Item("G100TXT-droit").SetFont("suissb.shx", False, False, 1, 0 or 0)
            t1 = acad.model.AddText("Cadastre : Section "+ section_name + " n°  " + section_num,APoint(1653949.7439, 8210369.1671), 1)
            t1.color=0

            #Définition des polices pour des styles de texte spécifiques
            acad.ActiveDocument.TextStyles.Item("G100TXT-droit").SetFont("suissb.shx", False, False, 1, 0 or 0)
            t1 = acad.model.AddText(commune_name,APoint(1653961.9656, 8210384.8264), 1.5)
            t1.color=0
            

            #Autres cathégories de remplissage
            #Définition des polices pour des styles de texte spécifiques
            #-------------------------Date et responsables --------------------------
            acad.ActiveDocument.TextStyles.Item("G100TXT-droit").SetFont("suissl.shx", False, False, 1, 0 or 0)
            t1 = acad.model.AddText("Date : "+ Cree_le +" - Resp : "+ Cree_par,APoint(1653953.4566, 8210307.8533), 0.8)
            t1.color=0

            #------------------------Mission--------------------------------------
            acad.ActiveDocument.TextStyles.Item("G100TXT-droit").SetFont("suissl.shx", False, False, 1, 0 or 0)
            t1 = acad.model.AddText("Mission : " + Mission,APoint(1653954.8092, 8210310.5213), 0.9)
            t1.color=0
         
            cadastre_extract()

   




url = 'http://127.0.0.1:5000'
app = Flask(__name__)
app.config["DEBUG"] = True
@app.route('/', methods = ['GET','POST'])
def get_url():
    if request.method == 'POST':
         global test
         data = request.get_data()
       
         print(data)
         test = data.decode("utf-8")
         print("ok", (data.decode("utf-8")))
         #scrapper_url_odoo(test)
         return test
    else:
        #scrapper_url_odoo(test)
        print("from get")
        return test

    
app.run(debug=True)