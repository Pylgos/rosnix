{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "log_view";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."log_view";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcl-interfaces rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" "xclip" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "log_view" = substituteSource {
        src = fetchgit {
          name = "log_view-source";
          url = "https://github.com/ros2-gbp/log_view-release.git";
          rev = "ff1a54425af28293ecfc43bb470bb8d633dec1c5";
          hash = "sha256-kDoFGgmKSU4dUcWtTd3uzCR/u+kjw3SgvQOuhOtToGM=";
        };
      };
    });
  };
  meta = {
    description = "The log_view package provides a ncurses based terminal GUI for viewing and filtering published ROS log messages. This is an alternative to rqt_console and swri_console that doesn't depend on qt and can be run directly in a terminal.";
  };
})
