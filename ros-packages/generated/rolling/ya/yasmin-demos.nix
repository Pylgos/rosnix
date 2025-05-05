{
  ament-cmake,
  ament-cmake-python,
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentCmakePackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclpy,
  ros-environment,
  rosSystemPackages,
  substituteSource,
  yasmin,
  yasmin-ros,
  yasmin-viewer,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_demos";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."yasmin_demos";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ example-interfaces nav-msgs rclcpp rclpy ros-environment yasmin yasmin-ros yasmin-viewer ];
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ example-interfaces nav-msgs rclcpp rclpy ros-environment yasmin yasmin-ros yasmin-viewer ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "yasmin_demos" = substituteSource {
      src = fetchgit {
        name = "yasmin_demos-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "fbd575937b94a738a99df7785daed65b587ae83c";
        hash = "sha256-2NpDTf/yjIf+eAmqCre4unJhZ/kKFwjwTV9GyLifeko=";
      };
    };
  });
  meta = {
    description = "Demos of YASMIN (Yet Another State MachINe)";
  };
})
