{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  buildRosPackage,
  control-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-limits,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  rcpputils,
  rcutils,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
  urdf,
}:
let
  sources = mkSourceSet (sources: {
    "hardware_interface" = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "a116b86760fb2e5f0965222dcad43d256f23d587";
        hash = "sha256-t8V1n7J5d0jVv1GdCgEEKWHSY8kG7+1qOArqQEJGY6M=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "hardware_interface";
  version = "4.18.0-1";
  src = finalAttrs.passthru.sources."hardware_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control-msgs joint-limits lifecycle-msgs pluginlib rclcpp-lifecycle rcpputils rcutils tinyxml2-vendor urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ros2_control hardware interface";
  };
})
