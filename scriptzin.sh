#!/bin/bash

# Função para exibir o menu principal
show_menu() {
    dialog --backtitle "Menu Principal" \
           --title "Menu" \
           --menu "Escolha uma opção:" \
           15 50 6 \
           1 "Criar usuário" \
           2 "Criar diretório" \
           3 "Remover usuário" \
           4 "Remover diretório" \
           5 "Criar arquivo de texto" \
           6 "Mudar permissões de arquivo" \
           2>&1 >/dev/tty \
           clear
}

# Função para criar um novo usuário
create_user() {
    dialog --backtitle "Criar Usuário" \
           --title "Criar Usuário" \
           --inputbox "Digite o nome do novo usuário:" 8 40 2>/tmp/username.tmp

    username=$(cat /tmp/username.tmp)
    rm /tmp/username.tmp

    if [ -z "$username" ]; then
        dialog --backtitle "Erro" \
               --title "Erro" \
               --msgbox "O nome do usuário não pode estar vazio." 8 40
        return
    fi

    dialog --backtitle "Criar Usuário" \
           --title "Criar Usuário" \
           --yesno "Deseja adicionar o usuário $username?" 8 40

    if [ $? -eq 0 ]; then
        useradd -m "$username"
        dialog --backtitle "Usuário Criado" \
               --title "Usuário Criado" \
               --msgbox "O usuário $username foi criado com sucesso." 8 40
    else
        dialog --backtitle "Operação Cancelada" \
               --title "Operação Cancelada" \
               --msgbox "A criação do usuário foi cancelada." 8 40
    fi
}

# Função para criar um novo diretório
create_directory() {
    dialog --backtitle "Criar Diretório" \
           --title "Criar Diretório" \
           --inputbox "Digite o nome do diretório:" 8 40 2>/tmp/directory.tmp

    directory=$(cat /tmp/directory.tmp)
    rm /tmp/directory.tmp

    if [ -z "$directory" ]; then
        dialog --backtitle "Erro" \
               --title "Erro" \
               --msgbox "O nome do diretório não pode estar vazio." 8 40
        return
    fi

    dialog --backtitle "Criar Diretório" \
           --title "Criar Diretório" \
           --yesno "Deseja criar o diretório $directory?" 8 40

    if [ $? -eq 0 ]; then
        mkdir "$directory"
        dialog --backtitle "Diretório Criado" \
               --title "Diretório Criado" \
               --msgbox "O diretório $directory foi criado com sucesso." 8 40
    else
        dialog --backtitle "Operação Cancelada" \
               --title "Operação Cancelada" \
               --msgbox "A criação do diretório foi cancelada." 8 40
    fi
}

# Função para remover um usuário
remove_user() {
    dialog --backtitle "Remover Usuário" \
           --title "Remover Usuário" \
           --inputbox "Digite o nome do usuário a ser removido:" 8 40 2>/tmp/username.tmp

    username=$(cat /tmp/username.tmp)
    rm /tmp/username.tmp

    if [ -z "$username" ]; then
        dialog --backtitle "Erro" \
               --title "Erro" \
               --msgbox "O nome do usuário não pode estar vazio." 8 40
        return
    fi

    dialog --backtitle "Remover Usuário" \
           --title "Remover Usuário" \
           --yesno "Deseja remover o usuário $username?" 8 40

    if [ $? -eq 0 ]; then
        userdel -r "$username"
        dialog --backtitle "Usuário Removido" \
               --title "Usuário Removido" \
               --msgbox "O usuário $username foi removido com sucesso." 8 40
    else
        dialog --backtitle "Operação Cancelada" \
               --title "Operação Cancelada" \
               --msgbox "A remoção do usuário foi cancelada." 8 40
    fi
}

