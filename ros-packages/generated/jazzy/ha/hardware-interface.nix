{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
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
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sdformat-urdf,
  substituteSource,
  tinyxml2-vendor,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hardware_interface";
  version = "4.26.0-1";
  src = finalAttrs.passthru.sources."hardware_interface";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ backward-ros control-msgs joint-limits lifecycle-msgs pluginlib rclcpp-lifecycle rcpputils rcutils realtime-tools sdformat-urdf tinyxml2-vendor urdf ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "hardware_interface" = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "5bd9c1405153af13d618ff8b00c7b57b61f3ba75";
        hash = "sha256-mAjRhLwrtGTsWDhKWDLSdozTms38sHMNFEeoOFnw5Co=";
      };
    };
  });
  meta = {
    description = "ros2_control hardware interface";
  };
})
