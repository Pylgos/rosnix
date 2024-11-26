{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  interactive-markers,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "interactive_marker_twist_server";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."interactive_marker_twist_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs interactive-markers rclcpp tf2 visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "interactive_marker_twist_server" = substituteSource {
        src = fetchgit {
          name = "interactive_marker_twist_server-source";
          url = "https://github.com/ros2-gbp/interactive_marker_twist_server-release.git";
          rev = "86045d0aabbf882b4f54941510b65ac357846abb";
          hash = "sha256-09yOPHNNaMnQ74PvxlJRcDeLXktVm6n/ftEOa55NlPA=";
        };
      };
    });
  };
  meta = {
    description = "Interactive control for generic Twist-based robots using interactive markers";
  };
})
