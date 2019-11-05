<h1>Eventbrite THP</h1>

Le lien du site est :
https://eventbrite-thpp.herokuapp.com/



Cette application rails contient 3 tables:
<ul>
    <li>users</li>
    <li>events</li>
  <li>attendances</li>
    </ul>

Lancer dans le terminal: <code>bundle install</code>, créér les tables avec <code> rails db:create </code> (si erreur faire <code> rails db:migrate:reset </code> Puis pour faire un test avec des fake datas: <code>rails db:seed<code>
<p> Un utilisateur peut s'inscrire et se log_in directement apres </p>

<p> Un bouton de déconnexion est visible une fois log_in a la place du bouton de connexion et d'inscription </p>

<p> La page user affiche les events qu'il a créé </p>

<p> L'appli demande de s'inscrire pour utiliser la fonction d'ajout d'event </p>

<p> L'envoi d'email est fonctionnelle <p>