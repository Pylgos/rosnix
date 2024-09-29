{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "microstrain_inertial_msgs" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_msgs-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "257256a1d14c4960778d9bdbf8c41c36ce17b1bc";
        hash = "sha256-PeKXv1/tOxe0ML45M74+JehJ/xq8DuPKe1yVSVEhXOY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "microstrain_inertial_msgs";
  version = "4.3.0-1";
  src = sources."microstrain_inertial_msgs";
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