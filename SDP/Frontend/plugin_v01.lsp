;******************************************************************************************
;*********************         PLUGIN SDP v01      ****************************************
;******************* AMINA DZIRI 04/2023  V1 **********************************************
;******************************************************************************************
;;;Plot Functions
(defun c:addtext_commune (/ pt textent)
  (setq url "http://10.252.216.10:5008/commune")
  (setq commune (get-data-from-url url))
  (setq url1 "http://10.252.216.10:5008/departement")
  (setq departement (get-data-from-url url1))

  ;(setq combined1 (strcat   response_text response_text1  ))

  (setq x 36.073)
  (setq y 27.702)
  (setq z 0)
  ;(setq pt (getpoint "\nSelectionnez un point pour ajouter nom du commune : "))
 ; (setq textent (entmakex (list (cons 0 "TEXT")
                             ;   (cons 10 (list x y z))
                             ;   (cons 1 response_text)
                             ;  (cons 40 height_value))))
  ;(entmod textent)
  (command "_.MTEXT" (list x y z) "_Justify" "BC" "_Height" 0.50 "rotation" "-100.0000g"  "_style" "G100TXT-droitG" "_none" "@" commune "")
  (setq x 36.643)
  (setq y 26.797)
  (setq z 0)
  (command "_.MTEXT" (list x y z) "_Justify" "BC" "_Height" 0.3 "rotation" "-100.0000g"  "_style" "G100TXT-droitG" "_none" "@"  departement "")
  (princ)
)


(defun c:addtext_city (/ pt textent)
  (setq url "http://10.252.216.10:5008/departement")
  (setq response_text (get-data-from-url url))
  (setq height_value 0.3) 
  (setq combined1 (strcat   response_text  ))
  (setq height_value 0.3) 
  (setq x 33.233)
  (setq y 26.853)
  (setq z 0)
  ;(setq pt (getpoint "\nSelectionnez un point pour ajouter nom du commune : "))
  (setq textent (entmakex (list (cons 0 "TEXT")
                                (cons 10 (list x y z))
                                (cons 1 combined1)
                                (cons 40 height_value))))
  (entmod textent)
  (princ)
)

(defun c:addtext_adress (/ pt textent)
  (setq url1 "http://10.252.216.10:5008/number" )
  (setq url2 "http://10.252.216.10:5008/street")
  (setq url3 "http://10.252.216.10:5008/address1" )
   
  (setq response_text1 (get-data-from-url url1))
  (setq response_text2 (get-data-from-url url2))
  (setq response_text3 (get-data-from-url url3))
  
  (if (string= response_text1 "")
    (setq combined_response (strcat  response_text3 ))
    (setq combined_response (strcat  response_text1 ", " response_text2)))
  ;(setq height_value 0.3) 
  ;(setq combined_response (strcat  response_text1 ", " response_text2))
  (setq height_value 0.3) 
  (setq x 36.628)
  (setq y 25.455)
  (setq z 0)
  (command "_.MTEXT" (list x y z) "_Justify" "MC" "_Height" 0.40 "rotation" "-100.0000g"  "_style" "G100TXT-droit" "_none" "@" combined_response "")

  (princ)
)
(defun TitleCase ( s )
    (vl-list->string
        (mapcar
            (function
                (lambda ( a b c ) (if (= 32 a) b c))
            )
            (cons 32 (vl-string->list s))
            (vl-string->list (strcase s))
            (vl-string->list (strcase s t))
        )
    )
)
(defun c:addtext_Rue (/ pt textent)
  (setq url1 "http://10.252.216.10:5008/street" )
  ;(setq url2 "http://10.252.216.10:5008/street")
  (setq response_text1 (get-data-from-url url1))
  (setq combined_response (strcat "Rue "  response_text1 ))
  (setq rue (TitleCase (strcat combined_response )))
  ;(setq response_text2 (get-data-from-url url2))
  ;(setq height_value 0.3) 
 ; (setq combined_response (strcat  response_text1 ", " response_text2))
  (setq height_value 0.7) 
  (setq x 12.560)
  (setq y 2.743)
  (setq z 0)
  ;(setq pt (getpoint "\nSelectionnez un point pour ajouter nom du commune : "))
  (setq textent (entmakex (list (cons 0 "TEXT")
                                (cons 10 (list x y z))
                                (cons 1 rue)
                                (cons 40 height_value))))
  (entmod textent)
  (princ)
)

(defun c:addtext_cadastre (/ pt textent)
 (setq url1 "http://10.252.216.10:5008/cadastre")
 ; (setq url1 "http://10.252.216.10:5008/section_name")
 ; (setq url2 "http://10.252.216.10:5008/section_num" )
  (setq response_text1 (get-data-from-url url1))
  
  ;(setq response_text2 (get-data-from-url url2)) 
 ; (setq combined_response (strcat "Cadastre:Section " response_text1 " n " response_text2))
  (setq height_value 0.3) 
  (setq x 36.429)
  (setq y 23.626)
  (setq z 0)
  ;(setq pt (getpoint "\nSelectionnez un point pour ajouter nom du commune : "))
  (command "_.MTEXT" (list x y z) "_Justify" "HC" "_Height" 0.30 "rotation" "-100.0000g" "_style" "G100TXT-droitG" "_none" "@" response_text1 "")
  (princ)
)


(defun c:Mission_code_lieu_respo()
  (setq url1 "http://10.252.216.10:5008/Mission" )
  (setq url2 "http://10.252.216.10:5008/num_livrable")
  (setq url3 "http://10.252.216.10:5008/cree_le_extension")
  (setq url4 "http://10.252.216.10:5008/Cree_par")
  (setq url5 "http://10.252.216.10:5008/RDE")
  (setq Mission (get-data-from-url url1))
  (setq num_livrable (get-data-from-url url2))
  (setq cree_le_extension (get-data-from-url url3))
  (setq Cree_par (get-data-from-url url4))
  (setq RDE (get-data-from-url url5))

  (setq combined1 (strcat "Mission : "  Mission  " -Lieu :"))
  (setq combined2 (strcat num_livrable  " - Indice : "))
  (setq combined3 (strcat "Date : "  Cree_le_extension  "  - Resp : " Cree_par "/" RDE))
  (setq x 36.470)
  (setq y 5.434)
  (setq z 0)
   (command "_.MTEXT" (list x y z) "_Justify" "MC" "_Height" 0.20 "rotation" "-100.0000g"  "_style" "G100TXT-droit" "_none" "@" combined1 combined2 "")
   (setq x 36.639)
   (setq y 4.828)
   (setq z 0)
   (command "_.MTEXT"
  (list x y z)
  "_Justify" "MC"
  "_Height" 0.2
  "rotation" "-100" "_style" "G100TXT-droit"
  "_none" "@"
   combined3 "")
 
)

(defun c:AddNota1()
  (setq url "http://10.252.216.10:5008/cree_le_extension")
  (setq Cree_le_extension (get-data-from-url url))
  (setq cree  (strcat " effectues en " Cree_le_extension " par GEXPERTISE. "))
  (setq x 0.219)
  (setq y 24.815)
  (setq z 0)
   (command "_.MTEXT" (list x y z) "_Justify" "HG" "_Height" 0.170 "rotation" "-100.0000g"  "_style" "G100TXT-droit" "_none" "@" "Nota :" "Les surfaces ont ete calculees e partir des releves dessin  " "informatique depend de l'echelle graphique pour laquelle le" " plan a ete etabli; cette precision respecte les tolerances " " definies dans le devis." " Les epaisseurs de murs et les sections des poteaux en " " mitoyennete sont figuratives et n'ont pu etre mesurees."  " La representation des emplacements de stationnement " " n'a pas vocation e etre exploitee en vue d'une certification  " " selon la norme NFP 91120. "  " Les surfaces ont ete calculees a partir des releves " cree " Les affectations ont ete appreciees en fonction des signes " " apparents  constates sur place et sans consultation des baux." " Les affectations correspondent aux designations mentionnees  " "sur les plans."  "")
  
)

(defun Plot_cartouche ()
 ;(alert "SVP! Inserer les elements de cartouche un par un ... ")
 (c:addtext_commune)
 ;(c:addtext_city)
 (c:addtext_adress)
 (c:addtext_cadastre)
 (c:Mission_code_lieu_respo)
 (c:AddNota1)
 ;(c:addtext_Rue)
  
)
 
    



;== Function Help dialog ==
 (defun SDP-Help ( / )
  (alert (strcat
   "\tPlugin Help "
   "\n "
   "\nCe plugin dedie pour automatiser: "
   "\n          - les donnees de tache Odoo  "
   "\n          - Calcul SDP  "
   "\n          - Remplissage de tableau SDT "
   "\n          - Mise a zero des donnees de SDT  "
   "\n          - Exporter les etats de surface  "
  ))
 );end CBSG-Help


;Load layout Gabarit
(defun gabarit_load()
    (command "-LAYOUT" "G" "Q:/Charte_Graphique/Gabarits/GAB_PRES_A3.dwt" "M2XX_E0_(SDP)")
    (command "_LAYOUT" "E" "M2XX_E0_(SDP)" )
    (setq drawing-name (getvar "DWGNAME"))
    (setq drawing_test_v01 (substr (getvar "dwgname") 1 (- (strlen (getvar "dwgname")) 4)))
    (setq str drawing_test_v01)
    (setq str  (vl-string-subst "" "_SDP" str))
    (setq str  (vl-string-subst "" "_SHO" str))
    (setq str  (vl-string-subst "" "_SUB" str))
    (setq str  (vl-string-subst "" "_C2" str))
    (setq str  (vl-string-subst "" "-C2" str))
    (setq str  (vl-string-subst "" "SDP" str))
    (setq str  (vl-string-subst "" "SHO" str))
    (setq str  (vl-string-subst "" "SUB" str))
    (setq str  (vl-string-subst "" "-SDP" str))
    (setq str  (vl-string-subst "" "-SHO" str))
    (setq str  (vl-string-subst "" "-SUB" str))
    (setq str  (vl-string-subst "_" "__" str))
    (setq debut (substr str 1 3))
    (setq milieu (substr str 4 6))
    (setq fin (substr str 11))
    (setq str (strcat debut "_" milieu "_" fin))
    (setq combined_response (strcat  str "_(SDP)"))
    (command "_LAYOUT" "R" "M2XX_E0_(SDP)" combined_response )
 
)
;Destination_calques
(defun 1-artisanat()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_1-artisanat") nil)(command "-layer" "n" "GEX_EDS_sdp_1-artisanat" "_color" "7" "GEX_EDS_sdp_1-artisanat" ""))
)
(defun PostRequest_1-artisanat  (/ url data http_object) 
 (setq 1-artisanat   "Artisanat")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"

  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-artisanat) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun 1-bureau()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-bureau") nil)(command "-layer" "n" "GEX_EDS_sdp_1-bureau" "_color" "7" "GEX_EDS_sdp_1-bureau" ""))
)
(defun PostRequest_1-bureau (/ url data http_object) 
 (setq 1-bureau   "Bureau")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-bureau) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun 1-commerce()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-commerce") nil)(command "-layer" "n" "GEX_EDS_sdp_1-commerce" "_color" "7" "GEX_EDS_sdp_1-commerce" ""))
)
(defun PostRequest_1-commerce (/ url data http_object) 
 (setq 1-commerce   "Commerce")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-commerce) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun 1-entrepot()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-entrepot") nil)(command "-layer" "n" "GEX_EDS_sdp_1-entrepot" "_color" "7" "GEX_EDS_sdp_1-entrepot" ""))
)
(defun PostRequest_1-entrepot (/ url data http_object) 
 (setq 1-entrepot   "Entrepot")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-entrepot) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun 1-exploitation()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-exploitation") nil)(command "-layer" "n" "GEX_EDS_sdp_1-exploitation" "_color" "7" "GEX_EDS_sdp_1-exploitation" ""))
)
(defun PostRequest_1-exploitation (/ url data http_object) 
 (setq 1-exploitation   "Exploitation")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-exploitation) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun 1-habitation()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-habitation") nil)(command "-layer" "n" "GEX_EDS_sdp_1-habitation" "_color" "7" "GEX_EDS_sdp_1-habitation" ""))
)
(defun PostRequest_1-habitation (/ url data http_object) 
 (setq habitation   "Habitation")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send habitation) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun 1-hotelier()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-hotelier") nil)(command "-layer" "n" "GEX_EDS_sdp_1-hotelier" "_color" "7" "GEX_EDS_sdp_1-hotelier" ""))
)
(defun PostRequest_1-hotelier (/ url data http_object) 
 (setq 1-hotelier   "Hotelier")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-hotelier) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun 1-industrie()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-industrie") nil)(command "-layer" "n" "GEX_EDS_sdp_1-industrie" "_color" "7" "GEX_EDS_sdp_1-industrie" ""))
)
(defun PostRequest_1-industrie (/ url data http_object) 
 (setq 1-industrie   "Industrie")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-industrie) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun 1-spic()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-spic") nil)(command "-layer" "n" "GEX_EDS_sdp_1-spic" "_color" "7" "GEX_EDS_sdp_1-spic" ""))
) 
(defun PostRequest_1-spic (/ url data http_object) 
 (setq 1-spic   "Spic")
 (print URL)
 (setq
  url   "http://10.252.216.10:5008/destination"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send 1-spic) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun trap (errmsg)
	(setq *error* temperr)
 
  	(alert errmsg)
  
	(alert "There was an error!!")
	
   (princ)
  
);defun

