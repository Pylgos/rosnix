{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
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
  pname = "ouster_sensor_msgs";
  version = "0.11.1-5";
  src = finalAttrs.passthru.sources."ouster_sensor_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ouster_sensor_msgs" = substituteSource {
        src = fetchgit {
          name = "ouster_sensor_msgs-source";
          url = "https://github.com/ros2-gbp/ouster-ros-release.git";
          rev = "94d5338c7cae844e9bcf539f6ed45d550331ba35";
          hash = "sha256-fWka9voPQDtcLHrGdOeYmWY8U9UNQhMwTOlIudhLi28=";
        };
      };
    });
  };
  meta = {
    description = "ouster_ros message and service definitions";
  };
})