# Função para remover um diretório
remove_directory() {
    dialog --backtitle "Remover Diretório" \
           --title "Remover Diretório" \
           --inputbox "Digite o nome do diretório a ser removido:" 8 40 2>/tmp/directory.tmp

    directory=$(cat /tmp/directory.tmp)
    rm /tmp/directory.tmp

    if [ -z "$directory" ]; then
        dialog --backtitle "Erro" \
               --title "Erro" \
               --msgbox "O nome do diretório não pode estar vazio." 8 40
        return
    fi

    dialog --backtitle "Remover Diretório" \
           --title "Remover Diretório" \
           --yesno "Deseja remover o diretório $directory?" 8 40

    if [ $? -eq 0 ]; then
        rm -r "$directory"
        dialog --backtitle "Diretório Removido" \
               --title "Diretório Removido" \
               --msgbox "O diretório $directory foi removido com sucesso." 8 40
    else
        dialog --backtitle "Operação Cancelada" \
               --title "Operação Cancelada" \
               --msgbox "A remoção do diretório foi cancelada." 8 40
    fi
}

# Função para criar um novo arquivo de texto
create_text_file() {
    dialog --backtitle "Criar Arquivo de Texto" \
           --title "Criar Arquivo de Texto" \
           --inputbox "Digite o nome do arquivo de texto:" 8 40 2>/tmp/filename.tmp

    filename=$(cat /tmp/filename.tmp)
    rm /tmp/filename.tmp

    if [ -z "$filename" ]; then
        dialog --backtitle "Erro" \
               --title "Erro" \
               --msgbox "O nome do arquivo não pode estar vazio." 8 40
        return
    fi

    dialog --backtitle "Criar Arquivo de Texto" \
           --title "Criar Arquivo de Texto" \
           --yesno "Deseja criar o arquivo de texto $filename?" 8 40

    if [ $? -eq 0 ]; then
        touch "$filename"
        dialog --backtitle "Arquivo Criado" \
               --title "Arquivo Criado" \
               --msgbox "O arquivo de texto $filename foi criado com sucesso." 8 40
    else
        dialog --backtitle "Operação Cancelada" \
               --title "Operação Cancelada" \
               --msgbox "A criação do arquivo de texto foi cancelada." 8 40
    fi
}

# Função para mudar as permissões de um arquivo
change_file_permissions() {
    dialog --backtitle "Mudar Permissões de Arquivo" \
           --title "Mudar Permissões de Arquivo" \
           --inputbox "Digite o nome do arquivo:" 8 40 2>/tmp/file.tmp

    file=$(cat /tmp/file.tmp)
    rm /tmp/file.tmp

    if [ -z "$file" ]; then
        dialog --backtitle "Erro" \
               --title "Erro" \
               --msgbox "O nome do arquivo não pode estar vazio." 8 40
        return
    fi

    dialog --backtitle "Mudar Permissões de Arquivo" \
           --title "Mudar Permissões de Arquivo" \
           --inputbox "Digite as permissões no formato octal (ex: 644):" 8 40 2>/tmp/permissions.tmp

    permissions=$(cat /tmp/permissions.tmp)
    rm /tmp/permissions.tmp

    if [ -z "$permissions" ]; then
        dialog --backtitle "Erro" \
               --title "Erro" \
               --msgbox "As permissões não podem estar vazias." 8 40
        return
    fi

    dialog --backtitle "Mudar Permissões de Arquivo" \
           --title "Mudar Permissões de Arquivo" \
           --yesno "Deseja mudar as permissões do arquivo $file para $permissions?" 8 40

    if [ $? -eq 0 ]; then
        chmod "$permissions" "$file"
        dialog --backtitle "Permissões Alteradas" \
               --title "Permissões Alteradas" \
               --msgbox "As permissões do arquivo $file foram alteradas para $permissions." 8 40
    else
        dialog --backtitle "Operação Cancelada" \
               --title "Operação Cancelada" \
               --msgbox "A mudança de permissões do arquivo foi cancelada." 8 40
    fi
}

# Loop para exibir o menu repetidamente
while true; do
    choice=$(show_menu)

    case $choice in
        1)
            create_user
            ;;
        2)
            create_directory
            ;;
        3)
            remove_user
            ;;
        4)
            remove_directory
            ;;
        5)
            create_text_file
            ;;
        6)
            change_file_permissions
            ;;
        *)
            echo "Opção inválida. Tente novamente."
            ;;
    esac
done