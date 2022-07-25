from datetime import datetime
from time import sleep

def main():
    while True:
        with open("/var/log/time.log", 'a') as file_obj:
            file_obj.write("Current time: " + datetime.now().isoformat() + '\n')
            sleep(1)

if __name__ == "__main__":
    main()
