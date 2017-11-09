#!make

PWD=$(shell pwd)
TS = $(shell date '+%Y_%m_%d_%H_%M')
UID = $(shell id -u):$(shell id -g)
#TOKEN=....

up:
	docker-compose up -d
	./wait-for-http-OK.sh http://ghost.bioatlas.se
	xdg-open http://ghost.bioatlas.se

down:
	docker-compose down

content.zip:
	cd content && zip -r ../content.zip .

theme-dl:
	mkdir -p dl
	#Rscript dl_themes.R
	docker run -it --rm \
		-u $(UID) \
		-v $(PWD)/dl_themes.R:/home/rstudio/dl_themes.R \
		-v $(PWD)/dl:/home/rstudio/dl \
		raquamaps/mirroreum Rscript dl_themes.R

content-cp:
	scp bioatlas:/home/gbif/repos/ala-docker/ghost/content.zip .

content:
	cd ghost && unzip ../content.zip -d content

backup:
	#curl http://ghost.dina-web.net/ghost/api/v0.1/db/?access_token=$(TOKEN) > backup_$(TS).json
	docker-compose run ghost-backup backup

restore:
	docker-compose run ghost-backup restore -i

clean:
	rm content.zip
