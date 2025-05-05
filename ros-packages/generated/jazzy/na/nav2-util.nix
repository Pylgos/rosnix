{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  bond,
  bondcpp,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-msgs,
  rcl-interfaces,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  test-msgs,
  tf2,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_util";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ bond bondcpp builtin-interfaces geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav-msgs rcl-interfaces rclcpp rclcpp-action rclcpp-lifecycle std-msgs tf2 tf2-geometry-msgs tf2-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bond bondcpp builtin-interfaces geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav-msgs rcl-interfaces rclcpp rclcpp-action rclcpp-lifecycle std-msgs tf2 tf2-geometry-msgs tf2-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common std-srvs test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_util" = substituteSource {
      src = fetchgit {
        name = "nav2_util-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "5456d93deb6206a9e01d9db833eed0093a3e1bd5";
        hash = "sha256-aMGGKXNR7I6o83Puzm4tgHQPngeT0p0NcsNNfSCM+OM=";
      };
    };
  });
  meta = {
    description = "Nav2 utilities";
  };
})
