FROM golang:1.14-alpine AS build

WORKDIR /src/
COPY /golang/src/ /src/
RUN CGO_ENABLED=0 go build -o /golang/dist

FROM scratch
COPY --from=build /golang/dist /golang/dist
ENTRYPOINT ["/golang/dist"]