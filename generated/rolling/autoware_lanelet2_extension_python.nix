{
  ament_cmake_auto,
  ament_cmake_ros,
  autoware_cmake,
  autoware_lanelet2_extension,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lanelet2_core,
  lanelet2_io,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  python3Packages,
  python_cmake_module,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    autoware_lanelet2_extension_python = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension_python-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "290ac71ce504df73077b445d25590e023e956a83";
        hash = "sha256-eZTubJSRZSC6f6OUDOrrU2+cBxk8gEF9gHa/1Yj0I/8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_lanelet2_extension_python";
  version = "0.5.0-1";
  src = sources.autoware_lanelet2_extension_python;
  nativeBuildInputs = [ ament_cmake_auto autoware_cmake python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ autoware_lanelet2_extension geometry_msgs lanelet2_core lanelet2_io lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules lanelet2_validation python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_ros ];
  missingDependencies = [  ];
  meta = {
    description = "The autoware_lanelet2_extension_python package contains Python bindings for lanelet2_extension package";
  };
}
