{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
  easynav-simple-common,
  easynav-system,
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
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "easynav_mpc_controller";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_mpc_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core easynav-system geometry-msgs nav-msgs pluginlib tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libnlopt-cxx-dev" "libnlopt-dev" "libnlopt0" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core easynav-system geometry-msgs nav-msgs pluginlib tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libnlopt-cxx-dev" "libnlopt-dev" "libnlopt0" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common easynav-simple-common rclcpp-lifecycle std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_mpc_controller" = substituteSource {
      src = fetchgit {
        name = "easynav_mpc_controller-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "70d53182a1813b13160b6801f75c435ec237aef2";
        hash = "sha256-ePFd3GbOZG1mlVM9R3yclP7TV1XWDQN3Uu/7xHEOzms=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: MPC Controller package.";
  };
})
