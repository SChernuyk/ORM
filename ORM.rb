require 'pg'


class GeneralPostgres


  def initialize
  end

  def create_table
    @connect = PG.connect :dbname => 'sergey', :user => 'sergey', :password => '12345'
    @connect.exec("CREATE TABLE vapeshop(id integer PRIMARY KEY NOT NULL,name varchar(50) NOT NULL,tasty varchar(50) NOT NULL,type varchar(50) NOT NULL);")
  end
  def add_value(options)
    @connect = PG.connect :dbname => 'sergey', :user => 'sergey', :password => '12345'
    @connect.exec("INSERT INTO vapeshop (id,name,tasty,type) values ('#{options[:id]}', '#{options[:name]}', '#{options[:tasty]}', '#{options[:type]}')")
    @connect.close
  end

  def delete_value(id)
    @connect = PG.connect :dbname => 'sergey', :user => 'sergey', :password => '12345'
    @connect.exec("DELETE FROM vapeshop WHERE id=#{id}")
    @connect.close
  end

  def update_value(options)
    @connect = PG.connect :dbname => 'sergey', :user => 'sergey', :password => '12345'
    @connect.exec("UPDATE vapeshop SET name = '#{options[:name]}',tasty = '#{options[:tasty]}',type = '#{options[:type]}' WHERE id = #{options[:id]}")
    @connect.close
  end

  def select_value
    @connect = PG.connect :dbname => 'sergey', :user => 'sergey', :password => '12345'

    @connect.exec("SELECT * FROM vapeshop") do |result|
      result.each do |x|
      #id    = x["id"]
      # name  = x["name"]
      # tasty = x["tasty"]
      # type  = x["type"]
      #  puts " #{id} #{name} #{tasty} #{type} "
       p x
      end
    end


    @connect.close

  end

end

application = GeneralPostgres.new
#application.create_table
#application.add_value(:id => "0", :name => "vodka", :tasty => "malina", :type => "krasnaya")
# application.add_value(:id => "1", :name => "pivo", :tasty => "yabloko", :type => "svetloye")
# application.add_value(:id => "2", :name => "liker", :tasty => "vishnya", :type => "kreplenii")
# application.add_value(:id => "3", :name => "samogon", :tasty => "orex", :type => "korichnevii")
application.select_value
#application.delete_value(1)
application.update_value(:id =>0,:name =>"absent",:tasty => "tarxun", :type =>"zelenaya")
application.select_value


