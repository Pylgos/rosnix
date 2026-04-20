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
  version = "0.2.1-2";
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
        rev = "07aac2f7d7e11efb685ba5aef1571d9e9b410452";
        hash = "sha256-Ej8BVAmIsQFMGylY7Oo086X63Qg+51Ryir0PSby9A0U=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: MPC Controller package.";
  };
})
