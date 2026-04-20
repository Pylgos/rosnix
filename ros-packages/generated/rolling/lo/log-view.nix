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
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."log_view";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcl-interfaces rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libncurses-dev" "xclip" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcl-interfaces rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libncurses-dev" "xclip" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "log_view" = substituteSource {
      src = fetchgit {
        name = "log_view-source";
        url = "https://github.com/ros2-gbp/log_view-release.git";
        rev = "66735278eb0c833ef6315652bab86d531bb81a8f";
        hash = "sha256-DQ1EuAI9K/NlPpdtMNPLS9ojgxZOroYaCCwHv6gQjHg=";
      };
    };
  });
  meta = {
    description = "\n    The log_view package provides a ncurses based terminal GUI for\n    viewing and filtering published ROS log messages.\n\n    This is an alternative to rqt_console and swri_console that doesn't depend\n    on qt and can be run directly in a terminal.\n  ";
  };
})
