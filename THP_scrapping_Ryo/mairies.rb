

require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(jenaimarre) #paramètre qu'on appelle 

	page = Nokogiri::HTML(open("#{jenaimarre}")) # j'en ai vraiment marre :'( 
  
  print page.css("small" ).text #même principe que pour l'email, on inspecte la page d'une ville du 95, 
  #et on prend les éléments concernant les villes, ici "small", dans "commune de ..."
  

    email = page.css("td:contains('@')").text # => faire examiner element sur l'adresse email du site, l'email est entre les balises <td>
#mais <td> correpond aussi à d'autres elements donc il faut spécifié avec le @ pour que ça récupère l'adress e-mail
 		puts "  E-mail:" + email
end



def get_all_the_urls_of_val_doise_townhalls

   page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

	first_part = "http://annuaire-des-mairies.com/" # la première partie du lien 
	url = page.css("a.lientxt") # =>  faire examiner element sur l'un des liens des sites => a.lientxt 
	url.each do |links|   # permet de prendre en compte chaque element url contenant le a.lientxt
	
second_part = links['href'] # => la seconde partie des liens (on la trouve sur "examiner l'élément")
	final = URI.join(first_part, second_part) # ==> méthode .join permet de lier la premère partie --> "http:// ... etc" avec la seconde qui est le href

get_the_email_of_a_townhal_from_its_webpage(final) # emails appellent urls => liste des emails de chaque ville


     end

end 

 
 get_all_the_urls_of_val_doise_townhalls



