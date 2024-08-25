{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    autoware_internal_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_internal_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "f74baae445e0a1ec57de8d08ba468540b3f02002";
        hash = "sha256-DqEUabWDDD8N8YSpZyB/5hJgvPbmkMCKoY9SJgfh/Q4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_internal_msgs";
  version = "1.1.0-1";
  src = sources.autoware_internal_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Autoware internal messages package.";
  };
}
