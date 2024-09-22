{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    osrf_pycommon = substituteSource {
      src = fetchFromGitHub {
        name = "osrf_pycommon-source";
        owner = "ros2-gbp";
        repo = "osrf_pycommon-release";
        rev = "77786223feb1aa12ee889310a09c68c575612f29";
        hash = "sha256-r7SjLNdaRpcA2w4gbir3vE/3B7hy6aHv2HUw8wJi8OI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_pycommon";
  version = "2.1.4-3";
  src = sources.osrf_pycommon;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-importlib-metadata" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Commonly needed Python modules, used by Python software developed at OSRF.";
  };
}
