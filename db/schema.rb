# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130205182706) do

  create_table "clients", :primary_key => "client_id", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "nombre",     :null => false
    t.string   "RFC",        :null => false
    t.string   "estado",     :null => false
    t.string   "municipio",  :null => false
    t.string   "direccion",  :null => false
    t.integer  "CP",         :null => false
    t.datetime "created_at", :null => false
  end

  add_index "clients", ["user_id"], :name => "user_id_idx"

  create_table "facturas", :primary_key => "factura_id", :force => true do |t|
    t.integer "client_id",                                :null => false
    t.integer "folio",                                    :null => false
    t.date    "fecha",                                    :null => false
    t.string  "m_pago",                                   :null => false
    t.decimal "total",     :precision => 10, :scale => 0, :null => false
  end

  add_index "facturas", ["client_id"], :name => "fk_facturas_client_idx"
  add_index "facturas", ["folio"], :name => "folio_UNIQUE", :unique => true

  create_table "facturas_productos", :force => true do |t|
    t.integer "factura_id"
    t.integer "product_id"
  end

  create_table "products", :primary_key => "product_id", :force => true do |t|
    t.integer  "fk_user_id",                                               :null => false
    t.string   "sku",         :limit => 10,                                :null => false
    t.string   "descripcion",                                              :null => false
    t.decimal  "p_unit",                    :precision => 10, :scale => 0, :null => false
    t.string   "u_medida",                                                 :null => false
    t.datetime "created_at"
  end

  add_index "products", ["fk_user_id"], :name => "client_id_idx"

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string  "empresa",         :limit => 60, :null => false
    t.string  "rfc",             :limit => 15, :null => false
    t.string  "reg_fiscal",      :limit => 40, :null => false
    t.string  "direccion",       :limit => 65, :null => false
    t.string  "estado",          :limit => 20, :null => false
    t.string  "ciudad",          :limit => 20, :null => false
    t.integer "cp",                            :null => false
    t.string  "tel",             :limit => 21, :null => false
    t.string  "logo"
    t.string  "bdd"
    t.string  "password_digest"
    t.string  "remember_token"
  end

  add_index "users", ["empresa"], :name => "empresa_UNIQUE", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["rfc"], :name => "rfc_UNIQUE", :unique => true

end
