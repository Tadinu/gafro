# Ubuntu 20.04: clang-10
# Ubuntu 22.04: clang-11/12/13
#sudo apt update
#sudo apt install libc++-dev
#sudo apt install libc++abi-dev
mkdir -p build
pushd build
cmake .. -DCMAKE_C_COMPILER:STRING=clang-18 -DCMAKE_CXX_COMPILER:STRING=clang++-18 \
		 -DCMAKE_INSTALL_PREFIX=../release \
		 -DCMAKE_CXX_FLAGS:STRING="-stdlib=libstdc++" \
		 -DCMAKE_EXE_LINKER_FLAGS:STRING="-Wl,--no-as-needed -stdlib=libstdc++" \
		 -DBUILD_SHARED_LIBS:BOOL=ON \
		 -DBUILD_TEST:BOOL=OFF
cmake --build . -j8
cmake --install .
popd

