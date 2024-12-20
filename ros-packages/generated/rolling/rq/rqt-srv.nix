{
  ament-flake8,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  rqt-msg,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_srv";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."rqt_srv";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg ];
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_srv" = substituteSource {
      src = fetchgit {
        name = "rqt_srv-source";
        url = "https://github.com/ros2-gbp/rqt_srv-release.git";
        rev = "8bc139677527cc18250f52699b8f545105d22b58";
        hash = "sha256-g2273HGG1SAs9s3imB+LXJZde80qFz583t6NdQOdQxM=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS service types.";
  };
})
