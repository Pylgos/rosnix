{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-simple-common,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_simple_controller";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."easynav_simple_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common easynav-simple-common rclcpp-lifecycle std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_simple_controller" = substituteSource {
      src = fetchgit {
        name = "easynav_simple_controller-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "e3ffa55b951a7821a3b0d8b2a73ae7aee5ec0ec4";
        hash = "sha256-rGZZJtl6+FrDYbOvtRXNasPhTasMlEoa9VjPYDZ2b3o=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Simple Controller package.";
  };
})
