{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_rclcpp";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."autoware_utils_rclcpp";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-lint-auto autoware-lint-common std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_rclcpp" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_rclcpp-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "0894434b4d0f1dd9c9e8b9b090489151002dfe23";
        hash = "sha256-cLeiITgRP9u/wABTVgAtGYNcrg8USS3gqtEXkm+wCSQ=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_rclcpp package";
  };
})
