{
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  resource-retriever,
  rosSystemPackages,
  rviz-ogre-vendor,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_rendering";
  version = "15.1.16-1";
  src = finalAttrs.passthru.sources."rviz_rendering";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "assimp" "assimp-dev" "eigen" "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6svg6" "qt6-base-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" "assimp-dev" "eigen" "libqt6-core" "libqt6gui6t64" "libqt6opengl6t64" "libqt6svg6" "qt6-base-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "assimp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz_rendering" = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "fb67f22e497a7e47831f835800ee33c4a54b13d8";
        hash = "sha256-molC0fC3jqR6s5bSVLdLJQWfbfwG7+IuJQOjjnD0cSU=";
      };
    };
  });
  meta = {
    description = "\n    Library which provides the 3D rendering functionality in rviz.\n  ";
  };
})
