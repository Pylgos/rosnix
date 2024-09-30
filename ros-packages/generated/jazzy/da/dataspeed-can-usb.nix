{
  ament-cmake,
  ament-cmake-gtest,
  buildRosPackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lusb,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "dataspeed_can_usb" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_usb-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "fd9e730828c76794727d487dcbdf04df6bb1c976";
        hash = "sha256-MEqRh40rqPPZKh38w3FJEACnlHS8d8pk63+Mp5sdWkM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dataspeed_can_usb";
  version = "2.0.4-1";
  src = sources."dataspeed_can_usb";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ can-msgs lusb rclcpp rclcpp-components std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver to interface with the Dataspeed Inc. USB CAN Tool";
  };
}
