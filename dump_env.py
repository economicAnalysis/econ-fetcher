import os 

def dump_env():
  """Dumps environmental varaibles to file

     Returns:
       void
  """

  f = open('envdump.txt', 'w')
  port = os.environ.get('MONGODB_PORT')
  port_27017 = os.environ.get('MONGODB_PORT_27017_TCP')

  f.write("port: {0} port_27017 {1}".format(port, port_27017))
  f.close()


if __name__ == "__main__":
  dump_env()