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
  version = "14.3.3-1";
  src = finalAttrs.passthru.sources."rviz_rendering";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ ament-index-cpp resource-retriever rviz-assimp-vendor rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common rviz-assimp-vendor ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rviz_rendering" = substituteSource {
        src = fetchgit {
          name = "rviz_rendering-source";
          url = "https://github.com/ros2-gbp/rviz-release.git";
          rev = "0406867709dfe7909c473f1e918844eb31cd34cc";
          hash = "sha256-3GzMqZxJYkSRZTIyaD+rrOJ+iMKpQHUsj3BQTI1iWGY=";
        };
      };
    });
  };
  meta = {
    description = "Library which provides the 3D rendering functionality in rviz.";
  };
})
