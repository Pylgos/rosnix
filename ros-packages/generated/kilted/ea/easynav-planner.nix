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
  version = "0.3.2-1";
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
        rev = "bad529a7821e975db0ada3a1f90064890c1ca899";
        hash = "sha256-/8+o6ROfM6QVat1/xyC5XgxAdwTYPIhRPzH6SgKoFZQ=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: Planner package.";
  };
})
