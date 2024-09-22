{
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    microstrain_inertial_msgs = substituteSource {
      src = fetchFromGitHub {
        name = "microstrain_inertial_msgs-source";
        owner = "ros2-gbp";
        repo = "microstrain_inertial-release";
        rev = "25dfc5a557004e2f71383cd20bc807d3f4c2b680";
        hash = "sha256-PeKXv1/tOxe0ML45M74+JehJ/xq8DuPKe1yVSVEhXOY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_msgs";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_msgs;
  nativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package that contains ROS message corresponding to microstrain message types.";
  };
}
