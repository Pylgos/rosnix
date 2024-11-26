{
  ament-cmake,
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
  pname = "rc_common_msgs";
  version = "0.5.3-6";
  src = finalAttrs.passthru.sources."rc_common_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rc_common_msgs" = substituteSource {
        src = fetchgit {
          name = "rc_common_msgs-source";
          url = "https://github.com/ros2-gbp/rc_common_msgs_ros2-release.git";
          rev = "a1a39a8b05b4be20838bc8acec4af66a3f0d90dd";
          hash = "sha256-/ApqcAoxtUu0eHcF5gxxFhroOIdz457iCAONfAC2xxQ=";
        };
      };
    });
  };
  meta = {
    description = "Common msg and srv definitions used by Roboception's ROS2 packages";
  };
})
