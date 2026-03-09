{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mbf-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mbf_utility";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."mbf_utility";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs mbf-msgs rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs mbf-msgs rclcpp tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mbf_utility" = substituteSource {
      src = fetchgit {
        name = "mbf_utility-source";
        url = "https://github.com/ros2-gbp/move_base_flex-release.git";
        rev = "878fe3cda981846778464c468ead3546214c6003";
        hash = "sha256-pk0OSfqumcTAcQRYNW1XyJRsShX6xLzvdZ5T6DEkV8Y=";
      };
    };
  });
  meta = {
    description = "The mbf_utility package";
  };
})
