{
  ament-cmake-mypy,
  ament-cmake-pytest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rcl-interfaces,
  rclpy,
  rmw-dds-common,
  ros2node,
  ros2service,
  ros2topic,
  rosSystemPackages,
  rosapi-msgs,
  rosbridge-library,
  sensor-msgs,
  shape-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosapi";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."rosapi";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl-interfaces rclpy ros2node ros2service ros2topic rosapi-msgs rosbridge-library ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rclpy ros2node ros2service ros2topic rosapi-msgs rosbridge-library ];
  checkInputs = [ ament-cmake-mypy ament-cmake-pytest geometry-msgs rmw-dds-common sensor-msgs shape-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosapi" = substituteSource {
      src = fetchgit {
        name = "rosapi-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "4ada2e6917abee9ffbe2a388012fa8808243bb74";
        hash = "sha256-EH+w3Bc5IfN6UyaM7VkfgbUulLNDlD4tkaUWjtKhrSY=";
      };
    };
  });
  meta = {
    description = "\n    Provides service calls for getting ros meta-information, like list of\n    topics, services, params, etc.\n  ";
  };
})
