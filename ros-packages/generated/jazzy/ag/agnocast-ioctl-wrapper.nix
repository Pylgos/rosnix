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
  pname = "agnocast_ioctl_wrapper";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."agnocast_ioctl_wrapper";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_ioctl_wrapper" = substituteSource {
      src = fetchgit {
        name = "agnocast_ioctl_wrapper-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "592cd1c80417057d6bb007f05eb35bb3c29cc64d";
        hash = "sha256-x/y32mHUPEGjBpCNcg0lXd3pQKDOa8ubrkvVIKgq108=";
      };
    };
  });
  meta = {
    description = "\n    The wrapper of ioctl for command line tool extension for Agnocast.\n  ";
  };
})
