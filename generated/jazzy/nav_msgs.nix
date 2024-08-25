{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    nav_msgs = substituteSource {
      src = fetchgit {
        name = "nav_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "296c753ed61df7932e9ddc07b399d9eb2f29fd7b";
        hash = "sha256-fSQ9CHh8TU+8S9dZkjjwH6zbyKtOdq/auWMvP7vPEKs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav_msgs";
  version = "5.3.5-1";
  src = sources.nav_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some navigation related message and service definitions.";
  };
}
