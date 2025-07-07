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
  rviz-assimp-vendor,
  rviz-ogre-vendor,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_rendering";
  version = "15.1.6-1";
  src = finalAttrs.passthru.sources."rviz_rendering";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-assimp-vendor rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp eigen3-cmake-module resource-retriever rviz-assimp-vendor rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common rviz-assimp-vendor ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_rendering" = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "edcf14a790e790197ba1bbbee6cd32b74703b99c";
        hash = "sha256-M9sFYopMhUqJ3Z77nxVSr6trMEXoBo2Wseo0b5qAxic=";
      };
    };
  });
  meta = {
    description = "\n    Library which provides the 3D rendering functionality in rviz.\n  ";
  };
})
