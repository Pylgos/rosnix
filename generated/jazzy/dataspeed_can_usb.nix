{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  lusb,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    dataspeed_can_usb = substituteSource {
      src = fetchFromGitHub {
        name = "dataspeed_can_usb-source";
        owner = "DataspeedInc-release";
        repo = "dataspeed_can-release";
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
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ can_msgs lusb rclcpp rclcpp_components std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver to interface with the Dataspeed Inc. USB CAN Tool";
  };
}
