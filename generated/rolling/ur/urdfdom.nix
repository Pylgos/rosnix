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
    urdfdom-219e7797dce15141726018c46fc5e22c4b49a23a = substituteSource {
      src = fetchgit {
        name = "urdfdom-219e7797dce15141726018c46fc5e22c4b49a23a-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "219e7797dce15141726018c46fc5e22c4b49a23a";
        hash = "sha256-g0ad4Vg+l8H2Pv4suUdF6WseUIeSWbeHIXY+Z5il3hc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdfdom";
  version = "4.0.0-2";
  src = sources.urdfdom-219e7797dce15141726018c46fc5e22c4b49a23a;
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
