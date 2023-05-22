default: test

vendor:
	go mod vendor

install:
	go install ./...

lint:
	golint github.com/rk295/go-pingdom/pingdom
	golint github.com/rk295/go-pingdom/pingdomext
	golint github.com/rk295/go-pingdom/solarwinds
test:
	go test -cover github.com/rk295/go-pingdom/pingdom
	go test -cover github.com/rk295/go-pingdom/pingdomext
	go test -cover github.com/rk295/go-pingdom/solarwinds
acceptance:
	PINGDOM_ACCEPTANCE=1 PINGDOM_EXT_ACCEPTANCE=1 SOLARWINDS_ACCEPTANCE=1 go test github.com/rk295/go-pingdom/acceptance

cov:
	go test github.com/rk295/go-pingdom/pingdom -coverprofile=coverage.out
	go test github.com/rk295/go-pingdom/pingdomext -coverprofile=coverage.out
	go test github.com/rk295/go-pingdom/solarwinds -coverprofile=coverage.out
	go tool cover -func=coverage.out
	rm coverage.out

.PHONY: default vendor vendor_update install test acceptance cov
