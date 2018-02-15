require 'pg'

class GeneralPostgres

  def connect
    connect = PG.connect :dbname => 'sergey', :user => 'sergey', :password => '12345'
  end

  def add_value(options)
    values = Array.new
    colums = Array.new
    options.each{|key, value| colums.push(key.to_s); values.push("'#{value.to_s}'")}
    values = values*", "
    colums = colums*", "
    p  colums, values
    connect.exec("INSERT INTO #{name_table}(#{colums}) values (#{values})")
    connect.close
  end

  def delete_value(id)
    connect.exec("DELETE FROM #{name_table} WHERE id=#{id}")
    connect.close
  end

  def update_value(options,id)
    updates = Array.new
    options.each {|key, new_values| updates.push("#{key} = '#{new_values}'")}
    updates = updates*", "
    connect.exec("UPDATE #{name_table} SET #{updates}  WHERE id = #{id}")
    connect.close
  end

  def select_value
    connect.exec("SELECT * FROM #{name_table}") do |result|
      result.each {|x|
       p x
      }
    end
    connect.close
    end

  end

  def name_table
    name_table = self.class.to_s + "s"
  end

class Good < GeneralPostgres

end

  a = { "item" => "xbox", "price" => "18000", "weight" => "6"}
  id=3
  b = {"item" => "xboxone", "price" => "20000", "weight" => "7"}
  application = Good.new
  #application.add_value(a)
  # application.select_value
  #application.delete_value(2)
   application.update_value(b, id)
  # application.select_value


