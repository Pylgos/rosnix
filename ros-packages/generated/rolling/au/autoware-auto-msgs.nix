{
  action-msgs,
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_auto_msgs";
  version = "1.0.0-6";
  src = finalAttrs.passthru.sources."autoware_auto_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs geometry-msgs rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "autoware_auto_msgs" = substituteSource {
        src = fetchgit {
          name = "autoware_auto_msgs-source";
          url = "https://github.com/ros2-gbp/autoware_auto_msgs-release.git";
          rev = "b7d7292d4d73d6fc0ab5406086104f9a5012b267";
          hash = "sha256-sPwNe2uGjV3WHz+htqZrzm5dUO1JvGJC9xQcn2d+LU0=";
        };
      };
    });
  };
  meta = {
    description = "Interfaces between core Autoware.Auto components";
  };
})
