
class Signup

  def signup(user, pass)

    connection = PG.connect(dbname: 'login')
    connection.exec("INSERT INTO login_details (username, password) VALUES ('#{user}', '#{pass}');")

    #connection.exec("INSERT INTO messages (name, message, time) VALUES ('#{name}', '#{message}', '#{time}');")


    connection.exec('SELECT * FROM login_details;')
  end

  
end