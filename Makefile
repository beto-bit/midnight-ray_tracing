MAKEFLAGS := --jobs=2

OUT := ray_trace

CXX := g++
CXXFLAGS := -std=c++20 -O3 -MP -MD \
			-isystemglm \
			-Wall -Wextra -Wpedantic

SRC_DIR := ./src
OUT_DIR := ./obj

SRCS := main.cpp renderer.cpp camera.cpp sphere.cpp scene.cpp ray.cpp material.cpp

OBJS := $(SRCS:%.cpp=${OUT_DIR}/%.o)
SRCS := $(foreach wrd,$(SRCS),${SRC_DIR}/$(wrd))
DEPS := $(OBJS:.o=.d)


${OUT}: ${OBJS}
	${CXX} ${CXXFLAGS} $^ -o $@

${OBJS}: ${OUT_DIR}/%.o: ${SRC_DIR}/%.cpp
	@ mkdir -p ${OUT_DIR}
	${CXX} ${CXXFLAGS} $< -c -o $@

-include ${DEPS}

compile_flags.txt: Makefile
	@ echo ${CXXFLAGS} | tr ' ' '\n' > $@

.PHONY: clean
clean:
	rm -rf ${OUT} ${OUT_DIR}

.PHONY: test
test:
	@echo ${SRCS}
	@echo ${OBJS}

