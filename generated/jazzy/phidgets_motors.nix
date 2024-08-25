{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  phidgets_msgs,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_motors = substituteSource {
      src = fetchgit {
        name = "phidgets_motors-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "afcc4b0c5a39676cf7c78dd6670bbda44a16740f";
        hash = "sha256-eF/wWphPu1aKOeoNItNTNLRGVPMMHtxzvEKCkgGwL+o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_motors";
  version = "2.3.3-2";
  src = sources.phidgets_motors;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch phidgets_api phidgets_msgs rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for the Phidgets Motor devices";
  };
}
