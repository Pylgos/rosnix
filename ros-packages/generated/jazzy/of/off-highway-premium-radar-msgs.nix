{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_premium_radar_msgs";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."off_highway_premium_radar_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_premium_radar_msgs" = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar_msgs-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "172e817e458842cc5c1a162ded6a9209781ada6e";
        hash = "sha256-HqzYYBLHwHd1sxc3j4L6tyN4Hs35vNqk+Qx+/z16EnE=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar_msgs package";
  };
})
