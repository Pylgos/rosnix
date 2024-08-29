{
  action_msgs,
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_msgs,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    mola_msgs = substituteSource {
      src = fetchgit {
        name = "mola_msgs-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "137e43bce4850b2bd67ac603f7cfac1fbbb80458";
        hash = "sha256-TkBSBMR/KR+BxDbtei8rIcU2AvPXyIay6uDfevmz4iY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_msgs";
  version = "1.1.3-1";
  src = sources.mola_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs mrpt_msgs nav_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS message, services, and actions used in other MOLA packages.";
  };
}
