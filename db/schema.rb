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

ActiveRecord::Schema.define(:version => 20130118192618) do

  create_table "clients", :force => true do |t|
    t.string   "nombre"
    t.string   "RFC"
    t.string   "estado"
    t.string   "municipio"
    t.string   "direccion"
    t.integer  "CP"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "facturas", :primary_key => "factura_id", :force => true do |t|
    t.integer  "folio"
    t.date     "fecha"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "facturas_producto_id"
    t.string   "m_pago"
    t.decimal  "total",                :precision => 10, :scale => 0
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  create_table "facturas_productos", :force => true do |t|
    t.integer  "factura_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :primary_key => "product_id", :force => true do |t|
    t.integer  "sku"
    t.string   "descripcion"
    t.decimal  "p_unit",      :precision => 10, :scale => 0
    t.string   "u_medida"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string  "rfc"
    t.string  "empresa"
    t.string  "reg_fiscal"
    t.string  "direccion"
    t.string  "estado"
    t.string  "ciudad"
    t.integer "cp"
    t.string  "tel"
    t.string  "logo_url"
    t.string  "bdd"
  end

end
