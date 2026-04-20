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
  version = "0.2.1-2";
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
        rev = "301daa084317d08ee0fcb8ef362a48a2241543bf";
        hash = "sha256-F1O00AWNwf+q99KmJMMAdrOEITKpVizTi3yUmqTfdtk=";
      };
    };
  });
  meta = {
    description = "Easy Navigation: SeReST Controller package.";
  };
})
