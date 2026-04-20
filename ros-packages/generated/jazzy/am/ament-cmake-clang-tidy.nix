{
  ament-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_clang_tidy";
  version = "0.17.5-1";
  src = finalAttrs.passthru.sources."ament_cmake_clang_tidy";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-clang-tidy ament-cmake-test ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_clang_tidy" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6890f62ab0b884e3769b209fd93a5ce652ae4232";
        hash = "sha256-BzyDHYuPhI4OfJddhN+VNFDl6OEOi8kifAXu9+1vtwY=";
      };
    };
  });
  meta = {
    description = "\n    The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.\n  ";
  };
})
