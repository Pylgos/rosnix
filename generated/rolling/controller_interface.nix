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
        rev = "395b7235a8aa1c1030a5530f94d048b8ce9a3e0d";
        hash = "sha256-zL+lvx/oJf+mQkPW/mHjrhm80OZDj9GJNdlNFSpDxWg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "controller_interface";
  version = "4.16.0-1";
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
