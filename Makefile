BE_NAME=backend-service
FE_NAME=frontend-portal
NW_NAME=microservice-nw

create-network:
	docker network create \
	--driver=overlay \
	--attachable \
	${NW_NAME}	

rm-network:
	docker network rm ${NW_NAME}

build-backend:
	docker build \
	-t ${BE_NAME} \
	./backend_service

build-frontend:
	docker build \
	-t ${FE_NAME} \
	./frontend_portal

create-backend:
	docker service create \
	--name ${BE_NAME} \
	--network ${NW_NAME} \
	--publish 8081:8080 \
	${BE_NAME}

rm-backend:
	docker service rm ${BE_NAME}

create-frontend:
	docker service create \
	--name ${FE_NAME} \
	--network ${NW_NAME} \
	--publish 8088:8080 \
	${FE_NAME}

rm-frontend:
	docker service rm ${FE_NAME}

build:	build-backend build-frontend
up: create-backend create-frontend
rm: rm-backend rm-frontend
