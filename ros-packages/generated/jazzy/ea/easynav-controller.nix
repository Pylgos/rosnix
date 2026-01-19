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
  version = "0.2.2-1";
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
        rev = "ff5100bc355cef79c90f6156b3f57e1bbc9759f7";
        hash = "sha256-qhTrj8Ll+qPzDmNVoGTngunsDc8+QuwsQbBkieWmaik=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Controller package.";
  };
})
