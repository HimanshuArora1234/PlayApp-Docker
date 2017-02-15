# PlayApp-Docker
A docker image to run your play application without the hassle of actually installing Jdk8 or Play Framework. 

## How to run

First download the dockerfile and place it in a folder. Then run the docker build command to that folder to build your images as follows: <br />
 `docker build -t NameTagOfDockerImage .`
 
 And that's how you can run the image:

 `docker run -i -p 9000:9000 -v PathToYourPlayApp:/app:rw NameTagOfDockerImage`
 
  - If annoyed by the recurrent sbt dependencies download each time you run this image, in that case you can use .sbt & .ivy2 of your local machine as follows (you can also tune the no of cpu cores you want for container, network bridging as well):
  
  `docker run -it -v PathToYourPlayApp:/app:rw -v ~/.ivy2:/root/.ivy2 -v ~/.sbt:/root/.sbt -p 9000:9000 --cpuset-cpus 1 --network="bridge" NameTagOfDockerImage` 
