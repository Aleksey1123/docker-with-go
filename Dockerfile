FROM golang:1.22.4

# ENV PROJECT_DIR=/app \
#     GO111MODULE=on \
#     CGO_ENABLED=0ENV

# we define base derictory in the container,
# this will make things much easier, because from now on 
# we don't need to write full paths anymore 
# WORKDIR /app
# RUN mkdir "/build"
# COPY . .
# RUN go get github.com/githubnemo/CompileDaemon
# RUN go install github.com/githubnemo/CompileDaemon
# ENTRYPOINT CompileDaemon -build="go build -o /build/app" -command="/build/app"

FROM golang:1.22.4

# we define base derictory in the container,
# this will make things much easier, because from now on 
# we don't need to write full paths anymore 
WORKDIR /app

RUN go install github.com/air-verse/air@latest

# copy command takes two arguments:
# - what files you want to copy into the image
# - where you want the files to be copied to
# ./ - means current directory(in our case - /app)
# COPY go.mod go.sum ./
COPY go.* ./

# install all deps into the image
RUN go mod download

# # copy all source code files from current directory
# COPY *.go ./

# # compile our app and name it app-binary (the result will be a binary file)
# RUN CGO_ENABLED=0 GOOS=linux go build -o app-bin

# we simply tell docker what command to run when the image is used to start a container
# CMD ["/app-bin"]
COPY . .

CMD ["air", "-c", ".air.toml"]