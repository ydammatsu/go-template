RUN_COMMAND = docker run -it --mount type=bind,src=$(PWD),dst=/app $(PROJECT_NAME)
PACKAGE =

# Set current directory name as project name.
set-name:
	basename $(PWD) > project_name.txt && export PROJECT_NAME=`cat project_name.txt` && rm project_name.txt

# Build docker image.
build: set-name
	docker build -t $(PROJECT_NAME) .

# Run Go app in container.
run: build
	$(RUN_COMMAND) go run main.go

# Run bash in container.
bash: build
	$(RUN_COMMAND) ash

# Run go mod init in container.
init: build
	rm -f go.mod && $(RUN_COMMAND) go mod init github.com/ydammatsu/$(PROJECT_NAME)

# Run go get -u in container.
get: build
	$(RUN_COMMAND) go get -u $(PACKAGE)

# Run go mod tidy in container.
tidy: build
	$(RUN_COMMAND) go mod tidy
