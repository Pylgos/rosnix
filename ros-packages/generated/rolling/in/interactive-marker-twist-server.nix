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
  version = "2.1.0-2";
  src = finalAttrs.passthru.sources."interactive_marker_twist_server";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ geometry-msgs interactive-markers tf2 visualization-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "interactive_marker_twist_server" = substituteSource {
      src = fetchgit {
        name = "interactive_marker_twist_server-source";
        url = "https://github.com/ros2-gbp/interactive_marker_twist_server-release.git";
        rev = "a614494c6cd56baf9e33e1f965c91cab37f76cb9";
        hash = "sha256-FvPQhN5z6jkYZtScraxOUe3bjI3cA495ni/sp/Hh7uk=";
      };
    };
  });
  meta = {
    description = "Interactive control for generic Twist-based robots using interactive markers";
  };
})
