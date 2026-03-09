{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mbf-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mbf_test_utility";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."mbf_test_utility";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs mbf-msgs nav-msgs rclcpp tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mbf-msgs nav-msgs rclcpp tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "mbf_test_utility" = substituteSource {
      src = fetchgit {
        name = "mbf_test_utility-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "d889849b8434308ab3f3f9a7949f142467318f6d";
        hash = "sha256-af1+5EgnUO/AaxxMMObgEG5x/FJ3HlmuA4fTxe+R+0c=";
      };
    };
  });
  meta = {
    description = " Contains tools that help with testing move base flex modules. This package should\n    only be used as a test dependency. If some tool shall be used in production, move it into\n    mbf_utility for example. ";
  };
})
