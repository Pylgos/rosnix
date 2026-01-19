{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-controller,
  easynav-interfaces,
  easynav-localizer,
  easynav-maps-manager,
  easynav-planner,
  easynav-sensors,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_system";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_system";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-controller easynav-interfaces easynav-localizer easynav-maps-manager easynav-planner easynav-sensors geometry-msgs lifecycle-msgs nav-msgs rclcpp rclcpp-lifecycle sensor-msgs tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-controller easynav-interfaces easynav-localizer easynav-maps-manager easynav-planner easynav-sensors geometry-msgs lifecycle-msgs nav-msgs rclcpp rclcpp-lifecycle sensor-msgs tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_system" = substituteSource {
      src = fetchgit {
        name = "easynav_system-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "3d281a2bbf832a63f3f22f96589a19b23e0bc228";
        hash = "sha256-UIXkqFIIa+yZfB3rlL1L+Pm9wEPKxLXHSOLK76MVnbA=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: System package.";
  };
})
