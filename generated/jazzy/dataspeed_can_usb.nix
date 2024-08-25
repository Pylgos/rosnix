{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lusb,
  rclcpp,
  rclcpp_components,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can_usb = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_usb-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "fd9e730828c76794727d487dcbdf04df6bb1c976";
        hash = "sha256-MEqRh40rqPPZKh38w3FJEACnlHS8d8pk63+Mp5sdWkM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_can_usb";
  version = "2.0.4-1";
  src = sources.dataspeed_can_usb;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs lusb rclcpp rclcpp_components std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Driver to interface with the Dataspeed Inc. USB CAN Tool";
  };
}
