{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_spatial = substituteSource {
      src = fetchgit {
        name = "phidgets_spatial-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "089fa8bf3aade8c1a78df5c040bffa2c4ba35742";
        hash = "sha256-My63osp4yOvSPXWqo60ZVvGbG6cF/ApGd5AegiOUg/M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_spatial";
  version = "2.3.3-2";
  src = sources.phidgets_spatial;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch phidgets_api rclcpp rclcpp_components sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for the Phidgets Spatial 3/3/3 devices";
  };
}
