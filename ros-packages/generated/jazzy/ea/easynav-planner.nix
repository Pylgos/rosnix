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
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_planner";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."easynav_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core lifecycle-msgs nav-msgs pluginlib rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core lifecycle-msgs nav-msgs pluginlib rclcpp rclcpp-lifecycle ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_planner" = substituteSource {
      src = fetchgit {
        name = "easynav_planner-source";
        url = "https://github.com/EasyNavigation/EasyNavigation-release.git";
        rev = "9c038060bef1627ff7d5a242ebaa8d34e72fd1d1";
        hash = "sha256-Rye8cJVc9V0hvG/MdgtYxWvGL2iVGKF7Q/YUV3Bo64A=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Planner package.";
  };
})