(setq *lisp-log-folder* "C:\\LISP-Logs")
 
;;------------------------------------------------------------;;
 
(defun c:LispLogON nil
    (if (null *log-lisp-reactor*)
        (setq *log-lisp-reactor* (vlr-lisp-reactor "LISP-Log" '((:vlr-lispwillstart . lisplog:lispstarted))))
    )
    (if (null *log-save-reactor*)
        (setq *log-save-reactor* (vlr-editor-reactor "LISP-Log" '((:vlr-beginsave . lisplog:savelisplogs))))
    )
    (princ "\nLISP Logging Enabled.")
    (princ)
)
 
;;------------------------------------------------------------;;
 
(defun c:LispLogOFF nil
    (if *log-lisp-reactor*
        (progn (vlr-remove *log-lisp-reactor*) (setq *log-lisp-reactor* nil))
    )
    (if *log-save-reactor*
        (progn (vlr-remove *log-save-reactor*) (setq *log-save-reactor* nil))
    )
    (setq *lisp-log-list* nil)
    (vl-propagate '*lisp-log-list*)
    (princ "\nLISP Logging Disabled.")
    (princ)
)
 
;;------------------------------------------------------------;;
 
(defun lisplog:lispstarted ( reactor params )
    (if
        (and
            (wcmatch (setq params (strcase (car params))) "(C:*")
            (not (member params '("(C:LISPLOGON)" "(C:LISPLOGOFF)")))
        )
        (progn
            (setq *lisp-log-list*
                (nAssoc++
                    (list
                        (strcat (getvar 'DWGPREFIX) (getvar 'DWGNAME))
                        (substr (vl-string-trim "()" params) 3)
                    )
                    *lisp-log-list*
                )
            )
            (vl-propagate '*lisp-log-list*)
        )
    )
    (princ)
)
 
;;------------------------------------------------------------;;
 
(defun lisplog:savelisplogs ( reactor params / *error* directory existing filename file )
 
    (defun *error* ( msg )
        (if (and file (eq 'FILE (type file))) (setq file (close file)))
        (if (not (wcmatch (strcase msg) "*BREAK,*CANCEL*,*EXIT*"))
            (princ (strcat "\nError: " msg))
        )
        (princ)
    )
    
    (if *lisp-log-list*
        (progn
            (if *lisp-log-folder*
                (setq *lisp-log-folder* (vl-string-right-trim "\\" (vl-string-translate "/" "\\" *lisp-log-folder*)))
                (setq *lisp-log-folder* (vl-string-right-trim "\\" (getvar 'DWGPREFIX)))
            )
            (setq directory (strcat *lisp-log-folder* "\\" (date_funct_repo))
                  filename  (strcat directory "\\Log_" (date_funct_file) ".csv")
            )
            (if (null (vl-file-directory-p directory))
                (CreateDirectory directory)
            )
            (if (findfile filename)
                (setq existing (ReadLog filename))
            )
            (if (setq file (open filename "w"))
                (progn
                    (if existing
                        (setq *lisp-log-list* (MergeLists *lisp-log-list* existing))
                    )
                    (foreach dwg (vl-sort *lisp-log-list* '(lambda ( a b ) (< (car a) (car b))))
                        (write-line (car dwg) file)
                        (foreach cmd (vl-sort (cdr dwg) '(lambda ( a b ) (> (cadr a) (cadr b))))
                            (write-line (strcat (car cmd) "            " (itoa (cadr cmd))) file)
                        )
                        (write-line "" file)
                    )
                    (setq file (close file))
                    (setq *lisp-log-list* nil)
                    (vl-propagate '*lisp-log-list*)
                )
                (princ "\nUnable to write LISP Log - Check that the Log file is not in use.")
            )
        )
    )
    (princ)
)
 
;;------------------------------------------------------------;;
 
(defun nAssoc++ ( key lst / pair )
    (if key
        (if (setq pair (assoc (car key) lst))
            (subst (cons (car key) (nAssoc++ (cdr key) (cdr pair))) pair lst)
            (cons  (cons (car key) (nAssoc++ (cdr key) nil)) lst)
        )
        (if lst (list (1+ (car lst))) '(1))
    )
)
 
;;------------------------------------------------------------;;
 
(defun Date ( format )
   (menucmd (strcat "m=$(getvar,DATE)," format ")"))

)
(defun date_funct_repo()
  (menucmd "M=$(edtime,$(getvar,date),DDDD\",\" DD MONTH YYYY)")
)
(defun date_funct_file()
  (menucmd "M=$(edtime,$(getvar,date),DDDD\",\" MONTH YYYY HH MM SS)")

)
 
;;------------------------------------------------------------;;
 
(defun CreateDirectory ( dir / CreateDirectory folders )
 
    (defun CreateDirectory ( root folders )
        (if folders
            (   (lambda ( dir ) (vl-mkdir dir) (CreateDirectory dir (cdr folders)))
                (strcat root "\\" (car folders))
            )
        )
    )
  
    (if (setq folders (str->lst (vl-string-translate "/" "\\" dir) "\\"))
        (CreateDirectory (car folders) (cdr folders))
    )
    (vl-file-directory-p dir)
)
 
;;------------------------------------------------------------;;
 
(defun str->lst ( str del / pos )
    (if (setq pos (vl-string-search del str))
        (vl-remove "" (cons (substr str 1 pos) (str->lst (substr str (+ pos 1 (strlen del))) del)))
        (list str)
    )
)
 
;;------------------------------------------------------------;;
 
(defun ReadLog ( filename / file line lst sub1 sub2 )
    (if (setq file (open filename "r"))
        (progn
            (while (setq line (read-line file))
                (cond
                    (   (eq "" line)
                    )
                    (   (= 1 (length (setq line (str->lst line ","))))
                        (if (and sub1 sub2)
                            (setq lst (cons (cons sub1 sub2) lst)
                                  sub1 nil
                                  sub2 nil
                            )
                        )
                        (setq sub1 (car line))
                    )
                    (   (= 2 (length line))
                        (setq sub2 (cons (list (car line) (atoi (cadr line))) sub2))
                    )
                )
            )
            (if (and sub1 sub2)
                (setq lst (cons (cons sub1 sub2) lst))
            )
            (setq file (close file))
            lst
        )
    )
)
 
;;------------------------------------------------------------;;
 
(defun MergeLists ( l1 l2 / items item )
    (foreach group l2
        (if (setq items (cdr (assoc (car group) l1)))
            (progn
                (foreach pair (cdr group)
                    (if (setq item  (assoc (car pair) items))
                        (setq items (subst (list (car pair) (+ (cadr pair) (cadr item))) item items))
                        (setq items (cons pair items))
                    )
                )
                (setq l1 (subst (cons (car group) items) (assoc (car group) l1) l1))
            )
            (setq l1 (cons group l1))
        )
    )
    l1
)
 
;;------------------------------------------------------------;;

(defun MyHTTPRequest  (/ url data http_object)
 (setq
  url   "http://127.0.0.1:8080"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "GET" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; not sure about below, maybe API handles string length for you??
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send data)
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
 )

(defun MyRequest  (/ url data http_object)
  (vl-load-com)
  ;; Set up variables
 (setq http_object nil stat nil res nil)
 (setq
  url "http://10.252.216.10:5008"
  ;url   "http://127.0.0.1:5000"
  data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  inserted   (get_tile "insert") 
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 ;(vlax-invoke-method http_object 'open "GET" url :vlax-false)
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; not sure about below, maybe API handles string length for you??
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 ;(vlax-invoke-method http_object 'send inserted)
 (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_object 'send inserted)))
 (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_object 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_object 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_object 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
 ;(print http_object)
 ;(print inserted)
 ;(print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
 


(defun GetFromWeb (strUrl / webObj stat res errobj)
  ;Code posted by user: BazzaCAD, 2010/03/29, from site:
  ;http://opendcl.com/forum/index.php?topic=1244.0
  (vl-load-com)
  ;; Set up variables
  (setq webObj nil stat nil res nil)
  ;; Create a new reference to the WinHttp object
  (setq webObj (vlax-invoke-method (vlax-get-acad-object) 'GetInterfaceObject "WinHttp.WinHttpRequest.5.1"))
  ;; Fetch web page
  (vlax-invoke-method webObj 'Open "GET" strUrl :vlax-false)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list webObj 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property webObj 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property webObj 'ResponseText));_ Return the response value // 'ResponseText
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property webObj 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
);defun

(defun JSON->LIST (json / )
;json - string, as json data
;returns - list, converted from json
(if (eq 'STR (type json)) (read (vl-string-translate "[]{}:," "()()  " json)))
);defun

(defun LIST->PAIRS (lst / ret tmp)
;this function is recursive
;lst - list, the list returned by "JSON->LIST", or similar
;returns - dotted pair lists or, in the case of nested lists, lists similar to points found in entities (item val1 val2 ...)
(setq ret '())
(if (listp lst)
  (foreach i lst
    (if (listp i)
      (setq ret (cons (list (LIST->PAIRS i)) ret))
      (if (eq 0 (rem (length (member i lst)) 2))
        (setq ret (cons (cons i (if (listp (setq tmp (cadr (member i lst)))) (LIST->PAIRS tmp) tmp)) ret))
      );if
    );if
  );foreach
;else
  (setq ret "")
);if
(reverse ret)
);defun

(defun CALL ( / url data)
(extract_nom_livrable)
(princ"\n")
(extract_nom_client)
(princ "\n")
(extract_address)
(princ "\n")
(extract_Cree__par)
(princ "\n")
(extract_Cree__le)
(princ "\n")
(extract_Cadastre)


);defun

 
;=========================================================================
  ;; get file DWG :
;=========================================================================  


(defun openDWG ( target / rtn shl )
    (if (and (or (= 'int (type target)) (setq target (findfile target)))
             (setq shl (vla-getinterfaceobject (vlax-get-acad-object) "shell.application"))
        )
        (progn
            (setq rtn (vl-catch-all-apply 'vlax-invoke (list shl 'open target)))
            (vlax-release-object shl)
            (if (vl-catch-all-error-p rtn)
                (prompt (vl-catch-all-error-message rtn))
                t
            )
        )
    )
)

;=========================================================================
; Motif HASH Solid
;=========================================================================
(defun hsolid()
 (command "-hachures" "p" "s" "" "") 
 (command "-hachures"  "" "" "" "") 
)
(vl-load-com) (princ)
;=========================================================================
; Motif HASH Angle
;=========================================================================
(defun hangle()
 (command "-hachures" "p" "ANGLE" "" "" "") 
 (command "-hachures"  "" "" "" "") 
)
(vl-load-com) (princ)
;=========================================================================
; Motif HASH AnSI32
;=========================================================================
(defun hansi32()
 (command "-hachures" "p" "ANSI32" "" "" "") 
 (command "-hachures"  "" "" "" "") 
)
;=========================================================================
; Style d'ecriture
;=========================================================================
(vl-load-com) (princ)

 (defun test__getfile()
  
   (getfiled "Selectionner Font File" "Q:/Charte_Graphique/Polices-Fonts_Swiss721" "" 16)
  ;(getfiled "Select Font File" "Q:/Charte_Graphique" "" 8)
 
 )
(defun alert_style_roman (/ wss)
    
        ;Chargement de la boite de dialogue
        (setq id (load_dialog "SDP.dcl"))
        (new_dialog "Diag1" id)
        (action_tile "Search"  "(test__getfile)")
        ; actions en fonction des choix dans la boite de dialogue
        ;(action_tile "Roman" "(Roman_Styler)")
        (action_tile "cancel" "(done_dialog)")
        (action_tile "accept" "(Roman_Styler) (done_dialog)")
        (start_dialog)
)

(defun Roman_Styler ()
          (progn
          (setq url (get_tile "URL"))
          (setq H (get_tile "H"))
          (setq L (get_tile "L"))
          (setq A (get_tile "A"))
          (command "-STYLER" "INT_Roman" url H L A "" "" "" "" "" "" "" "")
          )
)
 (defun alert_style_arial (/ wss)
    
        ;Chargement de la boite de dialogue
        (setq id (load_dialog "SDP.dcl"))
        (new_dialog "Diag1" id)
        (action_tile "Search"  "(test__getfile)")
        ; actions en fonction des choix dans la boite de dialogue
       
        (action_tile "cancel" "(done_dialog)")
        (action_tile "accept" "(Arial_Styler) (done_dialog)")
        (start_dialog)
        )
        (defun Arial_Styler ()
          (progn
          (setq url (get_tile "URL"))
          (setq H (get_tile "H"))
          (setq L (get_tile "L"))
          (setq A (get_tile "A"))
          (command "-STYLER" "arial" url H L A "" "" "" "" "" "" "" "")
          )

)
 (defun alert_style_Swiss_black (/ wss)
    
        ;Chargement de la boite de dialogue
        (setq id (load_dialog "SDP.dcl"))
        (new_dialog "Diag1" id)
        (action_tile "Search"  "(test__getfile)")
        ; actions en fonction des choix dans la boite de dialogue
        ;(action_tile "Roman" "(Roman_Styler)")
        (action_tile "cancel" "(done_dialog)")
        (action_tile "accept" "(Swiss_black) (done_dialog)")
        (start_dialog)
        )

(defun Swiss_black ()
          (progn
          (setq url (get_tile "URL"))
          (setq H (get_tile "H"))
          (setq L (get_tile "L"))
          (setq A (get_tile "A"))
          (command "-STYLER" "Swiss" url H L A  "" "" "" "" "" "" "" "")
          )

)
;=========================================================================
; Récuperation  donnée de Scrapping Odoo "EXPORT"
;=========================================================================
(defun get-data-from-url_Commune (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "Titre" t)
  (PutCell "A1" res )
)
(defun get-data-from-url_city (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  ;(alert response_text)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "Titre" t)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  (PutCell "A2" res )
)
(defun get-data-from-url_/address1 (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  ;(alert response_text)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "Titre" t)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  (PutCell "A4" res )
)

(defun get-data-from-url_Cree_le (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  ;(alert response_text)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "Titre" t)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  (PutCell "G16" res )
)

(defun get-data-from-url_mission (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  ;(alert response_text)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "Titre" t)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  (PutCell "C16" res )
)
(defun get-data-from-url_num_livrable (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  ;(alert response_text)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "Titre" t)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  (PutCell "C17" res )
 ; (PutCell "A2" "SDP" )
)
(defun get-data-from-url (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  res 
 
)
(defun get-data-from-url_cadastre ()
  (vl-load-com)
  (setq url1 "http://10.252.216.10:5008/cadastre" )
 ;(setq url2 "http://10.252.216.10:5008/section_num")
 (setq response_text1 (get-data-from-url url1))
 ;(setq response_text2 (get-data-from-url url2))
 ;(setq combined_response (strcat  "Cadastre : Section " response_text1 " n " response_text2))
 ;(alert combined_response)
 ;(OpenExcel "C:/Temp/test_model.xlsx" "Titre" t)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  (PutCell "B7" response_text1 )
 ;(PutCell "A11" "TABLEAU RECAPITULATIF ")
)
(defun get-data-from-url_destination (url)
  (vl-load-com)
  (setq http_request (vlax-create-object "WinHttp.WinHttpRequest.5.1"))
  (vlax-invoke-method http_request 'open "GET" url :vlax-false)
  ;(vlax-invoke-method http_request 'send)
  ;(setq response_text (vlax-get-property http_request 'responseText))
  ;(alert response_text)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "SDP" t)
  (setq errobj (vl-catch-all-apply 'vlax-invoke-method (list http_request 'Send)))
  (if (null (vl-catch-all-error-p errobj))
    (progn
      (setq stat (vlax-get-property http_request 'Status))
      (if (= stat 200)
        (progn
          (setq res (vlax-get-property http_request 'ResponseText));_ Return the response value
        )
        (princ (strcat "\n!!! WEB server error: " (vlax-get-property http_request 'StatusText) "!!!"))
      )
    );_ progn
    (princ (strcat "\n!!! WEB server error:\n" (vl-catch-all-error-message errobj)))
  )
  response_text 
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "Titre" t)
  (PutCell "C39" response_text )
  (PutCell "C40" response_text )
  (PutCell "C41" response_text )
  (PutCell "C42" response_text )
  (PutCell "C43" response_text )
  (PutCell "C44" response_text )
  (PutCell "C45" response_text )
  (PutCell "C46" response_text )
  (PutCell "C47" response_text )
  (PutCell "C48" response_text )
  (PutCell "C49" response_text )
  (PutCell "C50" response_text )
  (PutCell "C51" response_text )
  (PutCell "C52" response_text )
  (PutCell "C53" response_text )
  (PutCell "C54" response_text )
  (PutCell "C55" response_text )
  (PutCell "C56" response_text )
)


(defun remplir_sheet_titre()
(get-data-from-url_Commune "http://10.252.216.10:5008/commune")
(get-data-from-url_city "http://10.252.216.10:5008/departement")
(get-data-from-url_Cree_le "http://10.252.216.10:5008/Cree_le")
(get-data-from-url_mission "http://10.252.216.10:5008/Mission")
(get-data-from-url_/address1 "http://10.252.216.10:5008/address1")
(get-data-from-url_num_livrable "http://10.252.216.10:5008/num_livrable")
(get-data-from-url_cadastre) 
(get-data-from-url_destination "http://10.252.216.10:5008/destination")
  
)



;=========================================================================
; Récuperation  l'etage "EXPORT"
;=========================================================================
 (defun alert_ETAGE (/ wss)
        
        ;Chargement de la boite de dialogue
        (setq id (load_dialog "SDP.dcl"))
        (new_dialog "etage" id)

        ;;----------------------------------------------------------
        ;;          Récuperation  l'etage pour l'export
        ;;----------------------------------------------------------
        (action_tile "Toitures Terrasses" "(toitures_terrasses)" )
        (action_tile "10eme Etage" "(10eme_Etage)" )
        (action_tile "9eme Etage" "(9eme_Etage)" )
        (action_tile "8eme Etage" "(8eme_Etage)" )
        (action_tile "7eme Etage" "(7eme_Etage)" )
        (action_tile "6eme Etage" "(6eme_Etage)" )
        (action_tile "5eme Etage" "(5eme_Etage)" )
        (action_tile "4eme Etage" "(4eme_Etage)" )
        (action_tile "3eme Etage" "(3eme_Etage)" )
        (action_tile "2eme Etage" "(2eme_Etage)" )
        (action_tile "1er Etage" "(1er_Etage)" )
        (action_tile "Rez de Chaussee" "(Rez_de_chaussée)" )
        (action_tile "1er Sous/Sol" "(Sous/Sol)" )
        (action_tile "2eme Sous/Sol" "(2Sous/Sol)" )
        (action_tile "3eme Sous/Sol" "(3Sous/Sol)" )
        (action_tile "4eme Sous/Sol" "(4Sous/Sol)" )
        (action_tile "5eme Sous/Sol" "(5Sous/Sol)" )
        (action_tile "6eme Sous/Sol" "(6Sous/Sol)" )
        (action_tile "cancel" "(done_dialog) (setq result nil)")
        (action_tile "accept" "(done_dialog) (setq result T)" )
        (start_dialog)
        (unload_dialog dcl_id)
  )
       

(defun tremie()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie" "CO" "U" "255,255,127" "GEX_EDS_sdp_2-tremie" ""))
)

(defun h-180()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180" "CO" "U" "165,82,82" "GEX_EDS_sdp_3-h-180" ""))
)

(defun 5-pk()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_5-pk") nil)(command "-layer" "n" "GEX_EDS_sdp_5-pk" "CO" "U" "153,153,153" "GEX_EDS_sdp_5-PK" ""))
)

(defun 6-combles()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles" "CO" "U" "82,0,165" "GEX_EDS_sdp_6-combles" ""))
)	
(defun 7-lt()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_7-lt") nil)(command "-layer" "n" "GEX_EDS_sdp_7-lt" "CO" "U" "0,127,255" "GEX_EDS_sdp_7-LT" ""))
)		

(defun 8-cave()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave" "CO" "U" "255,191,127" "GEX_EDS_sdp_8-cave"  "")"")
)

(defun teinte-contours()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_teinte_contour") nil)(command "-layer" "n" "GEX_EDS_sdp_teinte_contour" "CO" "U" "255,127,127" "GEX_EDS_sdp_teinte_contour" ""))
)
		
(defun sdp_SDP_su()	
   (if (=  (tblsearch "layer" "GEX_EDS_sdp_SDP_su") nil)(command "-layer" "n" "GEX_EDS_sdp_SDP_su" "CO" "U" "255,0,0" "GEX_EDS_sdp_SDP_su"  "")"")
)		
  
(defun tremie-su()	  
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie_su") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie_su" "_color" "7" "GEX_EDS_sdp_2-tremie_su" "")))

(defun h-180_su()	
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180_su") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180_su" "_color" "7" "GEX_EDS_sdp_3-h-180_su"  "")))
  
(defun 5-pk_su()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_5-pk_su") nil)(command "-layer" "n" "GEX_EDS_sdp_5-pk_su" "_color" "7" "GEX_EDS_sdp_5-PK_su" "")))  

(defun 6-combles_su()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles_su") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles_su" "_color" "7" "GEX_EDS_sdp_6-combles_su"  "")))  

(defun 7-lt_su()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_7-lt_su") nil)(command "-layer" "n" "GEX_EDS_sdp_7-lt_su" "_color" "7" "GEX_EDS_sdp_7-LT_su" "")))  

(defun 8-cave_su()
(if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave_su") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave_su" "_color" "7" "GEX_EDS_sdp_8-cave_su" "")""))
		
;===================================================
; SDP : fonction permettant d'effectuer les applats de couleurs 
; sur les elements de calcul de surface de Planchers
;===================================================
; fonction principale

(setq launchSdpCounter 1)
(defun sdp( )
	
	(vl-cmdf "scu" "g") ;changer le PLAN  en SCG
	(setq os (getvar "osmode"))
	(setvar "osmode" 0)
	(setvar "HPISLANDDETECTIONMODE" 0)

		(if (= (= launchSdpCounter 1) T)(
				
			
			(setq launchSdpCounter (+ launchSdpCounter 1))	
			; check de tous les calques utilisés dans le programme (TODO : Verifier la cohérence des noms de calques avec charte)
			(setq liste (getLayersdp "GEX_EDS_sdp_1-"))	
			;(if (=  liste nil) (command "_layer" "_new" "GEX_EDS_sdp_1-SDP" "C" "U" "255,0,0" "GEX_EDS_sdp_1-SDP" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie" "CO" "U" "255,255,127" "GEX_EDS_sdp_2-tremie" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180" "CO" "U" "165,82,82" "GEX_EDS_sdp_3-h-180" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_5-pk") nil)(command "-layer" "n" "GEX_EDS_sdp_5-pk" "CO" "U" "153,153,153" "GEX_EDS_sdp_5-PK" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles" "CO" "U" "82,0,165" "GEX_EDS_sdp_6-combles" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_7-lt") nil)(command "-layer" "n" "GEX_EDS_sdp_7-lt" "CO" "U" "0,127,255" "GEX_EDS_sdp_7-LT" "")"")
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave" "CO" "U" "255,191,127" "GEX_EDS_sdp_8-cave"  ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_teinte_contour") nil)(command "-layer" "n" "GEX_EDS_sdp_teinte_contour" "CO" "U" "255,127,127" "GEX_EDS_sdp_teinte_contour" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_SDP_su") nil)(command "-layer" "n" "GEX_EDS_sdp_SDP_su" "CO" "U" "255,0,0" "GEX_EDS_sdp_SDP_su"  "")"")
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie_su") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie_su" "_color" "7" "GEX_EDS_sdp_2-tremie_su" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180_su") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180_su" "_color" "7" "GEX_EDS_sdp_3-h-180_su"  ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_5-pk_su") nil)(command "-layer" "n" "GEX_EDS_sdp_5-pk_su" "_color" "7" "GEX_EDS_sdp_5-PK_su" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles_su") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles_su" "_color" "7" "GEX_EDS_sdp_6-combles_su"  ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_7-lt_su") nil)(command "-layer" "n" "GEX_EDS_sdp_7-lt_su" "_color" "7" "GEX_EDS_sdp_7-LT_su" "")"")
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave_su") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave_su" "_color" "7" "GEX_EDS_sdp_8-cave_su" ""))
			(if (=  (tblsearch "style" "SURF") nil)(command "-STYLER" "SURF" "swissl.ttf" "0.000" "" "" "" "" "")"")
			;;; Planchers avant déductions 	

			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_teinte_contour" "l" "GEX_EDS_sdp_SDP_su" "")""
			
			(foreach element liste	
				(command "-calque" "ch" "0" "" "")
				(command "-calque" "l" element "")
				
				(setq sel (ssget "X" (list (cons -4 "<or")(cons -4 "<and") (cons 0 "LWPOLYLINE")(cons 8 element) 
											(cons -4 "and>")(cons -4 "<and") (cons 0 "CIRCLE")(cons 8 element)
											(cons -4 "and>") (cons -4 "or>"))))
				
				(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
				(command "_clayer" "GEX_EDS_sdp_teinte_contour")  
				(command "-hachures" "s" sel "" "")
				(command "_clayer" "GEX_EDS_sdp_SDP_su")
			)
			
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_teinte_contour" 1)
			
			;;; Vides ;;;  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_2-tremie" "l" "GEX_EDS_sdp_2-tremie_su" "")

			(setq sel-T (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_2-tremie")
			(command "-hachures" "s" sel-T "" "") 
			(command "_clayer" "GEX_EDS_sdp_2-tremie_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_2-tremie" 0)
			

			;;; Surfaces dont h < 1.80 m ;;;
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_3-h-180" "l" "GEX_EDS_sdp_3-h-180_su" "")

			(setq sel-C (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "") 
			(command "_clayer" "GEX_EDS_sdp_3-h-180") 
			(command "-hachures" "s" sel-C "" "")  
			(command "_clayer" "GEX_EDS_sdp_3-h-180_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_3-h-180" 0)


			;;; Stationnement ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_5-PK" "l" "GEX_EDS_sdp_5-PK_su" "")

			(setq sel-H (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_5-PK") 
			(command "-hachures" "s" sel-H "" "") 
			(command "_clayer" "GEX_EDS_sdp_5-PK_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_5-PK" 0)

			;;; Combles ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_6-combles" "l" "GEX_EDS_sdp_6-combles_su" "")

			(setq sel-L (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_6-combles")
			(command "-hachures" "s" sel-L "" "") 
			(command "_clayer" "GEX_EDS_sdp_6-combles_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_6-combles" 0)


			;;; Locaux techniques ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_7-LT" "l" "GEX_EDS_sdp_7-LT_su" "")

			(setq sel-P (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_7-LT") 
			(command "-hachures" "s" sel-P "" "")
			(command "_clayer" "GEX_EDS_sdp_7-LT_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_7-LT" 0)
			;;; Caves ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_8-cave" "l" "GEX_EDS_sdp_8-cave_su" "")

			(setq sel-S (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_8-cave")
			(command "-hachures" "s" sel-S "" "") 
			(command "_clayer" "GEX_EDS_sdp_8-cave_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_8-cave" 0)
		
			(command "-layer" "l" "*" "E" "0" "g" "GEX_EDS_sdp_teinte_contour" "")
			(command "_ai_selall" )
			(command "-EPURER"  "A" "oui" "E" "oui" "p" "oui" "" )
			(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
			(setvar "osmode" os)
			(princ "\n")
			(princ)
		)
	)

		(if (= (/= launchSdpCounter 1) T) ( boxMessagesdp ))


)

;==================================centre Inert=====================

(defun centreInersdp (s1)
  (setq Last_region (entlast))
  (setq lst nil)
  (vl-load-com)
  (if entlast
    (progn
       (setq anObj (vlax-ename->vla-object (entlast)))
       (princ (strcat "\nObject Name: " (setq objName (vla-Get-ObjectName anObj))))
        (if (equal objName "AcDbRegion")
				(progn
				(setq vCentroid (vla-Get-Centroid anObj))
				(setq strCentroidProp (vl-princ-to-string (setq CentroidLst
				(vlax-safearray->list (vlax-variant-value vCentroid)))))
				(if (< (length CentroidLst) 3)
				(setq CentroidLst (append CentroidLst (list 0.0)))
				)
				(princ CentroidLst)
				(princ (strcat "\nRegion Centroid: " strCentroidProp))
				(setvar "PDMODE" 3)
				(setq *MS* (vla-Get-ModelSpace (setq acadDoc
				(vla-Get-ActiveDocument (setq acadApp (vlax-get-acad-object))))))
				;(setq ptObj (vla-AddPoint *MS* (vlax-3d-Point CentroidLst)))
				;(vla-Put-Color ptObj acYellow)
				)
				
        (princ "\nRegion was not selected !")

    )
	(vla-Delete anObj)	
    )
  )
 (princ CentroidLst)

)
;====================================init plan========================
(defun boxMessagesdp() 

     	(lspOkCancel "Commande lancer 2 fois " "appuyer sur cancel pour annuler" "Ou appuyer sur ok pour continuer" "warning !")
  		(if (= result T) (
		 	 (prompt "annuler les commandes precedente \n")
		 	 (command "annuler" "90" )
			 (alert "    *********  commande Annuler veuillez relancer vos calcul SDP  *********        ")
			 (setq launchSdpCounter 1)
		  )
		  )
        (if (= result nil) (prompt "annuler la commande actuelle \n"))
)

;;; fonction de recuperation du Calque et de calcul la surface à afficher
(defun getCalqueAppliqueApplatSDP(calqueC iscontour)
	;;; de l'ensemble des contours du calque passé en parametre 
	(princ calqueC)
	(princ "\n")
	
	(setq sel1 (ssget "X" (list (cons 0 "HATCH")(cons 8 calqueC))))
	(command "_draworder" "p" "" "_back")	
	(setq ind 0 surftotal 0 surfad 0 somme 0)

	(if (/= sel1 nil)						;si l'ensemble des elements du calque n'est pas vide 
		(while (setq nm (ssname sel1 ind))			;Recuperartion de chaque elemment de la liste issue de ssget (calque)
			(setq s1 (cdr (assoc -1 (entget nm))))	;recupere l'entité à partir de son nom 
			(setq entite (entget nm))
			(setq ind1 0 totx 0 toty 0)
			
			(setq entite (entget s1))
			(setq entite (member (assoc 72 entite) entite))
			
			(while (= (car(assoc 11 entite)) 11)	; recuperation du text designation et calcul de la position du texte à afficher
				(setq x (nth 1 (assoc 11 entite)))
				(setq y (nth 2 (assoc 11 entite)))
				(setq totx (+ totx x))
				(setq toty (+ toty y))
				(setq entite (member (assoc 72 entite) entite))
				(setq entite (member (assoc 11 entite) entite))
				(setq ind1 (1+ ind1)))							;fin du while 2

			(setq xmoyen (/ totx ind1))
			(setq ymoyen (/ toty ind1))
			(setq cxyz (list xmoyen ymoyen))
			(setq cxyz (trans cxyz 0 1))
			(command "_area" "_o" s1)			; calcul de l'aire de la polyligne 
			
			(setq surfpoly (getvar "area"))
			(setq surfpoly (rtos surfpoly 2 1))
			(setq surfpoly (strcat surfpoly " m\\U+00B2"))  ; valeur à afficher et mettre carré
				;; calcul du centre 
			(princ s1) (princ " entity name  \n")
			(command "-EDITHACH" s1 "c" "r" "o")				 
			(setq centroidPointsdp (centreInersdp s1))

			(if (= iscontour 1) (command "_TEXT" "S" "surf" "j" "MC" centroidPointsdp 0.5 100 surfpoly))
			(if (= iscontour 0) (command "_TEXT" "S" "surf" "j" "MC" centroidPointsdp 0.15 100 surfpoly))
		
			(setq ind (1+ ind)) )							   ;fin du while 1
    )                                                          ;fin de if
)


;=========================================================

(defun lspOkCancel (message1 message2 message3 main)

  (setq dcl_id (load_dialog "EDS_box.DCL"))
  (if (not (new_dialog "lspOkCancel" dcl_id))
    (exit)
  )

  (set_tile "message1" message1)
  (set_tile "message2" message2)
  (set_tile "message3" message3)
  (set_tile "main" main)

  (action_tile "cancel" "(done_dialog) (setq result nil)")
  (action_tile "accept" "(done_dialog) (setq result T)" )
  (start_dialog)
  (unload_dialog dcl_id)
  (princ)
)

;===============================================
;;; search all layers with certain cracter
(defun getLayersdp (searchparamtext)
	(setq searchparam (strcat "*" searchparamtext "*"))
	
	(while (/= (setq newelem (tblnext "layer")) nil); Start loop for remaining layers
		(if (= (wcmatch (cdr (assoc 2 newelem)) searchparam) T) (setq newelem (list (cdr (assoc 2 newelem)))) (setq newelem nil)); Check each Layer
		(if (/= nil newelem) (setq laylist (append laylist newelem)))	; Add to Layer list if appropriate
	)	
	;(setq laylist (acad_strlsort laylist))
	(setq listlength (rtos (length laylist) 2 0))
	;(alert (strcat "There are " listlength " layers that contain \"" searchparamtext "\""))
	(princ laylist)
)
  
  
  


(vl-load-com)
;; Write CSV  -  Lee Mac
;; Writes a matrix list of cell values to a CSV file.
;; lst - [lst] list of lists, sublist is row of cell values
;; csv - [str] filename of CSV file to write
;; Returns T if successful, else nil
(defun WriteCSV ( lst csv / des sep )
    (if (setq des (open csv "w"))
        (progn
            (setq sep (cond ((vl-registry-read "HKEY_CURRENT_USER\\Control Panel\\International" "sList")) (",")))
            (foreach row lst (write-line (lst->csv row sep) des))
            (close des)
            t
        )
    )
)

;; List -> CSV 
;; Concatenates a row of cell values to be written to a CSV file.
;; lst - [lst] list containing row of CSV cell values
;; sep - [str] CSV separator token
(defun lst->csv ( lst sep )
    (if (cdr lst)
        (strcat (csv-addquotes (car lst) sep) sep (lst->csv (cdr lst) sep))
        (csv-addquotes (car lst) sep)
    )
)

(defun csv-addquotes ( str sep / pos )
    (cond
        (   (wcmatch str (strcat "*[`" sep "\"]*"))
            (setq pos 0)    
            (while (setq pos (vl-string-position 34 str pos))
                (setq str (vl-string-subst "\"\"" "\"" str pos)
                      pos (+ pos 2)
                )
            )
            (strcat "\"" str "\"")
        )
        (   str   )
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      EXPORT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun GetExcel (ExcelFile$ SheetName$ MaxRange$ / Column# ColumnRow@ Data@ ExcelRange^
    ExcelValue ExcelValue ExcelVariant^ MaxColumn# MaxRow# Range$ Row# Worksheet)
    (if (= (type ExcelFile$) 'STR)
      (if (not (findfile ExcelFile$))
        (progn
          (alert (strcat "Excel file " ExcelFile$ " not found."))
          (exit)
        );progn
      );if
      (progn
        (alert "Excel file not specified.")
        (exit)
      );progn
    );if
    (gc)
    (if (setq *ExcelApp% (vlax-get-object "Excel.Application"))
      (progn
        (alert "Close all Excel spreadsheets to continue!")
        (vlax-release-object *ExcelApp%)(gc)
      );progn
    );if
    (setq ExcelFile$ (findfile ExcelFile$))
    (setq *ExcelApp% (vlax-get-or-create-object "Excel.Application"))
    (vlax-invoke-method (vlax-get-property *ExcelApp% 'WorkBooks) 'Open ExcelFile$)
    (if SheetName$
      (vlax-for Worksheet (vlax-get-property *ExcelApp% "Sheets")
        (if (= (vlax-get-property Worksheet "Name") SheetName$)
          (vlax-invoke-method Worksheet "Activate")
        );if
      );vlax-for
    );if
    (if MaxRange$
      (progn
        (setq ColumnRow@ (ColumnRow MaxRange$))
        (setq MaxColumn# (nth 0 ColumnRow@))
        (setq MaxRow# (nth 1 ColumnRow@))
      );progn
      (progn
        (setq CurRegion (vlax-get-property (vlax-get-property
          (vlax-get-property *ExcelApp% "ActiveSheet") "Range" "A1") "CurrentRegion")
        );setq
        (setq MaxRow# (vlax-get-property (vlax-get-property CurRegion "Rows") "Count"))
        (setq MaxColumn# (vlax-get-property (vlax-get-property CurRegion "Columns") "Count"))
      );progn
    );if
    (setq *ExcelData@ nil)
    (setq Row# 1)
    (repeat MaxRow#
      (setq Data@ nil)
      (setq Column# 1)
      (repeat MaxColumn#
        (setq Range$ (strcat (Number2Alpha Column#)(itoa Row#)))
        (setq ExcelRange^ (vlax-get-property *ExcelApp% "Range" Range$))
        (setq ExcelVariant^ (vlax-get-property ExcelRange^ 'Value))
        (setq ExcelValue (vlax-variant-value ExcelVariant^))
        (setq ExcelValue
          (cond
            ((= (type ExcelValue) 'INT) (itoa ExcelValue))
            ((= (type ExcelValue) 'REAL) (rtosr ExcelValue))
            ((= (type ExcelValue) 'STR) (vl-string-trim " " ExcelValue))
            ((/= (type ExcelValue) 'STR) "")
          );cond
        );setq
        (setq Data@ (append Data@ (list ExcelValue)))
        (setq Column# (1+ Column#))
      );repeat
      (setq *ExcelData@ (append *ExcelData@ (list Data@)))
      (setq Row# (1+ Row#))
    );repeat
    (vlax-invoke-method (vlax-get-property *ExcelApp% "ActiveWorkbook") 'Close :vlax-False)
    (vlax-invoke-method *ExcelApp% 'Quit)
    (vlax-release-object *ExcelApp%)(gc)
    (setq *ExcelApp% nil)
    *ExcelData@
  );defun GetExcel
  ;-------------------------------------------------------------------------------
  ; GetCell - Returns the cell value from the *ExcelData@ list
  ; Arguments: 1
  ;   Cell$ = Cell ID
  ; Syntax example: (GetCell "E19") = value of cell E19
  ;-------------------------------------------------------------------------------
  (defun GetCell (Cell$ / Column# ColumnRow@ Return Row#)
    (setq ColumnRow@ (ColumnRow Cell$))
    (setq Column# (1- (nth 0 ColumnRow@)))
    (setq Row# (1- (nth 1 ColumnRow@)))
    (setq Return "")
    (if *ExcelData@
      (if (and (>= (length *ExcelData@) Row#)(>= (length (nth 0 *ExcelData@)) Column#))
        (setq Return (nth Column# (nth Row# *ExcelData@)))
      );if
    );if
    Return
  );defun GetCell
  ;-------------------------------------------------------------------------------
  ; OpenExcel - Opens an Excel spreadsheet
  ; Arguments: 3
  ;   ExcelFile$ = Excel filename or nil for new spreadsheet
  ;   SheetName$ = Sheet name or nil for not specified
  ;   Visible = t for visible or nil for hidden
  ; Syntax examples:
  ; (OpenExcel "C:\\Temp\\Temp.xls" "Sheet2" t) = Opens C:\Temp\Temp.xls on Sheet2 as visible session
  ; (OpenExcel "C:\\Temp\\Temp.xls" nil nil) = Opens C:\Temp\Temp.xls on current sheet as hidden session
  ; (OpenExcel nil "Parts List" nil) =  Opens a new spreadsheet and creates a Part List sheet as hidden session
  ;-------------------------------------------------------------------------------
  (defun OpenExcel (ExcelFile$ SheetName$ Visible / Sheet$ Sheets@ Worksheet)
    (if (= (type ExcelFile$) 'STR)
      (if (findfile ExcelFile$)
        (setq *ExcelFile$ ExcelFile$)
        (progn
          (alert (strcat "Excel file " ExcelFile$ " not found."))
          (exit)
        );progn
      );if
      (setq *ExcelFile$ "")
    );if
    (gc)
    (if (setq *ExcelApp% (vlax-get-object "Excel.Application"))
      (progn
        
        (vlax-release-object *ExcelApp%)(gc)
      );progn
    );if
    (setq *ExcelApp% (vlax-get-or-create-object "Excel.Application"))
    (if ExcelFile$
      (if (findfile ExcelFile$)
        (vlax-invoke-method (vlax-get-property *ExcelApp% 'WorkBooks) 'Open ExcelFile$)
        (vlax-invoke-method (vlax-get-property *ExcelApp% 'WorkBooks) 'Add)
      );if
      (vlax-invoke-method (vlax-get-property *ExcelApp% 'WorkBooks) 'Add)
    );if
    (if Visible
      (vla-put-visible *ExcelApp% :vlax-true)
    );if
    (if (= (type SheetName$) 'STR)
      (progn
        (vlax-for Sheet$ (vlax-get-property *ExcelApp% "Sheets")
          (setq Sheets@ (append Sheets@ (list (vlax-get-property Sheet$ "Name"))))
        );vlax-for
        (if (member SheetName$ Sheets@)
          (vlax-for Worksheet (vlax-get-property *ExcelApp% "Sheets")
            (if (= (vlax-get-property Worksheet "Name") SheetName$)
              (vlax-invoke-method Worksheet "Activate")
            );if
          );vlax-for
          (vlax-put-property (vlax-invoke-method (vlax-get-property *ExcelApp% "Sheets") "Add") "Name" SheetName$)
        );if
      );progn
    );if
    (princ)
  );defun OpenExcel
  ;-------------------------------------------------------------------------------
  ; PutCell - Put values into Excel cells
  ; Arguments: 2
  ;   StartCell$ = Starting Cell ID
  ;   Data@ = Value or list of values
  ; Syntax examples:
  ; (PutCell "A1" "PART NUMBER") = Puts PART NUMBER in cell A1
  ; (PutCell "B3" '("Dim" 7.5 "9.75")) = Starting with cell B3 put Dim, 7.5, and 9.75 across
  ;-------------------------------------------------------------------------------
  (defun PutCell (StartCell$ Data@ / Cell$ Column# ExcelRange Row#)
    (if (= (type Data@) 'STR)
      (setq Data@ (list Data@))
    )
    (setq ExcelRange (vlax-get-property *ExcelApp% "Cells"))
    (if (Cell-p StartCell$)
      (setq Column# (car (ColumnRow StartCell$))
            Row# (cadr (ColumnRow StartCell$))
      );setq
      (if (vl-catch-all-error-p
            (setq Cell$ (vl-catch-all-apply 'vlax-get-property
              (list (vlax-get-property *ExcelApp% "ActiveSheet") "Range" StartCell$))
            );setq
          );vl-catch-all-error-p
         
          (setq Column# (vlax-get-property Cell$ "Column")
                Row# (vlax-get-property Cell$ "Row")
          );setq
      );if
    );if
    (if (and Column# Row#)
      (foreach Item Data@
        (vlax-put-property ExcelRange "Item" Row# Column# (vl-princ-to-string Item))
        (setq Column# (1+ Column#))
      );foreach
    );if
    (princ)
  );defun PutCell
  ;-------------------------------------------------------------------------------
  ; CloseExcel - Closes Excel spreadsheet
  ; Arguments: 1
  ;   ExcelFile$ = Excel saveas filename or nil to close without saving
  ; Syntax examples:
  ; (CloseExcel "C:\\Temp\\Temp.xls") = Saveas C:\Temp\Temp.xls and close
  ; (CloseExcel nil) = Close without saving
  ;-------------------------------------------------------------------------------
  (defun CloseExcel (ExcelFile$ / Saveas)
    (if ExcelFile$
      (if (= (strcase ExcelFile$) (strcase *ExcelFile$))
        (if (findfile ExcelFile$)
          (vlax-invoke-method (vlax-get-property *ExcelApp% "ActiveWorkbook") "Save")
          (setq Saveas t)
        );if
        (if (findfile ExcelFile$)
          (progn
            (vl-file-delete (findfile ExcelFile$))
            (setq Saveas t)
          );progn
          (setq Saveas t)
        );if
      );if
    );if
    (if Saveas
      (vlax-invoke-method (vlax-get-property *ExcelApp% "ActiveWorkbook")
        "SaveAs" ExcelFile$ -4143 "" "" :vlax-false :vlax-false nil
      );vlax-invoke-method
    );if
    (vlax-invoke-method (vlax-get-property *ExcelApp% "ActiveWorkbook") 'Close :vlax-False)
    (vlax-invoke-method *ExcelApp% 'Quit)
    (vlax-release-object *ExcelApp%)(gc)
    (setq *ExcelApp% nil *ExcelFile$ nil)
    (princ)
  );defun CloseExcel
  ;-------------------------------------------------------------------------------
  ; ColumnRow - Returns a list of the Column and Row number
  ; Function By: Gilles Chanteau from Marseille, France
  ; Arguments: 1
  ;   Cell$ = Cell ID
  ; Syntax example: (ColumnRow "ABC987") = '(731 987)
  ;-------------------------------------------------------------------------------
  (defun ColumnRow (Cell$ / Column$ Char$ Row#)
    (setq Column$ "")
    (while (< 64 (ascii (setq Char$ (strcase (substr Cell$ 1 1)))) 91)
      (setq Column$ (strcat Column$ Char$)
            Cell$ (substr Cell$ 2)
      );setq
    );while
    (if (and (/= Column$ "") (numberp (setq Row# (read Cell$))))
      (list (Alpha2Number Column$) Row#)
      '(1 1);default to "A1" if there's a problem
    );if
  );defun ColumnRow
  ;-------------------------------------------------------------------------------
  ; Alpha2Number - Converts Alpha string into Number
  ; Function By: Gilles Chanteau from Marseille, France
  ; Arguments: 1
  ;   Str$ = String to convert
  ; Syntax example: (Alpha2Number "ABC") = 731
  ;-------------------------------------------------------------------------------
  (defun Alpha2Number (Str$ / Num#)
    (if (= 0 (setq Num# (strlen Str$)))
      0
      (+ (* (- (ascii (strcase (substr Str$ 1 1))) 64) (expt 26 (1- Num#)))
        (Alpha2Number (substr Str$ 2))
      );+
    );if
  );defun Alpha2Number
  ;-------------------------------------------------------------------------------
  ; Number2Alpha - Converts Number into Alpha string
  ; Function By: Gilles Chanteau from Marseille, France
  ; Arguments: 1
  ;   Num# = Number to convert
  ; Syntax example: (Number2Alpha 731) = "ABC"
  ;-------------------------------------------------------------------------------
  (defun Number2Alpha (Num# / Val#)
    (if (< Num# 27)
      (chr (+ 64 Num#))
      (if (= 0 (setq Val# (rem Num# 26)))
        (strcat (Number2Alpha (1- (/ Num# 26))) "Z")
        (strcat (Number2Alpha (/ Num# 26)) (chr (+ 64 Val#)))
      );if
    );if
  );defun Number2Alpha
  ;-------------------------------------------------------------------------------
  ; Cell-p - Evaluates if the argument Cell$ is a valid cell ID
  ; Function By: Gilles Chanteau from Marseille, France
  ; Arguments: 1
  ;   Cell$ = String of the cell ID to evaluate
  ; Syntax examples: (Cell-p "B12") = t, (Cell-p "BT") = nil
  ;-------------------------------------------------------------------------------
  (defun Cell-p (Cell$)
    (and (= (type Cell$) 'STR)
      (or (= (strcase Cell$) "A1")
        (not (equal (ColumnRow Cell$) '(1 1)))
      );or
    );and
  );defun Cell-p
  ;-------------------------------------------------------------------------------
  ; Row+n - Returns the cell ID located a number of rows from cell
  ; Function By: Gilles Chanteau from Marseille, France
  ; Arguments: 2
  ;   Cell$ = Starting cell ID
  ;   Num# = Number of rows from cell
  ; Syntax examples: (Row+n "B12" 3) = "B15", (Row+n "B12" -3) = "B9"
  ;-------------------------------------------------------------------------------
  (defun Row+n (Cell$ Num#)
    (setq Cell$ (ColumnRow Cell$))
    (strcat (Number2Alpha (car Cell$)) (itoa (max 1 (+ (cadr Cell$) Num#))))
  );defun Row+n
  ;-------------------------------------------------------------------------------
  ; Column+n - Returns the cell ID located a number of columns from cell
  ; Function By: Gilles Chanteau from Marseille, France
  ; Arguments: 2
  ;   Cell$ = Starting cell ID
  ;   Num# = Number of columns from cell
  ; Syntax examples: (Column+n "B12" 3) = "E12", (Column+n "B12" -1) = "A12"
  ;-------------------------------------------------------------------------------
  (defun Column+n (Cell$ Num#)
    (setq Cell$ (ColumnRow Cell$))
    (strcat (Number2Alpha (max 1 (+ (car Cell$) Num#))) (itoa (cadr Cell$)))
  );defun Column+n
  ;-------------------------------------------------------------------------------
  ; rtosr - Used to change a real number into a short real number string
  ; stripping off all trailing 0's.
  ; Arguments: 1
  ;   RealNum~ = Real number to convert to a short string real number
  ; Returns: ShortReal$ the short string real number value of the real number.
  ;-------------------------------------------------------------------------------
  (defun rtosr (RealNum~ / DimZin# ShortReal$)
    (setq DimZin# (getvar "DIMZIN"))
    (setvar "DIMZIN" 8)
    (setq ShortReal$ (rtos RealNum~ 2 8))
    (setvar "DIMZIN" DimZin#)
    ShortReal$
  );defun rtosr
  ;-------------------------------------------------------------------------------
  (princ);End of GetExcel.lsp

;==========================================================
;Fonction pour le remplissage de tableau excel de l'export               
;==========================================================
(defun Sous/Sol ()
  (remplir_sheet_titre)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "SDP" t)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D51" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E51" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F51" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H51" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I51"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J51" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K51" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L51" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M51" total_val_text_sdp_cell)
)
(princ)

(defun 2Sous/Sol ()
  (remplir_sheet_titre)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "SDP" t)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D52" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E52" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F52" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H52" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I52"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J52" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K52" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L52" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M52" total_val_text_sdp_cell)
)
(princ)
(defun 3Sous/Sol ()
  (remplir_sheet_titre)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "SDP" t)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D53" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E53" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F53" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H53" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I53"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J53" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K53" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L53" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M53" total_val_text_sdp_cell)
)
(princ)
(defun 4Sous/Sol ()
  (remplir_sheet_titre)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "SDP" t)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D54" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E54" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F54" total_val_text_180_cell )
	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H54" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I54"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J54" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K54" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L54" total_val_text_i_cell)
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M54" total_val_text_sdp_cell)
)
(princ)

(defun 5Sous/Sol ()
  (remplir_sheet_titre)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "SDP" t)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D55" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E55" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F55" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H55" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I55"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J55" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K55" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L55" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M55" total_val_text_sdp_cell)
)
(princ)
(defun 6Sous/Sol ()
  (remplir_sheet_titre)
  ;(OpenExcel "C:/Temp/test_model.xlsx" "SDP" t)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D56" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E56" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F56" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H56" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I56"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J56" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K56" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L56" total_val_text_i_cell)
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M56" total_val_text_sdp_cell)
)
(princ)

(defun test_caractére_spéciaux()
    (setq è (strcat "\\U+00E8" ))
    (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
    (alert combined_response)
    (OpenExcel combined_response "SDP" t)
)



(defun Rez_de_chaussée ()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  (alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D50" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E50" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F50" total_val_text_180_cell )
	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H50" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I50"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J50" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K50" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L50" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M50" total_val_text_sdp_cell)
)
(princ)


(defun 1er_Etage()

  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D49" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E49" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F49" total_val_text_180_cell )
	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H49" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I49"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J49" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K49" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L49" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M49" total_val_text_sdp_cell)
)
(princ)


(defun 2eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D48" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E48" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F48" total_val_text_180_cell )
	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H48" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I48"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J48" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K48" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L48" total_val_text_i_cell)
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M48" total_val_text_sdp_cell)
)
(princ)


(defun 3eme_Etage()
   (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D47" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E47" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F47" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H47" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I47"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J47" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K47" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L47" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M47" total_val_text_sdp_cell)
)
(princ)


(defun 4eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D46" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E46" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F46" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H46" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I46"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J46" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K46" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L46" total_val_text_i_cell)
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M46" total_val_text_sdp_cell)
)
(princ)

(defun 5eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D45" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E45" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F45" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H45" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I45"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J45" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K45" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L45" total_val_text_i_cell)
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M45" total_val_text_sdp_cell)
)
(princ)

(defun 6eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D44" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E44" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F44" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H44" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I44"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J44" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K44" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L44" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M44" total_val_text_sdp_cell)
)
(princ)

(defun 7eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D43" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E43" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F43" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H43" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I43"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J43" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K43" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L43" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M43" total_val_text_sdp_cell)
)
(princ)

(defun 8eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D42" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E42" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F42" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H42" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I42"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J42" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K42" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L42" total_val_text_i_cell)
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M42" total_val_text_sdp_cell)
)
(princ)
(defun 9eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D41" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E41" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F41" total_val_text_180_cell )
	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H41" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I41"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J41" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K41" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L41" total_val_text_i_cell)
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M41" total_val_text_sdp_cell)
)
(princ)
(defun 10eme_Etage()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
 ; (alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D40" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E40" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F40" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H40" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I40"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J40" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K40" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L40" total_val_text_i_cell)
  
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M40" total_val_text_sdp_cell)
)
(princ)

(defun toitures_terrasses()
  (remplir_sheet_titre)
  (setq è (strcat "\\U+00E8" ))
  (setq combined_response (strcat  "Q:/Charte_Graphique/Mod"è"les/Tableaux/Surfaces/GEX-CONSEIL_SHO_SDP_SUB_SUN_GLA_TSB_RDV_Cerfa PC.xls"))
  ;(alert combined_response)
  (OpenExcel combined_response "SDP" t)
	;===================================== Planchers avant déductions =========================
  (setq total_val_text_SP_cell  (rtos total_val_text_SP 2 0) )
  ;(alert total_val_text_SP_cell)
  (PutCell "D39" total_val_text_SP_cell )

	;======================================== VIDES ===========================================
	(setq total_val_text_V_cell (rtos total_val_text_V 2 0))
  ;(alert total_val_text_V_cell)
  (PutCell "E39" total_val_text_V_cell )

	;======================================= H 180 ============================================
	(setq total_val_text_180_cell (rtos total_val_text_180 2 0))
  ;(alert total_val_text_180_cell)
  (PutCell "F39" total_val_text_180_cell )

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST_cell (rtos total_val_text_ST 2 0))
  ;(alert total_val_text_ST_cell)
  (PutCell "H39" total_val_text_ST_cell )

	;======================================== COMBLES =========================================
	(setq total_val_text_CO_cell (rtos total_val_text_CO 2 0))
  ;(alert total_val_text_CO_cell)
  (PutCell "I39"  total_val_text_CO_cell )
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT_cell (rtos total_val_text_LT 2 0))
  ;(alert total_val_text_LT_cell)
  (PutCell "J39" total_val_text_LT_cell )

	;======================================= CAVE =============================================
	(setq total_val_text_c_cell  (rtos total_val_text_c 2 0) )
  ;(alert total_val_text_c_cell)
  (PutCell "K39" total_val_text_c_cell)
	
	;====================================== ISOLATION =========================================
	
	(setq total_val_text_i_cell   (rtos total_val_text_i 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "L39" total_val_text_i_cell)
  
  ;===================================sdp Total=============================================
  (setq total_val_text_sdp_cell   (rtos total_val_text_sdp 2 0))
  ;(alert total_val_text_i_cell)
  (PutCell "M39" total_val_text_sdp_cell)
)
(princ)


(defun  EXPORT ( / ss i rows ent filepath)
 
  ;; Select the text objects
  (setq ss (ssget "X" '((0 . "TEXT") )))
 
    ;;;; Or maybe you also want MTEXT, then you uncomment this next line
    ;;;; notice: Mtext encodes "new line" as "\P", and may also contain code for style (like color, bold...)
    ;; (setq ss (ssget "X" '((0 . "TEXT,MTEXT") )))
    
  ;; the head (column titles) of the CSV.  You coule leave this blank, like this: (setq rows (list))
  (setq rows (list (list "LAYER" "X" "Y" "ROTATION" "TEXT" "SURFACE")))
 
  ;; read the data, put it in a list (in variable rows)
  (setq i 0)
  (repeat (sslength ss)
    
    (setq ent (entget (ssname ss i)))  ;; extract the properties
    
    ;; add the data to rows
    (setq rows (append rows (list (list
      (cdr (assoc 8 ent))                                   ;; Layer
      (rtos (nth 0 (cdr (assoc 10 ent))) 2 16)              ;; X value, notice: numbers must be converted to text, that's what the rtos does.  Feel free to change the precision (the 16)
      (rtos (nth 1 (cdr (assoc 10 ent))) 2 16)              ;; Y value
      (rtos (/ (* (cdr (assoc 50 ent)) 180) pi ) 2 16)      ;; rotation  - ("angle in rad" * 180 / pi) = angle in 360 degrees
      (cdr (assoc 1 ent))                                   ;; Text contents
    ))))
    
    (setq i (+ i 1))
  )

  
  (setq filepath (strcat (getvar "dwgprefix") (vl-filename-base (getvar "dwgname")) ".csv"))
  ;; save to csv
  (if
    (WriteCSV  rows filepath)
   ;; (WriteCSV total_val_text_sdp filepath)  ; input doit etre liste mais pas un seul valeur 

    (progn (princ "\nSaved as: ") (princ  filepath))
    (progn (princ "\nSomething went wrong"))
  )
 
  (princ)
 
)


;;; fonction qui recupere le texte des hachures et calcule les elements de la legende puis les affiche
(defun getDesignationEtAfficheValeursdp(calqueC texte)
	(print calqueC)
	(setq ind 0 total_val 0 total 0)
	(setq sel_SP (ssget "x" (list (cons 8 calqueC) (cons 0 "TEXT"))))	
	
	(if (/= sel_SP nil)	
		(progn
			(while (setq nm (ssname sel_SP ind))
				(setq val_text_SP (assoc 1 (entget nm))
					val_text_SP (atof (cdr val_text_SP))
					total_val (+ total val_text_SP)
					total total_val
					ind (1+ ind)) 
			)
			(command "-attedit" "N" "N" "SDP" texte "0" "0" (rtos total_val 2 0))
			(princ total_val)	
		)
		(princ total_val)
	)
)
;===================================================
; 				SDT  :  TABLEAU SDP
;===================================================
;===================================================
; 				SDT  :  TABLEAU SDP
;===================================================
(defun sdt ()
	;===================================== Planchers avant déductions =========================
	(setq total_val_text_SP (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_SDP_su" "SP"))

	;======================================== VIDES ===========================================
	(setq total_val_text_V (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_2-tremie_su" "V"))

	;======================================= H 180 ============================================
	(setq total_val_text_180 (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_3-h-180_su" "180"))

	;====================================== TOTAL TA ==========================================
	(setq total_val_text_TA (- (atof (rtos total_val_text_SP 2 0)) (atof (rtos total_val_text_V 2 0)) (atof (rtos total_val_text_180 2 0)) ))
	(setq total_val_text_TA (rtos total_val_text_TA 2 0))
	
	(command "-attedit" "N" "N" "SDP" "TA" "0" "0" total_val_text_TA)

	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_5-PK_su" "ST"))

	;======================================== COMBLES =========================================
	(setq total_val_text_CO (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_6-combles_su" "CO"))

	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_7-LT_su" "LT"))

	;======================================= CAVE =============================================
	(setq total_val_text_c (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_8-cave_su" "C"))
	
	;====================================== ISOLATION =========================================
  (test_alert) ; choix des catégories de batiments
	(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
	(setvar "osmode" os)
	(princ "\n")
	(princ)
)
(princ)

;;; fonction qui recupere le texte des hachures et calcule les elements de la legende puis les affiche
(defun getDesignationEtAfficheValeursdp(calqueC texte)
	(print calqueC)
	(setq ind 0 total_val 0 total 0)
	(setq sel_SP (ssget "x" (list (cons 8 calqueC) (cons 0 "TEXT"))))	
	
	(if (/= sel_SP nil)	
		(progn
			(while (setq nm (ssname sel_SP ind))
				(setq val_text_SP (assoc 1 (entget nm))
					val_text_SP (atof (cdr val_text_SP))
					total_val (+ total val_text_SP)
					total total_val
					ind (1+ ind)) 
			)
			(command "-attedit" "N" "N" "SDP" texte "0" "0" (rtos total_val 2 0))
			(princ total_val)	
		)
		(princ total_val)
	)
)

;=============== FIN SDT =========================== 

;========================================= Fonction fait la récupération des valeurs ===========================================

 (defun test_alert (/ wss)
  (setq wss (vlax-get-or-create-object "WScript.Shell"))
  ;(vlax-invoke wss 'popup "Foo" 2 "Les categories de Batiments" 0)
     (setq dcl_id (load_dialog "SDP.dcl"))
      (if (not (new_dialog "diag_alert" dcl_id))
      (exit)
      )
     
      (action_tile "cancel" "(done_dialog) (setq result nil)")
      (action_tile "accept" "(done_dialog) (setq result T)" )
   
      (action_tile "M" "(mixte)")
      (action_tile "L" "(locaux)")
      (action_tile "H" "(habitation)")
      (vlax-release-object wss)
      (start_dialog)
      (unload_dialog dcl_id)
      (princ)
      
)

(defun mixte()
    ;(setq wss (vlax-get-or-create-object "WScript.Shell"))
    (setq dcl_id (load_dialog "SDP.dcl"))
      (if (not (new_dialog "input_superficie" dcl_id))
          (exit)
      )
    
    (setq superficie (get_tile "superficie"))
    (action_tile "cancel" "(done_dialog) (setq result nil)")
    (action_tile "accept" "(done_dialog) (setq result superficie)" )
    (start_dialog)
    (unload_dialog dcl_id)
    
    (setq total_val_text_i (* (superficie) 0.10))
    (command "-attedit" "N" "N" "SDP" "ISOL" "0" "0" (rtos total_val_text_i 2 0))
    ;========================================= SDP ===========================================
    (setq total_val_text_sdp (- (atof total_val_text_TA) (atof (rtos total_val_text_ST 2 0)) (atof (rtos total_val_text_CO 2 0)) (atof (rtos total_val_text_LT 2 0))
    (atof (rtos total_val_text_c 2 0)) (atof (rtos total_val_text_i 2 0)) ))
    (setq total_val_text_sdp (atoi (rtos total_val_text_sdp 2 0)))
    (princ total_val_text_sdp)
    (command "-attedit" "N" "N" "SDP" "SDP" "0" "0" total_val_text_sdp)
    ;(alert "*********   O P E R A T I O N    T E R M I N E E   *********")
 
 ; (vlax-release-object wss)
)
(defun locaux()
    (setq total_val_text_i 0.0)
    (command "-attedit" "N" "N" "SDP" "ISOL" "0" "0" (rtos total_val_text_i 2 0))
	
    ;========================================= SDP ===========================================
    (setq total_val_text_sdp (- (atof total_val_text_TA) (atof (rtos total_val_text_ST 2 0)) (atof (rtos total_val_text_CO 2 0)) (atof (rtos total_val_text_LT 2 0))
    (atof (rtos total_val_text_c 2 0)) (atof (rtos total_val_text_i 2 0)) ))
    
    (setq total_val_text_sdp (atoi (rtos total_val_text_sdp 2 0)))
    (princ total_val_text_sdp)
    (princ "\n")
    
    (command "-attedit" "N" "N" "SDP" "SDP" "0" "0" total_val_text_sdp)
    ;(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
    (setvar "osmode" os)
    (princ "\n")
    (princ)

)     

(defun habitation()
    (setq total_val_text_i (* (- (atof total_val_text_TA) total_val_text_LT total_val_text_c total_val_text_CO total_val_text_ST ) 0.10))
    (command "-attedit" "N" "N" "SDP" "ISOL" "0" "0" (rtos total_val_text_i 2 0))
    ;========================================= SDP ===========================================
    (setq total_val_text_sdp (- (atof total_val_text_TA) (atof (rtos total_val_text_ST 2 0)) (atof (rtos total_val_text_CO 2 0)) (atof (rtos total_val_text_LT 2 0))
    (atof (rtos total_val_text_c 2 0)) (atof (rtos total_val_text_i 2 0)) ))
    
    (setq total_val_text_sdp (atoi (rtos total_val_text_sdp 2 0)))
    (princ total_val_text_sdp)
    (princ "\n")
    
    (command "-attedit" "N" "N" "SDP" "SDP" "0" "0" total_val_text_sdp)
    ;(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
    (setvar "osmode" os)
    (princ "\n")
    (princ)
  )
	
   


;===================================================
; MISE A ZERO DE TOUTES LES VALEURS DU TABLEAU SDP 
;===================================================
;===================================================
; MISE A ZERO DE TOUTES LES VALEURS DU TABLEAU SDP 
;===================================================
(defun sd0 ()
	; edition de la légende et remettre toutes les valeurs à 0
	(command "-attedit" "N" "N" "SDP" "SP" (rtos total_val_text_SP 2 0) (rtos total_val_text_SP 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "V" (rtos total_val_text_V 2 0) (rtos total_val_text_V 2 0) "0" )
    (command "_regen")
    (command "-attedit" "N" "N" "SDP" "180" (rtos total_val_text_180 2 0) (rtos total_val_text_180 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "TA" total_val_text_TA total_val_text_TA "0" )
	(command "_regen")
    (command "-attedit" "N" "N" "SDP" "ST" (rtos total_val_text_ST 2 0) (rtos total_val_text_ST 2 0) "0" )
	(command "_regen")
    (command "-attedit" "N" "N" "SDP" "CO" (rtos total_val_text_CO 2 0) (rtos total_val_text_CO 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "LT" (rtos total_val_text_LT 2 0) (rtos total_val_text_LT 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "C" (rtos total_val_text_c 2 0) (rtos total_val_text_c 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "ISOL" (rtos total_val_text_i 2 0) (rtos total_val_text_i 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "SDP" (atoi (rtos total_val_text_sdp 2 0)) (atoi (rtos total_val_text_sdp 2 0)) "0" )
	(command "_regen")
	)

;======= FIN SD0 ===================================


;======= FIN SD0 ===================================
(defun c:SDP_Plugin_v1 ()
    ; pour compter temps d'exécution
;(vlax-ldata-put "DenisH" "ComptTmpDeb" (getvar 'millisecs))
;(princ "\tD\U+00E9but du chronom\U+00E8tre...")
;(princ) 
;define the function

  (setq dcl_id (load_dialog "SDP.dcl"))
  ;load the DCL file

  (if (not (new_dialog "Justification" dcl_id))
  ;load the dialogue box

    (exit)
    ;if not loaded exit
  )
  
;=========================================================================
  ;; Get the current values from each toggle tile calques :
;=========================================================================    
    (setq 2-tremieVar (get_tile "2-tremie"))
    (setq 3-h-180Var (get_tile "3-h-180"))
    (setq 5-pkVar (get_tile "5-pk"))
    (setq 6-comblesVar (get_tile "6-combles"))
    (setq 7-ltVar (get_tile "7-lt"))
    (setq 8-caveVar (get_tile "8-cave"))
    (setq teinte_contourVar (get_tile "teinte_contour"))
  
    (setq sdp_SDP_suVar (get_tile "sdp_SDP_su"))
    (setq 2-tremie_suVar (get_tile "2-tremie_su"))
    (setq 3-h-180_suVar (get_tile "3-h-180_su"))
    (setq 5-pk_suVar (get_tile "5-pk_su"))
    (setq 6-combles_suVar (get_tile "6-combles_su"))
    (setq 7-lt_suVar (get_tile "7-lt_su"))
    (setq 8-cave_suVar (get_tile "8-cave_su"))
    
      
    (action_tile "2-tremie" "(setq 2-tremieVar $value) (tremie)")
    (action_tile "3-h-180" "(setq 3-h-180Var $value)(h-180)")
    (action_tile "5-pk" "(setq 5-pkVar $value)(5-pk)")
    (action_tile "6-combles" "(setq 6-comblesVar $value)(6-combles)")
    (action_tile "7-lt" "(setq 7-ltVar $value)(7-lt)")
    (action_tile "8-cave" "(setq 8-caveVar $value)(8-cave)")
    (action_tile "teinte_contour" "(setq teinte_contourVar $value)(teinte-contours)")
    
    (action_tile "sdp_SDP_su" "(setq sdp_SDP_suVar $value)(sdp_SDP_su)")
    (action_tile "2-tremie_su" "(setq 2-tremie_suVar $value) (tremie-su)")
    (action_tile "3-h-180_su" "(setq 3-h-180_suVar $value)(h-180_su)")
    (action_tile "5-pk_su" "(setq 5-pk_suVar $value)(5-pk_su)")
    (action_tile "6-combles_su" "(setq 6-combles_suVar $value)(6-combles_su)")
    (action_tile "7-lt_su" "(setq 7-lt_suVar $value)(7-lt_su)")
    (action_tile "8-cave_su" "(setq 8-cave_suVar $value)(8-cave_su)")
    
   ;DEstinations calques
    (action_tile "1-spic" " (1-spic)(PostRequest_1-spic)")
    (action_tile "1-industrie" "(1-industrie)(PostRequest_1-industrie)")
    (action_tile "1-hotelier" "(1-hotelier)(PostRequest_1-hotelier)")
    (action_tile "1-habitation" "(1-habitation)(PostRequest_1-habitation)")
    (action_tile "1-exploitation" "(1-exploitation)(PostRequest_1-exploitation)")
    (action_tile "1-entrepot" "(1-entrepot)(PostRequest_1-entrepot)")
    (action_tile "1-commerce" "(1-commerce)(PostRequest_1-commerce)")
    (action_tile "1-bureau" "(1-bureau)(PostRequest_1-bureau)")
    (action_tile "1-artisanat" "(1-artisanat)(PostRequest_1-artisanat)")
      
     ;; Lookup table converts "0/1″ strings to the correct integers:
    (if (= 2-tremieVar "1") (setq 2-tremieNum 64) (setq 2-tremieNum 0))
    (if (= 3-h-180Var "1") (setq 3-h-180Num 64) (setq 3-h-180Num 0))
    (if (= 5-pkVar "1") (setq 5-pkNum 64) (setq 5-pkNum 0))
    (if (= 7-ltVar "1") (setq 7-ltNum 64) (setq 7-ltNum 0))
    (if (= 8-caveVar "1") (setq 8-caveNum 64) (setq 8-caveNum 0))
    (if (= teinte_contourVar "1") (setq teinte_contourNum 64) (setq teinte_contourNum 0)) 
         
;; Add up the integers, and then change system variable
    (setq vars (+ 2-tremieNum 3-h-180Num 5-pkNum 7-ltNum 8-caveNum teinte_contourNum))
    (setvar "pdmode" vars)
  ;=========================================================================
         ;; Get the current values from each radio button Styles :
  ;=========================================================================    
  (action_tile "SwissBlack" "(alert_style_Swiss_black)")
  (action_tile "Arial" "(alert_style_arial)")
  (action_tile "Roman" "(alert_style_roman)")
     ; Lookup table:

    (if (= swissVar "1") (setq vars 0))
    (if (= ArialVar "1") (setq vars 1))
    (if (= romanVar "1") (setq vars 2) )  
   ;=========================================================================
            ;; Get the current values from each radio button HASH :
   ;=========================================================================        
    (action_tile "SOLID" "(setq solidVar $value)(hsolid )" )
    (action_tile "ANGLE" "(setq angleVar $value)(hangle)" )
    (action_tile "ANSI32" "(setq ansiVar $value)(hansi32)"  )


    ;type Hachures
    (action_tile "type1" "(setq type1 $value)(Predetermine)"  )
    (action_tile "type2" "(setq type2 $value)(definieparUser)"  ) 
    ;;(action_tile "insert" "(setq insert_url $value")
    ;(action_tile "insert1"   "(PostRequest)"
      ; (strcat   ;Récupérer insert lien 
      ; "(progn (setq URL (get_tile \"insert\") (setq userclick T))"
      ;  )
    ;)
    (setq
      python "C:/Users/adziri/AppData/Local/Programs/Python/Python310/python.exe"
      ;python "C:/Users/<yourUsername>/AppData/Local/Programs/Python/Python35-32/python.exe"
      pyscript "C:/Temp/Scrapping_tache_v01.py"
    )
    
    ;(action_tile "Scrapping" "(startapp python pyscript)")
    (action_tile "plot" "(Plot_cartouche)")
    (action_tile "insertGabarit" "(gabarit_load)")
    (action_tile "insert1"   "(MyRequest)(done_dialog 2)")  
    (action_tile "cancel" "(done_dialog) (setq result nil)")
    (action_tile "accept" "(done_dialog) (setq result T) " )
 
    (action_tile "extract" "(CALL)")
    (action_tile "export" "(alert_ETAGE)(done_dialog 2)")
    (action_tile "SDP" "(sdp)(done_dialog 2)" )
    (action_tile "SD0" "(sd0)(done_dialog 2)" )
    (action_tile "SDT" "(sdt)")
  
    (action_tile "next"
                (vl-prin1-to-string
                   '(
                           ((lambda ( f ) (if f (openDWG f))) (getfiled "Selectionner le plan DWG" "M:/1_PRODUCTION_" "" 16))
                        
                    )
                )
            )
  (action_tile "help"   "(SDP-Help)")
  (action_tile "reset"  "(done_dialog 2)")
  (start_dialog)
  (unload_dialog dcl_id)
  (princ)
 ; (vlax-ldata-put "DenisH" "ComptTmpFin" (getvar 'millisecs))
     ; (princ "\tFin du chronom\U+00E8tre...")
     ; (setq ComptTmp (- (vlax-ldata-get "DenisH" "ComptTmpFin") (vlax-ldata-get "DenisH" "ComptTmpDeb")))
     ; (alert  (strcat " Fin du chronom\U+00E8tre...\nTemps \U+00E9coul\U+00E8 : "
             ;    (itoa (setq h (/ ComptTmp 3600000)))
              ;   "h "
              ;   (itoa (setq m (/ (setq r (- ComptTmp (* h 3600000))) 60000)))
              ;   "m "
             ;    (rtos (/ (- r (* m 60000)) 1000.) 2 3)
            ;     "s"
       ;  ) ;_ Fin de strcat
      ; ) ;_ Fin de prompt
		;	(princ "\n")
		;	(princ)
 

);defun

 
 
(vl-load-com) (c:LispLogON) (princ)





