main.py contains application which prints timestamp and IP addr of user.

Run application locally using below command
> python main.py

Docker file is also integrated

run docker build using 
> docker build -t simple-time-service .
run app in container using
> docker run -p 8080:8080 simple-time-service