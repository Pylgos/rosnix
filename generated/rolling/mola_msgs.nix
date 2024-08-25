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
        rev = "5c607144ff278be9012e57ccebc0f4552b5f63dd";
        hash = "sha256-HOu0ilWHVGL2YZ2048sKBSySBW0JR1xutXvB6E65b1U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_msgs";
  version = "1.1.0-1";
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
