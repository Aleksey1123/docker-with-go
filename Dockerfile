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
COPY . .

CMD ["air", "-c", ".air.toml"]
