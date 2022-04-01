GO_VER		:= 1.17
TAG		:= dvusboy/tiny-scratch
MARKER		:= .image.done
LOG		:= build.log

.PHONY : default
default : $(MARKER)

$(MARKER) : Dockerfile main.go go.mod
	[ -s "$@" ] && docker image rm `cat $@`; rm -f $@
	docker build --pull --rm --build-arg GO_VER=$(GO_VER) --iidfile $@ --tag $(TAG) 2>&1 . | tee $(LOG)
	[ -s "$@" ] || rm -f "$@"

.PHONY : clean
clean :
	rm -f $(LOG)

.PHONY : clean-img
clean-img :
	[ -s "$(MARKER)" ] && docker image rm `cat $(MARKER)`
	rm -f "$(MARKER)"

.PHONY : clean-all
clean-all : clean-img clean

.PHONY : push
push : $(MARKER)
	docker push $(TAG)
