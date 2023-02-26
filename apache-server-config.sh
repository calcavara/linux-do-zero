#!/bin/bash

#Script para configuração de servidor web Apache2

echo 'Iniciando configuração...'

#Atualiza repositórios e aplicações da máquina
echo 'Atualizando repositórios...'
apt update -y
echo 'Instalando atualizações disponíveis para aplicações...'
apt upgrade -y

#Instala o servidor apache2
echo 'Instalando o servidor Apache2...'
apt install apache2 -y
echo 'Habilitando o serviço Apache2 para iniciar junto com o servidor...'
systemctl enable apache2
echo 'Garantindo que o serviço do apache2 está rodando...'
systemctl start apache2

#Instala o unzip
echo 'Instalando descompactador de arquivos unzip...'
apt install unzip -y

#Baixa a aplicação em repositório do GitHub
echo 'Baixando aplicação do Github...'
wget -P /tmp https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip --show-progress

#Descompacta a aplicação
echo 'Descompactando a aplicação...'
unzip /tmp/main.zip

#Apaga arquivos na raíz do Apache
echo 'Limpando diretório raíz do Apache'
rm -rf /var/www/html/*

#Copia a aplicação para a pasta raíz do Apache
echo 'Copiando a aplicação para a pasta raíz do Apache'
cp -r -v /tmp/linux-site-dio-main/* /var/www/html/

echo 'Instalação da aplicação concluída!!'
