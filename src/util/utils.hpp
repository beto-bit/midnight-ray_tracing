#pragma once

#include <cstdlib>
#include <glm/glm.hpp>

float randomFloat();

float randomFloat(const float min, const float max);

float clamp(const float x, const float min, const float max);

glm::vec3 randomVec3();

glm::vec3 randomVec3(const float min, const float max);

glm::vec3 rejection();

glm::vec3 randomUnitVector();

glm::vec3 randomUnitDisk();
