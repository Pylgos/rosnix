{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  realsense2-camera-msgs,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "realsense2_description";
  version = "4.55.1-3";
  src = finalAttrs.passthru.sources."realsense2_description";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ launch-ros rclcpp-components realsense2-camera-msgs xacro ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "realsense2_description" = substituteSource {
      src = fetchgit {
        name = "realsense2_description-source";
        url = "https://github.com/IntelRealSense/realsense-ros-release.git";
        rev = "dbdca2538210cac2b854291ba47f099df80224d9";
        hash = "sha256-Er8wmje8+L8O8X37B/c7pa22cwsjuK21LnWLzY2bo0c=";
      };
    };
  });
  meta = {
    description = "RealSense description package for Intel 3D D400 cameras";
  };
})
