{
  ament-cmake,
  ament-cmake-uncrustify,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-utils,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_traffic_editor";
  version = "1.9.2-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  propagatedBuildInputs = [ rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" "libgoogle-glog-dev" "libqt5-concurrent" "libqt5-widgets" "proj" "qtbase5-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-uncrustify rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "1b812415e3d278ff2a30ac398209047718a8c563";
        hash = "sha256-iGa/t+mLPunqD1xTOC8GHa/YHYcP7JcYiajVKLFF5js=";
      };
    };
  });
  meta = {
    description = "traffic editor";
  };
})
