{
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
  ros2param,
  ros2pkg,
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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rosapi";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rclpy ros2node ros2param ros2pkg ros2service ros2topic rosapi-msgs rosbridge-library ];
  checkInputs = [ ament-cmake-pytest geometry-msgs rmw-dds-common sensor-msgs shape-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosapi" = substituteSource {
      src = fetchgit {
        name = "rosapi-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "3585d6e0b12c08a749b91c78bb847dc61e25d779";
        hash = "sha256-MdizJo6Z9eAshzwDPfTu5T2l2lsIAO7jgboOubOcGk4=";
      };
    };
  });
  meta = {
    description = "Provides service calls for getting ros meta-information, like list of topics, services, params, etc.";
  };
})
