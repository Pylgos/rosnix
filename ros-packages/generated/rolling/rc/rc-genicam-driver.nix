{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildRosPackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rc-common-msgs,
  rc-genicam-api,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  stereo-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rc_genicam_driver" = substituteSource {
      src = fetchgit {
        name = "rc_genicam_driver-source";
        url = "https://github.com/ros2-gbp/rc_genicam_driver_ros2-release.git";
        rev = "54ae34d134aaab76623d61c9728d34503bc68b26";
        hash = "sha256-DXGpRFliAauxi+eYKJddSkZfNo9jJ/5UsxBtJEkSdCs=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rc_genicam_driver";
  version = "0.3.1-1";
  src = sources."rc_genicam_driver";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic-updater image-transport rc-common-msgs rc-genicam-api rclcpp rclcpp-components sensor-msgs stereo-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-xmllint ament-lint-auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for rc_visard and rc_cube from Roboception GmbH";
  };
}
