#Criando uma Imagem Base para o Mapas Culturais

A dependencia do php-apc foi trocada por php-apcu
agora tem que habilitá-lo no /etc/php/5.6/apache2/php.ini
adicionando estas linhas no final do arquivo:

````ini
extension=apcu.so
apc.enabled=1
````
ref: https://stackoverflow.com/questions/26818656/php5-6-and-apc-installation

