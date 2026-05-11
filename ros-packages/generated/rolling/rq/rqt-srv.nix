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
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_srv";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."rqt_srv";
  propagatedNativeBuildInputs = [ rqt-gui rqt-gui-py rqt-msg ];
  propagatedBuildInputs = [ rqt-gui rqt-gui-py rqt-msg ];
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_srv" = substituteSource {
      src = fetchgit {
        name = "rqt_srv-source";
        url = "https://github.com/ros2-gbp/rqt_srv-release.git";
        rev = "dd9ff1776d29bd2c63b73553309e6cb230810343";
        hash = "sha256-2fuACmHazPnJiLjPs9937isDdteCGH4RupV67UJYqM8=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS service types.";
  };
})
