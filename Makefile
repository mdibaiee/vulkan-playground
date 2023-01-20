_BREW_PREFIX=$(shell brew --prefix)
VULKAN_SDK ?= ${HOME}/VulkanSDK/1.3.236.0
VK_ICD_FILENAMES=${VULKAN_SDK}/macOS/share/vulkan/icd.d/MoltenVK_icd.json
VK_LAYER_PATH=${VULKAN_SDK}/macOS/share/vulkan/explicit_layer.d

.PHONY: main
main: main.cpp
	# compile
	clang++ -I${_BREW_PREFIX}/include -I${VULKAN_SDK}/macOS/include --std=c++17 -c main.cpp -o main.o
	# link
	clang++ -L${_BREW_PREFIX}/lib -lglfw.3.3 -L${VULKAN_SDK}/macOS/lib -lvulkan.1.3.236 -l vulkan.1  main.o -o main

.PHONY: run
run: main
	chmod +x ./main
	./main

