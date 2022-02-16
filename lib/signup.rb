class Signup

  attr_reader :logged_in_as



  def signup(user, pass)

    connection = PG.connect(dbname: 'login')
    connection.exec("INSERT INTO login_details (username, password) VALUES ('#{user}', '#{pass}');")

    #connection.exec("INSERT INTO messages (name, message, time) VALUES ('#{name}', '#{message}', '#{time}');")


    connection.exec('SELECT * FROM login_details;')
  end

  def login(user, pass)
    connection = PG.connect(dbname: 'login')

    result = connection.exec("SELECT username, password FROM login_details WHERE username = '#{user}' AND password = '#{pass}';")


    begin result[0]
      @logged_in_as = user
      puts 'valid login'
    rescue
      @logged_in_as = false
      puts ('invalid login')
    end

  end


end