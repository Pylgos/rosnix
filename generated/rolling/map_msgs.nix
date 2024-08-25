{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    map_msgs = substituteSource {
      src = fetchgit {
        name = "map_msgs-source";
        url = "https://github.com/ros2-gbp/navigation_msgs-release.git";
        rev = "e8b77b13c76675dc8907ea9cda406140e6ab9329";
        hash = "sha256-Q/OE5g9D3e+mCr5txkE0Ipbd1c2MmAi/5WISTZXHyd0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "map_msgs";
  version = "2.5.0-1";
  src = sources.map_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nav_msgs rosidl_default_runtime sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "This package defines messages commonly used in mapping packages.";
  };
}
