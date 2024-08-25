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
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_high_speed_encoder = substituteSource {
      src = fetchgit {
        name = "phidgets_high_speed_encoder-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "a4e500c0e6d045bebe29ff6b1a27ca5159d4e5ad";
        hash = "sha256-+tQ+vw/pWTXBDexHIJi6YokVycAl8GdJSxKQ6Lxj39Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_high_speed_encoder";
  version = "2.3.3-2";
  src = sources.phidgets_high_speed_encoder;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch phidgets_api phidgets_msgs rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for the Phidgets high speed encoder devices";
  };
}
