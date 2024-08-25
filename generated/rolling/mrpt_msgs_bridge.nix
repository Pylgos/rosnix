{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mrpt2,
  mrpt_msgs,
  ros_environment,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    mrpt_msgs_bridge = substituteSource {
      src = fetchgit {
        name = "mrpt_msgs_bridge-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "aa80085c5520a2ade02e534cb0011fb643278b6e";
        hash = "sha256-6Ian4Rg8Nk1KoESjpE+66LPN4lTn7FCSgu/hqLVq6bo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_msgs_bridge";
  version = "2.1.0-1";
  src = sources.mrpt_msgs_bridge;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs mrpt2 mrpt_msgs tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "C++ library to convert between custom mrpt_msgs messages and native MRPT classes";
  };
}
