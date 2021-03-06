# README

- criação da aplicação
        ```
        rails new MuralTopaTudo -d postgresql
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
     - Cadastrar um aviso com um usuario logado - notices_controlle
         ```
         def create
             @notice = Notice.new(notice_params)
             @notice.user = current_user #<-- aqui
         ```
     - Restringir páginas e colocar excessões
         ```
         before_action :authenticate_user!, except: :homepage 
         ```
 - Instalação do bootstrap
     - Adicionar na GemFile
         ```
         # bootstrap
         gem 'jquery-rails'
         gem 'bootstrap-sass', '~> 3.2.0'
         gem 'autoprefixer-rails'
         gem 'mini_racer'
         ```
     - Executar um bundle install
         ```
         bundle install
         ```
     - Alterar a extensão do arquivo do assets/stylesheets/application.css
         ```
         application.css.sass
         ```
         Em seguida inserir:
         ```
         @import "bootstrap-sprockets"
         @import "bootstrap"
         ```
         Depois reiniciar a aplicação
         
 - Instalação do Cancancan
    - Adicionar na GemFile
        ```
        gem 'cancancan', '~> 2.0'
        ```
    - Executar um bundle install
         ```
         bundle install
         ```
    - Criação do model Ability para fazer as restrições personalizadas
         ```
         rails g cancan:ability
         ```
    - Regra de testricao de acesso:
        ```
        class Ability
          include CanCan::Ability
        
          def initialize(user)
            user ||= User.new
            can :manage, Notice, user_id: user.id
        ```
    - No index dos notice inserir a regra que somente dono do aviso pode ver, editar e apagar em sua area adm 
        ```
        <% @notices.each do |notice| %>
              <tr>
                <% if can? :manage, notice %>
                <td><%= notice.description %></td>
                <td><%= link_to 'Edit', edit_notice_path(notice) %></td>
                <td><%= link_to 'Destroy', notice, method: :delete, data: { confirm: 'Are you sure?' } %></td>
                <% end %>
              </tr>
        <% end %>
        ```
    