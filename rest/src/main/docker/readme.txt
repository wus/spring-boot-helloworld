Create & Run Container:
docker run -d -it -e environment=development --name tnd-export-scheduler --add-host="graylog01:10.30.169.134“ --add-host="db01:10.30.169.134“ -p 8080:8080 de.bertelsmann.dcard.tnd/tnd-export-scheduler:0.0.1-SNAPSHOT

Run Command in a running Container
docker exec -it tnd-export-scheduler bash

Stop Container:
docker stop tnd-export-scheduler

Start Container:
docker start tnd-export-scheduler

Remove Container:
docker rm tnd-export-scheduler

Remove Image:
docker rmi de.bertelsmann.dcard.tnd/tnd-export-scheduler:0.0.1-SNAPSHOT