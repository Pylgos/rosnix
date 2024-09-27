{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_msgs,
  nav_msgs,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    mola_msgs-20f285254618a19e5e9e068ea6c24b7a46463d52 = substituteSource {
      src = fetchgit {
        name = "mola_msgs-20f285254618a19e5e9e068ea6c24b7a46463d52-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "20f285254618a19e5e9e068ea6c24b7a46463d52";
        hash = "sha256-RNi/7/Rpp76lCI0zr9jWE4KIpxz4sjJzDbcn1sWLmWE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_msgs";
  version = "1.2.0-1";
  src = sources.mola_msgs-20f285254618a19e5e9e068ea6c24b7a46463d52;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action_msgs mrpt_msgs nav_msgs rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
}
