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
let
  sources = mkSourceSet (sources: {
    "rviz_rendering" = substituteSource {
      src = fetchgit {
        name = "rviz_rendering-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "adbabeb9bbe2b617bff6368d786afb8c83e4238c";
        hash = "sha256-XSEBeHmnygX7/rj1OOArOGP1fkWSSHtgGUmcP/2iJpc=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_rendering";
  version = "14.3.1-1";
  src = finalAttrs.passthru.sources."rviz_rendering";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3-cmake-module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp resource-retriever rviz-assimp-vendor rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common rviz-assimp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Library which provides the 3D rendering functionality in rviz.";
  };
})
