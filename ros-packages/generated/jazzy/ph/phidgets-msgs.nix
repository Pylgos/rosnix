{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_msgs";
  version = "2.3.3-2";
  src = finalAttrs.passthru.sources."phidgets_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_msgs" = substituteSource {
      src = fetchgit {
        name = "phidgets_msgs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "5362a78082f7eee98478e8b0eeb8f85041be1202";
        hash = "sha256-IenMv0kesMXll/udluqu/FKfShQu8sd0QaGFr+rW4/E=";
      };
    };
  });
  meta = {
    description = "Custom ROS messages for Phidgets drivers";
  };
})
