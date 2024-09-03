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
        rev = "101c249e03b7515a974db850293e29a8c1d3ea57";
        hash = "sha256-gbI1wo1cYacZ1nX7ea3HDV9XcB89gM2ZtbIchHvR218=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_nav_interfaces";
  version = "2.1.1-1";
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
