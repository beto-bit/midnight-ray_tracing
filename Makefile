OUT := ray_trace

CXX := g++ -std=c++20 -O3
CXXFLAGS := -std=c++20 -O3

SRC_DIR := ./src
OUT_DIR := ./obj

SRCS := main.cpp renderer.cpp camera.cpp sphere.cpp scene.cpp ray.cpp material.cpp

OBJS := $(SRCS:%.cpp=${OUT_DIR}/%.o)
SRCS := $(foreach wrd,$(SRCS),${SRC_DIR}/$(wrd))


${OUT}: ${OBJS}
	${CXX} ${CXXFLAGS} $^ -o $@

${OBJS}: ${OUT_DIR}/%.o: ${SRC_DIR}/%.cpp
	${CXX} ${CXXFLAGS} $< -c -o $@

.PHONY: clean
clean:
	rm -r ${OUT} ${OUT_DIR}

.PHONY: test
test:
	@echo ${SRCS}
	@echo ${OBJS}

