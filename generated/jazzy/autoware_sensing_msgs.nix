{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
    autoware_sensing_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_sensing_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "e98f5ddafae33a61b45c6bf7c70122c1d3454ac3";
        hash = "sha256-tnSGZtUUErZDyMsltqWrm00QGikUuXEXi1SxlOzRXWY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_sensing_msgs";
  version = "1.1.0-1";
  src = sources.autoware_sensing_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Autoware sensing messages package.";
  };
}
