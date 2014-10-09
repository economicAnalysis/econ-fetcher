import os 

def dump_env():
  """Dumps environmental varaibles to file

     Returns:
       void
  """

  f = open('envdump.txt', 'w')
  port = os.environ.get('MONGODB_PORT')
  port_27017 = os.environ.get('MONGODB_PORT_27017_TCP')
  address = os.environ.get('MONGODB_PORT_27017_TCP_ADDR')
  tcp_port = os.environ.get('MONGODB_PORT_27017_TCP_PORT')
  f.write(" MONGODB_PORT: {0}\n MONGODB_PORT_27017_TCP {1}\n MONGODB_PORT_27017_TCP_ADDR {2}\n MONGODB_PORT_27017_TCP_PORT".format(port, port_27017, address, tcp_port))
  f.close()


if __name__ == "__main__":
  dump_env()