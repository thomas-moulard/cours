require 'erb'
require 'ostruct'

#setup template data
names = [["index.htm", "Le Sujet du stage"],
         ["entreprise.htm", "A propos de l'ENST"],
         ["travail.htm", "Travail effectué"],
         ["conclusion.htm", "Conclusion"],
         ["sep", "<hr/>"],
         ["exercices.htm", "Exercices"]
        ]


# template...
template = %q{
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="fr">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <meta name="keywords" content="Leroi Guillaume, ENST, vaucanson,
				   automate, java"/>
    <link rel="stylesheet" type="text/css" href="css/stage.css" />
    <title>Stage de tronc commun 2008 - Leroi Guillaume</title>
  </head>

  <body>

    <div id="header">
      <h1>
	Stage de tronc commun 2008
      </h1>
      <h2>
	Guillaume Leroi
      </h2>
    </div>

    <div id="menu">
      <img src="img/vaucanson.png" alt="Icone menu"/>
      <ul>
        <% @menu.each do |elt|
             if elt[0] == "sep" then %>
               <li><%= elt[1] %> </li>
          <% else %>
               <li><a href="<%= elt[0] %>"> <%= elt[1] %> </a></li>
          <% end
       end %>
       <li><hr/></li>
       <li><a href="http://www.epita.fr">EPITA</a></li>
       <li><a href="http://www.entreprises.epita.fr">Relations entreprises</a></li>
       <li><a href="http://www.enst.fr">ENST</a></li>

       <li>
          <a href="http://validator.w3.org/check?uri=referer">
          <img src="img/logo-xhtml.png" alt="Valid XHTML 1.0 Strict" />
          </a>
       </li>

       <li>
          <a href="http://www.mozilla-europe.org/fr/products/firefox/">
          <img src="img/logo-firefox.png" alt="Conçu pour Firefox" />
          </a>
       </li>


      </ul>
    </div>

    <div id="body">
      <h2><img src="img/mini_vaucanson.png" alt="Icone sous titre"/> <%= @name %> </h2>
       <% @contents.each do |line| %>
          <%= line %>
       <% end %>
    </div>

  </body>

</html>
}

class Document
  def initialize(filename, name, contents, menu)
    @filename = filename
    @name = name
    @contents = contents
    @menu = menu
  end

  def get_binding
    binding
  end
end

page = ERB.new(template, 0, "%<>")
names.each do |elt|
  key = elt[0]
  name_ = elt[1]
  contents = IO.readlines("html/#{key}")
  os = Document.new(key, name_, contents, names)
  f = File.new(key, "w")
  f <<  page.result(os.get_binding)
  f.close()
end
