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
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."rmf_traffic_editor";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp rmf-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" "libgoogle-glog-dev" "libqt5-concurrent" "libqt5-widgets" "proj" "qtbase5-dev" "yaml-cpp" ]; };
  checkInputs = [ ament-cmake-uncrustify rmf-utils ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_traffic_editor" = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "a17b109599bbc97db4b07b9f9d6a490a7475f491";
        hash = "sha256-/bCf//VJVmOLJCSaTg1j/g7qr0BfYLnLrUdf0C5cX+4=";
      };
    };
  });
  meta = {
    description = "traffic editor";
  };
})
