{
  buildRosPackage,
  console_bridge_vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  tinyxml2_vendor,
  urdfdom_headers,
}:
let
  sources = rec {
    urdfdom = substituteSource {
      src = fetchgit {
        name = "urdfdom-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "e14e279e7907a5a05da330e07955eacd74163dee";
        hash = "sha256-g0ad4Vg+l8H2Pv4suUdF6WseUIeSWbeHIXY+Z5il3hc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom";
  version = "4.0.0-3";
  src = sources.urdfdom;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ console_bridge_vendor tinyxml2_vendor urdfdom_headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  meta = {
    description = "A library to access URDFs using the DOM model.";
  };
}
