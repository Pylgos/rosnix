{
  ament-cmake,
  ament-cmake-gtest,
  buildRosPackage,
  can-msgs,
  dataspeed-can-msg-filters,
  dataspeed-can-usb,
  ds-dbw-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ds_dbw_can" = substituteSource {
      src = fetchgit {
        name = "ds_dbw_can-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "491aaf1b09695f08790ecab8d0d1f046532df2f8";
        hash = "sha256-5tNo8sZUZ4s4XPOC7pA9BwYdAYWNVkQu5x62aM1DeD0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ds_dbw_can";
  version = "2.2.0-1";
  src = sources."ds_dbw_can";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ can-msgs dataspeed-can-msg-filters dataspeed-can-usb ds-dbw-msgs rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Interface to the Dataspeed Inc. Drive-By-Wire kit";
  };
}
