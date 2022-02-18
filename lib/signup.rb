# A new class called 'Signup'
class Signup

  # attr_reader is used to allow 'logged_in_as' to be read outside the class.
  attr_reader :logged_in_as


  # two arguments (user and pass) are passed to the signup method.
  def signup(user, pass)

    # connect to the database called 'login'. Execute an SQL command to insert into a table called 'login_details'
    # in the columns 'username' and 'password' the values of 'user' and 'pass' arguments.
    connection = PG.connect(dbname: 'login')
    connection.exec("INSERT INTO login_details (username, password) VALUES ('#{user}', '#{pass}');")
  end

  # two arguments (user and pass) are passed to the login method.
  def login(user, pass)
    connection = PG.connect(dbname: 'login')

    # execute the SQL command to select data in columns 'username' and 'password' from table login_details where username and password 
    # match the arguments given to the login method. Result is an array of any username and password matches in the database
    # the AND syntax in the SQL query is a matcher - both username and password have to be satisfied.
    result = connection.exec("SELECT username, password FROM login_details WHERE username = '#{user}' AND password = '#{pass}';")

    # begin and rescue blocks will 'rescue' the code if an error would have occurred otherwise.
    # read the first element [0] of the result array and if it exists, assign the 'user' argument (originally given to the 
    # login method above) and also puts 'valid login' (though 'valid login' here is only for testing purposes)
    # if the first element of the result array does not exists (ie. there was no match of username and password in the 
    # database), go through the rescue block and assign @logged_in_as to 'false'
    begin result[0]
      @logged_in_as = user
      puts 'valid login'
    rescue
      @logged_in_as = false
      puts ('invalid login')
    end

  end


end