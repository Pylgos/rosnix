{
  ament-cmake-core,
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
  pname = "ament_cmake_catch2";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."ament_cmake_catch2";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_catch2" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_catch2-source";
        url = "https://github.com/ros2-gbp/ament_cmake_catch2-release.git";
        rev = "99c9bf4fa0edf16c1ea0099598cf03eeb6793d6b";
        hash = "sha256-PFP5trdCmO4MmGg8CFeK0nTgMWRn+XQN2Z92TWyddYk=";
      };
    };
  });
  meta = {
    description = "Allows integrating catch2 tests in the ament buildsystem with CMake";
  };
})
