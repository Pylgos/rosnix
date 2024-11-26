{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_interfaces";
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."rosbag2_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosbag2_interfaces" = substituteSource {
        src = fetchgit {
          name = "rosbag2_interfaces-source";
          url = "https://github.com/ros2-gbp/rosbag2-release.git";
          rev = "4e4ced1677fd2d87ff58e1e0b55c1fb121108020";
          hash = "sha256-EqJ8lHBUDGWKT5+r4090Cq74fbzIOrJPuy2yglqiVW4=";
        };
      };
    });
  };
  meta = {
    description = "Interface definitions for controlling rosbag2";
  };
})
