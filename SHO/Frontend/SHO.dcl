
gabarit_Odoo : dialog 
{
  label =  "Extraction data Odoo";
	key = "data_odoo";
  spacer;

 
: row {
    ok_button;fixed_width=true;is_cancel=true;alignment = centered;
    cancel_button;fixed_width=true;is_cancel=true;alignment = centered;
 }
	}



Justification : dialog
              { label =  "Plugin Zwcad SHO V0.1";
             
                spacer;
           
                
                : row {
                  : boxed_column {
                    label = "Charger les elements du Plugin";
                     
            
                     
                        label = "Inserer les parametres necessaires SHO";
                       
                    : row {
                   // : edit_box {	key = "insert" ;label = "&Insert URL ticket Odoo" : ;	edit_width = 100 ;	edit_limit = 20000 ;		}	 
                    
                            : row {
                              :column {
                         label = "&Odoo";
                          width = 7;     
                      : row {
                         : button { label = "Inserer Gabarit SHO";key = "insertGabarit";alignment=centered;fixed_height =true;fixed_width = true ;is_cancel=true;}
                         : edit_box {	key = "insert" ;label = "&Insert URL ticket Odoo" : ;	edit_width = 100 ;		}	
                        
                          : button { label = "Insert URL Odoo";key = "insert1"; fixed_height =true;alignment=centered;fixed_width =true;}
                           //: button { label = "Scrapping Odoo";key = "Scrapping"; fixed_height =true;alignment=centered;fixed_width =true;}
                          : button { label = "Plot cartouche";key = "plot"; fixed_height =true;alignment=centered;fixed_width =true;}
                      }
                      
                      // : row {
                         //  : button { label = "Insert URL Odoo";key = "insert1"; fixed_height =true;alignment=centered;fixed_width =true;}
                        //   : button { label = "Scrapping Odoo";key = "Scrapping"; fixed_height =true;alignment=centered;fixed_width =true;}
                      // }
                    
                    } 
                              
                            }
                    
                             
                    }
                  

                    spacer;
                  }
              
                }
                  :row{
                        
                         :column {  
                          label = "&Destinations";
                          width = 7;     
                          : radio_button {key = "1-artisanat"  ; label = "GEX_EDS_sho_1-artisanat.";}  
                          : radio_button {key = "1-bureau"  ; label = "GEX_EDS_sho_1-bureau.";}    
                          : radio_button {key = "1-commerce" ; label = "GEX_EDS_sho_1-commerce.";}   
                          : radio_button {key = "1-entrepot" ; label = "GEX_EDS_sho_1-entrepot.";}        
                          : radio_button {key = "1-exploitation"  ; label = "GEX_EDS_sho_1-exploitation.";}          
                          : radio_button {key = "1-habitation"  ; label = "GEX_EDS_sho_1-habitation.";}       
                          : radio_button {key = "1-hotelier"  ; label = "GEX_EDS_sho_1-hotelier.";}
                          : radio_button {key = "1-industrie"  ; label = "GEX_EDS_sho_1-industrie.";}
                          : radio_button {key = "1-spic"  ; label = "GEX_EDS_sho_1-spic.";}  
          
                            }
                        //  : boxed_column {  
                          //label = "&Calques";
                          //width = 7;     
                          //: toggle {key = "2-tremie"  ; label = "GEX_EDS_sdp_2-tremie.";}  
                         // : toggle {key = "3-h-180"  ; label = "GEX_EDS_sdp_3-h-180.";}    
                          //: toggle {key = "5-pk" ; label = "GEX_EDS_sdp_5-pk.";}   
                         // : toggle {key = "6-combles" ; label = "GEX_EDS_sdp_6-combles.";}        
                         // : toggle {key = "7-lt"  ; label = "GEX_EDS_sdp_7-lt.";}          
                         // : toggle {key = "8-cave"  ; label = "GEX_EDS_sdp_8-cave.";}       
                         // : toggle {key = "teinte_contour"  ; label = "GEX_EDS_sdp_teinte_contour.";}
                         // : toggle {key = "sdp_SDP_su"  ; label = "GEX_EDS_sdp_SDP_su.";}
                         // : toggle {key = "2-tremie_su"  ; label = "GEX_EDS_sdp_2-tremie_su.";}  
                         // : toggle {key = "3-h-180_su"  ; label = "GEX_EDS_sdp_3-h-180_su.";}    
                         // : toggle {key = "5-pk_su" ; label = "GEX_EDS_sdp_5-pk_su.";}          
                         // : toggle {key = "6-combles_su"  ; label = "GEX_EDS_sdp_6-combles_su.";}          
                         // : toggle {key = "7-lt_su"  ; label = "GEX_EDS_sdp_7-lt_su.";}       
                         // : toggle {key = "8-cave_su"  ; label = "GEX_EDS_sdp_8-cave_su.";}

                          //  }
          
                          : row {
                              label = "&Options";
                                : column {
                                   : column {
                                      label = "&Font " ;   
                                      : row {
                                        :radio_button {key = "SwissBlack" ;label = "SwissBlack.ttf" ;}	
                                        :radio_button { key = "Arial" ;	 label = "Arial" ; }	
                                        :radio_button { key = "Roman" ;	label = "Roman" ;}
                                      }
                                } 
                                : column {
                                   label = "&Motif de Hachure" ;	key = "motif_hash"; 
                                   : row {
                                       : radio_button {		key = "SOLID" ;		label = "SOLID" ;}		       
                                        : radio_button {		key = "ANGLE" ;	label = "ANGLE" ;	 }			   	 
                                        : radio_button {		key = "ANSI32" ;	label = "ANSI32" ; }		
                                   }
                                     
                                }    
                                }    
                          }
                          
                          : column {
                              label = "&Actions";
                              width = 17;
                               // : button {label = "Charger le plan" ; key = "next";fixed_width=true;is_cancel=true;width=18;}
                                //: button {label = "Extract";key ="extract";fixed_width=true;is_cancel=true;width=18;fixed_width=true;}  
                                : button { label = "SHO";key = "SHO";fixed_width=true;is_cancel=true;width=18;alignment =centered;}
                                : button { label = "SHT";key = "SHT";fixed_width=true;is_cancel=true;width=18;alignment =centered;}
                                : button { label = "SH0";key = "SH0";fixed_width=true;is_cancel=true;width=18;alignment =centered;}
                                : button {label = "Export";key = "export";fixed_width=true;is_cancel=true;width=18;fixed_width=true;alignment =centered;} 
                                
                           
                          }
                          	 
                          }
                    
               
                     
              	 
                  
              
             :row {
                        ok_button;fixed_width=true;is_cancel=true;alignment = centered;
                        cancel_button;fixed_width=true;is_cancel=true;alignment = centered;
                        : button {label = "reset";key = "reset";fixed_width=true;is_cancel=true;alignment = centered;} 
                        : button {label = "help";key = "help";fixed_width=true;is_cancel=true;alignment = centered;} 
                        
                }
                }
              


