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
        rev = "ce7edd4ab704996a79d401ba671b9399fc04c8de";
        hash = "sha256-t+oMUSSHr3qtX9MkmD87Ri8oU7R8ky256Unjl4lu4oo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_interfaces";
  version = "0.28.0-1";
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
