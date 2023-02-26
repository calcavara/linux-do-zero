#!/bin/bash
#Criação de diretórios
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

#Criação de grupos de usuários
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

#Troca de propriedade dos diretórios criados
chown root /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

#Altera permissões de acesso às pastas
chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

#Cria usuários do sistema
useradd carlos -c "Carlos" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_ADM -N
useradd maria -c "Maria" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_ADM -N
useradd joao -c "João" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_ADM -N
useradd debora -c "Débora" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_VEN -N
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_VEN -N
useradd roberto -c "Roberto" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_VEN -N
useradd josefina -c "Josefina" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_SEC -N
useradd amanda -c "Amanda" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_SEC -N
useradd rogerio -c "Rogério" -m -s /bin/bash -p $(openssl passwd "senha123") -G GRP_SEC -N

echo "Sistema configurado com sucesso!!"
