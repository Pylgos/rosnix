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
  version = "0.2.5-1";
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
        rev = "0d372d06f4d99ae088c29bcd9fdcba6c65438521";
        hash = "sha256-8feWqlQwe9/rqcndfnsQRttclNOLt1t4aV1dSMuHQe0=";
      };
    };
  });
  meta = {
    description = "Examples related to navmap_core y navmap_ros.";
  };
})
