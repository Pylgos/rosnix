{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_libraries";
  version = "2.5.4-1";
  src = finalAttrs.passthru.sources."ament_cmake_libraries";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_libraries" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_libraries-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "0835bf48611b911562bf510189c5084b15b37df5";
        hash = "sha256-QkP7hqYrfzM9aGCTbUkYBUcjxnPGmjwnALtIQIAnMzo=";
      };
    };
  });
  meta = {
    description = "The functionality to deduplicate libraries in the ament buildsystem in CMake.";
  };
})