diag_alert : dialog 
{
  label =  "Identification du type de Batiment";
	key = "main";
  spacer;

  :boxed_radio_column {	 
                              label = "&Identification du type de batiment " ; 
                              : radio_button {		key = "M" ;		label = "Batiments Mixtes(M)" ;}	       
                              : radio_button {		key = "L" ;	label = "Batiments Locaux(L)" ;	 }			   	 
                              : radio_button {		key = "H" ;	label = "Batiments Habitation(H) " ; }				 
                             }	
: row {
    ok_button;fixed_width=true;is_cancel=true;alignment = centered;
    cancel_button;fixed_width=true;is_cancel=true;alignment = centered;
 }
	}
input_superficie: dialog { 
         label = "Charger la superficie"; 
         : column { 
           : boxed_column { 
             : edit_box {
               key = "superficie";
               label = "Entrer la superficie de locaux d'habitation:";
               edit_width = 50;
               value = "";
               initial_focus = true;
             }
             :boxed_row{
              : button {
                  label = "OK";
                  key = "accept";
                  width = 12;
                  fixed_width = true;
                  mnemonic = "O";
                  is_default = true;
                  }

                  : button {
                  label = "Cancel";
                  key = "cancel";
                  width = 12;
                  fixed_width = true;
                  mnemonic = "C";
                  is_cancel = true;
                    }
                  : spacer { width = 1;}


             }
                

           }}}



