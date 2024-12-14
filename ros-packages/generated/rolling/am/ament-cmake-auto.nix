{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_auto";
  version = "2.7.2-2";
  src = finalAttrs.passthru.sources."ament_cmake_auto";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_auto" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "b908a5ffbf3037095eea2189f566a810cf228ac4";
        hash = "sha256-vpZJMcF5uIt2itIFRbnLyxdwv1h3sDS+lNowK4URXjQ=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament buildsystem in CMake.";
  };
})
