{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_controller";
  version = "0.3.2-1";
  src = finalAttrs.passthru.sources."easynav_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core geometry-msgs lifecycle-msgs pluginlib rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core geometry-msgs lifecycle-msgs pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_controller" = substituteSource {
      src = fetchgit {
        name = "easynav_controller-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "9a33e3115da2a5a7ed2fc21bc5ed9752b2efa772";
        hash = "sha256-hB0vhp64TnMbFRUgdr63SNTV+pNqWTT6Uyxb8zQm0UM=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Controller package.";
  };
})
