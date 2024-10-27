#!/bin/bash

#Váriavel em que guarda o caminho para o diretório em que o log será salvo
LOG_DIRETORIO="/var/log/nginx"

#Váriavel para os arquivos de log ONLINE e OFFLINE
LOG_FILE_ONLINE="$LOG_DIRETORIO/servico_online.log"
LOG_FILE_OFFLINE="$LOG_DIRETORIO/servico_offline.log"

#Variável para obter a data e hora atual
DATA_HORA=$(date '+%d-%m-%Y %H:%M:%S')

#Variável para obter o nome do serviço:
SERVICO="nginx"

#Váriavel em que o status atual do nginx é armazenado
STATUS=$(systemctl is-active nginx)

#Condicional para avaliar o valor da váriavel STATUS
if [ "$STATUS" == "active" ]; then
        ESTADO="ONLINE"
        MENSAGEM="O servico $SERVICO está ONLINE."
        LOG="$DATA_HORA | Serviço: $SERVICO | STATUS: $ESTADO | Mensagem: $MENSAGEM"
        # Escreve log no arquivo 'servico_online.log'
        echo "$LOG" >> "$LOG_FILE_ONLINE"
        echo -e "\033[0;32m Online \033[0m"
else
        ESTADO="OFFLINE"
        MENSAGEM="O serviço $SERVICO está OFFLINE."
        LOG="$DATA_HORA | Serviço: $SERVICO | STATUS: $ESTADO | Mensagem: $MENSAGEM"
        # Escreve log no arquivo 'servico_offline.log'
        echo "$LOG" >> "$LOG_FILE_OFFLINE"
        echo -e "\033[0;31m Offline \033[0m"
fi
