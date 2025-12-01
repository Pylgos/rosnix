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
  version = "0.4.0-1";
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
        rev = "2f65af364713af39741c341a045fecc7e363d564";
        hash = "sha256-N/4AOhCX94cMy7tKTkmrjDRk1aLiC5RVznmUH6BGKnw=";
      };
    };
  });
  meta = {
    description = "Examples related to navmap_core y navmap_ros.";
  };
})
