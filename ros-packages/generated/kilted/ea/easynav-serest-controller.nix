{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  easynav-common,
  easynav-core,
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
  pname = "easynav_serest_controller";
  version = "0.3.1-1";
  src = finalAttrs.passthru.sources."easynav_serest_controller";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ easynav-common easynav-core geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ easynav-common easynav-core geometry-msgs nav-msgs pluginlib tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common rclcpp-lifecycle std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "easynav_serest_controller" = substituteSource {
      src = fetchgit {
        name = "easynav_serest_controller-source";
        url = "https://github.com/EasyNavigation/easynav_plugins-release.git";
        rev = "cd6d5cb2eee5e7812b0de804a26f4025fb851c07";
        hash = "sha256-izfpT/ijkbB6lnlVoxNKlRIHj4dWaVITJNNtUpXZJRA=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: SeReST Controller package.";
  };
})