Diag1 : dialog {
label = "Rectification du Font d'ecriture ";
width = 40;
: column {
: row {

: boxed_column {
label = "Styles URL ";

width = 22;
: row {
  : edit_box {
label = "URL Font:";
mnemonic = "URL";
key = "URL";
edit_width = 50;
}
: button {label = "Search" ; key = "Search";fixed_width=true;is_cancel=true;width=5;}

}

}
: boxed_column {

label = "Styles parametres ";
  : column {
  
: edit_box {
label = "Hauteur du texte:";
mnemonic = "H";
key = "H";
edit_width = 50;
}

: edit_box {
label = "Facteur de largeur :";
mnemonic = "L";
key = "L";
edit_width = 50;
}

: edit_box {
label = "Angle Oblique :";
mnemonic = "A";
key = "A";
edit_width = 50;
}
}
}


}
ok_cancel;
}
}

etage : dialog {
label = "Etages ";
width = 40;
: column {
: row {

: boxed_column {
label = "Etages du batiment";
width = 22;
: radio_button {key = "Toitures Terrasses"  ; label = "Toitures Terrasses.";}   
: radio_button {key = "10eme Etage"  ; label = "10eme Etage.";}    
: radio_button {key = "9eme Etage"  ; label = "9eme Etage.";}    
: radio_button {key = "8eme Etage"  ; label = "8eme Etage.";}     
: radio_button {key = "7eme Etage"  ; label = "7eme Etage.";}    
: radio_button {key = "6eme Etage" ; label = "6eme Etage.";}   
: radio_button {key = "5eme Etage" ; label = "5eme Etage.";}        
: radio_button {key = "4eme Etage"  ; label = "4eme Etage.";}          
: radio_button {key = "3eme Etage"  ; label = "3eme Etage.";}       
: radio_button {key = "2eme Etage"  ; label = "2eme Etage.";}
: radio_button {key = "1er Etage"  ; label = "1er Etage.";}
: radio_button {key = "Rez de Chaussee"  ; label = "Rez de Chaussee.";}  
: radio_button {key = "1er Sous/Sol"  ; label = "1er Sous/Sol.";}
: radio_button {key = "2eme Sous/Sol"  ; label = "2eme Sous/Sol.";}
: radio_button {key = "3eme Sous/Sol"  ; label = "3eme Sous/Sol.";}
: radio_button {key = "4eme Sous/Sol"  ; label = "4eme Sous/Sol.";}
: radio_button {key = "5eme Sous/Sol"  ; label = "5eme Sous/Sol.";}
: radio_button {key = "6eme Sous/Sol"  ; label = "6eme Sous/Sol.";}


}



}
ok_cancel;
}
}


plot : dialog {
label = "Remplissage de la cartouche SHO ";
width = 40;
: column {
: row {

: boxed_column {
label = "Cartouche SHO";
width = 22;
: radio_button {key = "commune"  ; label = "Commune .";}  
: radio_button {key = "city"  ; label = "City.";}    
: radio_button {key = "adress" ; label = "Adress.";}   
: radio_button {key = "cadastre" ; label = "Cadastre.";}        
: radio_button {key = "Mission"  ; label = "Mission.";}          
: radio_button {key = "nota"  ; label = "Nota.";}       

}



}
ok_cancel;
}
}