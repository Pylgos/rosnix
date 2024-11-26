{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_console_util";
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_console_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "swri_console_util" = substituteSource {
      src = fetchgit {
        name = "swri_console_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "a2106748187eee41a9ca5b4d5bc3dbd15005d013";
        hash = "sha256-kzSZInTsgWLY1tBOwqmsKcv6dwgmwwBvI5E5C+WzLDo=";
      };
    };
  });
  meta = {
    description = "Utility functions for interacting with console";
  };
})
