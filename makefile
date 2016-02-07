build:
	docker build -t prjctgeek/unifi .

run:
	docker run -d --net="host" prjctgeek/unifi
