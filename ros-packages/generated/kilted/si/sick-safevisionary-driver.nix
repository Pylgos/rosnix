{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  sick-safevisionary-base,
  sick-safevisionary-interfaces,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sick_safevisionary_driver";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."sick_safevisionary_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge lifecycle-msgs rclcpp rclcpp-lifecycle sensor-msgs sick-safevisionary-base sick-safevisionary-interfaces ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge lifecycle-msgs rclcpp rclcpp-lifecycle sensor-msgs sick-safevisionary-base sick-safevisionary-interfaces ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "sick_safevisionary_driver" = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_driver-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "85ce3279b73e3339f2962303cbd40bffec3ba808";
        hash = "sha256-WDvBObwCd8bV8M1RapWaz2Fegi8F0QSwtnpz2ijAZSc=";
      };
    };
  });
  meta = {
    description = "Provides an interface to read the sensor output of a SICK safeVisionary sensor in ROS 2";
  };
})
