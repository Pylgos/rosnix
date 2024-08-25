{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_interfaces = substituteSource {
      src = fetchgit {
        name = "rosbag2_interfaces-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "cf10934c20192408430e4f989a02163fc7e329be";
        hash = "sha256-a8VlWj+jyXbgQgb+RcRu2y5YKRC4co6gFj0lMyV4IvE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_interfaces";
  version = "0.26.4-1";
  src = sources.rosbag2_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Interface definitions for controlling rosbag2";
  };
}
