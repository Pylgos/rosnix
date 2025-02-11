{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-ros,
  launch-testing,
  message-filters,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_amcl";
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."nav2_amcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs launch-ros launch-testing message-filters nav2-common nav2-msgs nav2-util nav-msgs pluginlib rclcpp sensor-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_amcl" = substituteSource {
      src = fetchgit {
        name = "nav2_amcl-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "f4e6f6ed9d72f8dc6c7bfbc1abc5fa749e1da130";
        hash = "sha256-M8Iu09hp0+nPAjhSfREjM/LdNtSyEdhqAFSNDbbAXno=";
      };
    };
  });
  meta = {
    description = "";
  };
})
