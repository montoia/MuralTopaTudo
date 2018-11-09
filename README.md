# README

- criação da aplicação
    ```
    Rails new MuralTopaTudo -d postgresql
    ```
- Config Banco
Inserção dos dados do postgres no arquivo database

    - Criação do Banco
        ```
        rake db:create
        ```
    - Status das migrate
        ```
        rake db:migrate:status
        ```
    - Geração das tabelas do banco
        ```
        rails generate scafflod notices description:string
        ```
- Instalação do devise
    - Adicionar na GemFile
    ```
    gem 'devise'
    ```
    - Executar um bundle install
    ```
    bundle install
    ```
    - Instalação do devise
    ```
    rails generate devise:install
    ```
    - Instação do devide no user
    ```
    rails g devise user
    ```
    - Relação do banco user com notices
     ```
    rails generate migration AddUserToNotices
     ```
     - Ajustar na migrate
     ```
     class AddUserToNotices < ActiveRecord::Migration[5.2]
         def change
           add_column :notices, :user_id, :integer
         end
     end
     ```
     - Subir as migrates
     ```
     rake db:migrate
     ```

    