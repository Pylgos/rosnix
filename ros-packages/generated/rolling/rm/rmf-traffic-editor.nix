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
  version = "1.14.0-2";
  src = finalAttrs.passthru.sources."rmf_traffic_editor";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake ament-index-cpp rmf-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libceres-dev" "libgoogle-glog-dev" "libqt5-concurrent" "libqt5-widgets" "proj" "qtbase5-dev" "yaml-cpp" ]; };
  propagatedBuildInputs = [ ament-cmake ament-index-cpp rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" "libgoogle-glog-dev" "libqt5-concurrent" "libqt5-widgets" "proj" "qtbase5-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-uncrustify rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "b1488a7d168769fb1ff283f0e33f4ca57bd2f49d";
        hash = "sha256-7n/gB8ixDWv2m3v/jDqDp+S+1oWfiiwARLCp3t6eyuk=";
      };
    };
  });
  meta = {
    description = "traffic editor";
  };
})
