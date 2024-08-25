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
    mrpt_nav_interfaces = substituteSource {
      src = fetchgit {
        name = "mrpt_nav_interfaces-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "812a604f89f86ceb6dec91d220bad54bbdebcbf1";
        hash = "sha256-BjW0QVZtaZaTxoQtKeQc4kMUTJfsbRu8EXIOkeNfQCU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_nav_interfaces";
  version = "2.1.0-1";
  src = sources.mrpt_nav_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs mrpt_msgs nav_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Message, services, and actions, for other mrpt navigation packages.";
  };
}
