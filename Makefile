#!make

PWD=$(shell pwd)
TS = $(shell date '+%Y_%m_%d_%H_%M')
#TOKEN=....

up:
	docker-compose up -d
	firefox https://ghost.bioatlas.se

down:
	docker-compose down

content.zip:
	cd content && zip -r ../content.zip .

theme-dl:
	mkdir -p dl
	Rscript dl_themes.R

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