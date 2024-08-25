{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  rclcpp_lifecycle,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    controller_interface = substituteSource {
      src = fetchgit {
        name = "controller_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "075d2722fb6e47ca4fbda94227a96e4b6b153c72";
        hash = "sha256-3moT3jFe/VEZpp9X7kJUVrd5iqRSIAklanIc0Vchogo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_interface";
  version = "4.15.0-1";
  src = sources.controller_interface;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface rclcpp_lifecycle sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock sensor_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Description of controller_interface";
  };
}
