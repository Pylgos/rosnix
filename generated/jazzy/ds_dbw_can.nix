{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  dataspeed_can_msg_filters,
  dataspeed_can_usb,
  ds_dbw_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ds_dbw_can = substituteSource {
      src = fetchgit {
        name = "ds_dbw_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "491aaf1b09695f08790ecab8d0d1f046532df2f8";
        hash = "sha256-5tNo8sZUZ4s4XPOC7pA9BwYdAYWNVkQu5x62aM1DeD0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ds_dbw_can";
  version = "2.2.0-1";
  src = sources.ds_dbw_can;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs dataspeed_can_msg_filters dataspeed_can_usb ds_dbw_msgs rclcpp rclcpp_components sensor_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Interface to the Dataspeed Inc. Drive-By-Wire kit";
  };
}
