{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    autoware_system_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_system_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "96963a77d17c584973cd52f3e86f4b2c21b3272c";
        hash = "sha256-hbYa4pl/hLWUDxk+gN234i8Vz2MlS3Jfi1xp8aHXvqY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_system_msgs";
  version = "1.1.0-1";
  src = sources.autoware_system_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces diagnostic_msgs geometry_msgs nav_msgs rosidl_default_runtime std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Autoware system messages package.";
  };
}
