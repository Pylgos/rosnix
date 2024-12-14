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
  pname = "ament_cmake_python";
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_python";
  propagatedNativeBuildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_python" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_python-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "1b3553e6259ecbe18c068521cc93361b4306e9ee";
        hash = "sha256-ND5qPPZClLs1A57TngzImw8UrIJeKlQZkC+rETOks6Y=";
      };
    };
  });
  meta = {
    description = "The ability to use Python in the ament buildsystem in CMake.";
  };
})
