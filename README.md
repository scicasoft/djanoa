Djanoa
======

Client Ruby pour la plateforme [Djanoa](http://www.djanoa.com).

Installation
------------
```bash
gem install djanoa
```

Utilisation
-----------

Il faut d'abord créer un compte sur [le site de djanoa](http://www.djanoa.com).

Ensuite vous faites les configurations
```ruby
require 'djanoa'

Djanoa.configure do |config|
  config.from             = VOTRE_NUMERO_COURT
  config.account_code     = CODE_DE_VOTRE_COMPTE
  config.application_pass = MOT_DE_PASSE
end
```

ensuite pour envoyer un SMS il suffit de faire :

```ruby
Djanoa.send_sms '221777777777', 'juste pour tester mon gem'
```

Gestion des erreurs
-------------------

Si vous voulez allez plus loin vous pouvez récupérer la réponse et voir s'il n'y a pas d'erreur.

Le code suivant permet d'envoyer un SMS et, s'il y'a une erreur, affiche le code de l'erreur, le message d'erreur ainsi que l'adresse IP de l'envoyeur.
```ruby
r = Djanoa.send_sms '221777777777', 'juste pour tester mon gem'

if r.sent?
  puts "le sms est envoyé"
else
  puts r.error.code
  puts r.error.message
  puts r.error.ip
end
```

Utilisation avec Rails
----------------------

Coming soon ... :-)

Copyright
---------
Copyright 2013 Cheikh Sidya CAMARA. Voir la [LICENSE](https://github.com/scicasoft/djanoa/blob/master/LICENSE.md) pour plus de détails.