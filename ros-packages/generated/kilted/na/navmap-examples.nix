{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav-msgs,
  navmap-core,
  navmap-ros,
  navmap-ros-interfaces,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "navmap_examples";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."navmap_examples";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nav-msgs navmap-core navmap-ros navmap-ros-interfaces rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav-msgs navmap-core navmap-ros navmap-ros-interfaces rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "navmap_examples" = substituteSource {
      src = fetchgit {
        name = "navmap_examples-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "af4be02bb0f62ce414ddcd9eacc31540e9723c28";
        hash = "sha256-KeoXg2wJp5y0P+uicTymA65/t5ASEceO5jsz7H+AvpI=";
      };
    };
  });
  meta = {
    description = "Examples related to navmap_core y navmap_ros.";
  };
})
