{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can_msg_filters = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_msg_filters-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "71d4b786b6be88a3dadbf1f82472610c1eb7b910";
        hash = "sha256-b13Q1VZE/i+3zczFz59cp2UEbtBBLn81/hOsuARwwws=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dataspeed_can_msg_filters";
  version = "2.0.4-1";
  src = sources.dataspeed_can_msg_filters;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ can_msgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "Time synchronize multiple CAN messages to get a single callback";
  };
}
