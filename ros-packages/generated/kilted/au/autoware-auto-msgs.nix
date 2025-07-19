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
  version = "1.0.0-7";
  src = finalAttrs.passthru.sources."autoware_auto_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ action-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ action-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_auto_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_auto_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_auto_msgs-release.git";
        rev = "10b05049ac3041ebaa919466cce504e6912ec670";
        hash = "sha256-sPwNe2uGjV3WHz+htqZrzm5dUO1JvGJC9xQcn2d+LU0=";
      };
    };
  });
  meta = {
    description = "Interfaces between core Autoware.Auto components";
  };
})
